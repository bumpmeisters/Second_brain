"""Create-only review runs derived from admitted portions of acquisition runs."""
import hashlib
import json

from youtube_intelligence import iso_utc


def publish(app, parent_id, validate_only=False):
    app._require_l2_authority()
    c = app.connect()
    try:
        parent = dict(c.execute('SELECT * FROM runs WHERE run_id=?', (parent_id,)).fetchone())
        if parent['trigger_type'] == 'semantic-snapshot':
            raise RuntimeError('A semantic snapshot cannot be an acquisition parent')
        manifest = json.loads(parent['manifest_json'])
        unsigned = {k: v for k, v in manifest.items() if k != 'manifest_sha256'}
        digest = hashlib.sha256(json.dumps(unsigned, ensure_ascii=False, sort_keys=True,
                                           separators=(',', ':')).encode()).hexdigest().upper()
        if digest != manifest.get('manifest_sha256') or digest != parent['manifest_sha256']:
            raise RuntimeError('Acquisition manifest hash mismatch')
        candidates = {v['video_id']: v for v in manifest['candidates']}
        if len(candidates) != len(manifest['candidates']):
            raise RuntimeError('Duplicate acquisition candidates')
        report_path = app.state_dir / 'recurring' / (parent_id + '.json')
        report_bytes = report_path.read_bytes()
        report = json.loads(report_bytes)
        results = json.loads(parent['result_json'] or '[]')
        if (report.get('run_id') != parent_id or report.get('manifest_sha256') != digest or
                report.get('results') != results):
            raise RuntimeError('Acquisition report differs from persisted run')
        items = {row['video_id']: dict(row) for row in c.execute(
            'SELECT * FROM run_items WHERE run_id=? ORDER BY rowid', (parent_id,))}
        expected_paths = set()
        for result in results:
            video = result['video_id']
            if video not in candidates or video not in items:
                raise RuntimeError('Capture result is outside the approved manifest')
            if result.get('status') in {'captured', 'already-admitted'}:
                packet = result.get('source_packet', '')
                if not packet or packet != items[video]['source_packet']:
                    raise RuntimeError('Capture source path differs from run item')
                prefix = app.policy['source_inbox_prefix'] + '/'
                target = app.policy['source_import_prefix'] + '/' + packet[len(prefix):] if packet.startswith(prefix) else packet
                if not target.startswith(app.policy['source_import_prefix'] + '/'):
                    raise RuntimeError('Capture path is outside the import prefix')
                expected_paths.add(target)
        # Previously manifested files must still exist with their original fingerprints.
        seen = set()
        for source in report.get('captured_sources', []):
            if source['canonical_source'] not in expected_paths or source['canonical_source'] in seen:
                raise RuntimeError('Report source is duplicated or outside the approved capture results')
            seen.add(source['canonical_source'])
            path = app.inside_vault(source['canonical_source'])
            if not path.is_file() or hashlib.sha256(path.read_bytes()).hexdigest().upper() != source['sha256']:
                raise RuntimeError('Previously admitted source missing or changed')
        exports = {row['video_id']: dict(row) for row in c.execute(
            'SELECT * FROM youtube_semantic_exports WHERE parent_run_id=?', (parent_id,))}
        selected, sources = [], []
        for result in results:
            video = result['video_id']
            if video not in candidates or video not in items:
                raise RuntimeError('Capture result is outside the approved manifest')
            if video in exports or result.get('status') not in {'captured', 'already-admitted'}:
                continue
            if result.get('source_packet') != items[video]['source_packet']:
                raise RuntimeError('Capture source path differs from run item')
            admitted = app._captured_sources([result], admitted=True)
            if not admitted:
                continue  # Inbox stability gate has not admitted it yet.
            source = admitted[0]
            if not source['canonical_source'].startswith(app.policy['source_import_prefix'] + '/'):
                raise RuntimeError('Snapshot source is outside the approved import prefix')
            selected.append(result)
            sources.append(source)
        if not selected or validate_only:
            return None
        if len({s['canonical_source'] for s in sources}) != len(sources):
            raise RuntimeError('Duplicate snapshot source')
        suffix = hashlib.sha256(json.dumps(sources, sort_keys=True).encode()).hexdigest()[:12]
        snapshot_id = parent_id + '-review-' + suffix
        payload = {
            'schema_version': 'youtube-intelligence-run/v1', 'run_id': snapshot_id,
            'run_type': parent['run_type'], 'status': 'awaiting-semantic-worker',
            'manifest_sha256': digest, 'policy_sha256': parent['policy_sha256'],
            'preference_version': parent['preference_version'], 'results': selected,
            'captured_sources': sources, 'parent_run_id': parent_id,
            'parent_report_sha256': hashlib.sha256(report_bytes).hexdigest().upper(),
            'parent_manifest': manifest,
        }
        path = app.state_dir / 'recurring' / (snapshot_id + '.json')
        encoded = json.dumps(payload, ensure_ascii=False, indent=2).encode()
        # A crash after file creation is recoverable only by an exact byte match.
        if path.exists():
            if path.read_bytes() != encoded:
                raise RuntimeError('Immutable review snapshot differs; refuse overwrite')
        else:
            with path.open('xb') as handle:
                handle.write(encoded)
        with c:
            c.execute("INSERT INTO runs(run_id,schema_version,run_type,trigger_type,status,requested_at,"
                      "policy_sha256,preference_version,manifest_sha256,manifest_json,result_json) "
                      "VALUES(?,?,?,'semantic-snapshot','awaiting-semantic-worker',?,?,?,?,?,?)",
                      (snapshot_id, parent['schema_version'], parent['run_type'], iso_utc(),
                       parent['policy_sha256'], parent['preference_version'], digest,
                       parent['manifest_json'], json.dumps(selected, ensure_ascii=False)))
            for result, source in zip(selected, sources):
                item = items[result['video_id']]
                c.execute('INSERT INTO run_items VALUES(?,?,?,?,?,?,?,?,?)',
                          (snapshot_id, item['video_id'], item['channel_id'], item['selection_reason'],
                           item['metadata_score'], item['status'], item['source_packet'], None, iso_utc()))
                c.execute('INSERT INTO youtube_semantic_exports VALUES(?,?,?,?,?)',
                          (parent_id, item['video_id'], snapshot_id, source['canonical_source'], source['sha256']))
        return snapshot_id
    finally:
        c.close()

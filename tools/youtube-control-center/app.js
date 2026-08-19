const $ = (selector) => document.querySelector(selector);
let session = null;
let state = null;
let lastPreview = null;
let channelDisplayLimit = 25;

function escapeHtml(value) {
  return String(value ?? '').replace(/[&<>'"]/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;',"'":'&#39;','"':'&quot;'}[c]));
}
function toast(message) {
  const el = $('#toast'); el.textContent = message; el.classList.add('show');
  window.setTimeout(() => el.classList.remove('show'), 3500);
}
async function withBusy(button, label, work) {
  const original = button.textContent;
  button.disabled = true;
  button.setAttribute('aria-busy', 'true');
  button.textContent = label;
  try { return await work(); }
  finally { button.removeAttribute('aria-busy'); button.textContent = original; button.disabled = false; }
}
async function getJson(url) {
  const response = await fetch(url, {cache: 'no-store'});
  const payload = await response.json();
  if (!response.ok) throw new Error(payload.error || response.statusText);
  return payload;
}
async function command(payload) {
  payload = {...payload, command_id: payload.command_id || crypto.randomUUID()};
  const response = await fetch('/api/commands', {method: 'POST', headers: {'Content-Type':'application/json','X-YT-Control-Token':session.token}, body: JSON.stringify(payload)});
  const result = await response.json();
  if (!response.ok) throw new Error(result.error || response.statusText);
  return result;
}
function formatDate(value) { return value ? new Date(value).toLocaleString('de-DE') : '—'; }
function pageLabel(path) {
  return String(path || '').replace(/^wiki\//, '').replace(/\.md$/, '').replaceAll('-', ' ');
}

function renderAttention() {
  const missingCoverage = Math.max(0, (state.coverage?.total || 0) - (state.coverage?.covered || 0));
  const items = [];
  if (state.pipeline_paused) items.push({title:'Pipeline ist pausiert', body:'Es werden keine neuen Läufe begonnen. Du kannst sie oben wieder fortsetzen.', href:'#status', cta:'Status ansehen'});
  if (state.proposals.length) items.push({title:`${state.proposals.length} Änderungsvorschlag${state.proposals.length === 1 ? '' : 'e'} warten`, body:'Kanalmodi oder Limits ändern sich erst nach deiner Freigabe.', href:'#channels', cta:'Vorschläge prüfen'});
  if (state.semantic_backlog) items.push({title:`${state.semantic_backlog} Quellen warten auf Verarbeitung`, body:'Ab 100 offenen Quellen stoppt die Aufnahme automatisch.', href:'#insights', cta:'Verarbeitung ansehen'});
  if (missingCoverage) items.push({title:`${missingCoverage} Kanäle fehlen in der Grundabdeckung`, body:'Prüfe zuerst eine Vorschau. Ein Lauf startet erst nach einem separaten Klick.', href:'#run-control', cta:'Vorschau vorbereiten'});
  $('#attention-count').textContent = items.length ? `${items.length} Thema${items.length === 1 ? '' : 'en'}` : 'Nichts dringend';
  $('#attention-summary').textContent = items.length ? 'Beginne mit dem ersten Punkt. Technische Details bleiben aufklappbar.' : 'Aktuell ist keine manuelle Entscheidung erforderlich.';
  $('#attention-actions').innerHTML = items.length ? items.map((item,index) => `<article class="attention-item"><span class="step-number">${index + 1}</span><div><h3>${escapeHtml(item.title)}</h3><p>${escapeHtml(item.body)}</p><a class="text-link" href="${item.href}">${escapeHtml(item.cta)} →</a></div></article>`).join('') : '<p class="empty-state">Die Pipeline arbeitet innerhalb der freigegebenen Grenzen.</p>';
}

function semanticMeaning(status) {
  const meanings = {
    'new-claim': ['Mögliche neue Erkenntnis', 'Die Quelle enthält einen eigenständigen Gedanken, der noch nicht ausreichend im Wiki abgedeckt war.', 'review'],
    'extended-claim': ['Bestehendes Wissen erweitern', 'Die Quelle ergänzt eine bereits vorhandene Wissensseite um einen nützlichen Aspekt.', 'review'],
    'corroborating': ['Bestehendes Wissen stützen', 'Die Quelle liefert zusätzliche Evidenz für eine bereits dokumentierte Erkenntnis.', 'review'],
    'registered-only': ['Nur als Quelle archiviert', 'Die Quelle wurde vollständig geprüft, liefert aber kein dauerhaftes Wissens-Delta für das Wiki.', 'quiet'],
    'duplicate': ['Doppelte Quelle', 'Der Inhalt ist bereits durch eine andere Quelle vertreten.', 'quiet'],
    'blocked': ['Prüfung blockiert', 'Die Quelle konnte nicht zuverlässig bewertet werden und braucht Aufmerksamkeit.', 'warning'],
    'out-of-scope': ['Derzeit nicht relevant', 'Der Inhalt passt nicht zu den aktuellen Zielen oder Interessen.', 'quiet']
  };
  return meanings[status] || ['Prüfergebnis', `Interner Status: ${status}`, 'quiet'];
}

function semanticInsights() {
  const seen = new Set();
  return state.insights.filter(item => item.stage === 'semantic-review' && !seen.has(item.video_id) && seen.add(item.video_id));
}

function runMeaning(run) {
  const types = {'coverage-sweep':'Grundabdeckung','delta':'Neue Videos','selected-channels':'Ausgewählte Kanäle'};
  const states = {completed:'erfolgreich abgeschlossen',running:'läuft gerade',requested:'wartet auf Start',paused:'pausiert','awaiting-semantic-worker':'wartet auf Wissensprüfung',failed:'fehlgeschlagen'};
  const reviewed = Number(run.reviewed_count || 0);
  const total = Number(run.item_count || 0);
  const result = total ? `${reviewed} von ${total} ausgewählten Videos vollständig geprüft.` : 'In diesem Lauf wurden keine Videos ausgewählt.';
  return {title:`${types[run.run_type] || 'Pipeline-Lauf'} ${states[run.status] || run.status}`, result};
}

function groupedEvents() {
  const groups = [];
  for (const event of state.events) {
    const key = `${event.event_type}|${event.subject_type}|${event.body}|${event.actor}|${event.created_at}`;
    const current = groups[groups.length - 1];
    if (current?.key === key) current.items.push(event); else groups.push({key,items:[event]});
  }
  return groups;
}

function eventMeaning(group) {
  const event = group.items[0];
  let metadata = {};
  try { metadata = JSON.parse(event.metadata_json || '{}'); } catch (_) {}
  if (event.event_type === 'semantic-completion') return {title:'Wissensprüfung abgeschlossen', body:`${metadata.decision_count || group.items.length} Quellen wurden im Paket ${event.body} abschließend bewertet.`};
  if (event.event_type === 'approval' && event.body === 'approved-live-capture') return {title:'Video-Lauf von dir freigegeben', body:'Der exakt vorbereitete Pilot-Lauf durfte starten.'};
  if (event.event_type === 'override' && event.body === 'apply-approved-batch') return {title:`${group.items.length} freigegebene Kanaländerung${group.items.length === 1 ? '' : 'en'} angewendet`, body:'Die zuvor geprüften Kanalmodi wurden gemeinsam übernommen.'};
  if (event.subject_type === 'source') return {title:'Quellenfeedback gespeichert', body:'Deine Rückmeldung wird als Alignment-Signal für künftige Entscheidungen verwendet.'};
  return {title:'Kontrollereignis gespeichert', body:event.body};
}

function channelModeLabel(mode) {
  return {'recent-transcripts':'Automatisch prüfen','sampled-recent':'Stichprobe','selected-videos':'Nur ausgewählte Videos','metadata-only':'Nur Metadaten','paused':'Pausiert','full-history':'Vollständiger Verlauf'}[mode] || mode;
}

function interestDefinition(key) {
  return {
    'applied-ai-agentic':['Angewandte KI & Agentensysteme','Praktische Nutzung von Agents, Automatisierung und KI-Werkzeugen.'],
    'b2b-marketing-sales':['B2B Marketing & Vertrieb','GTM, Demand, Sales, ABM und Revenue Operations.'],
    'content-linkedin-positioning':['Content, LinkedIn & Positionierung','Content-Systeme, Thought Leadership und fachliche Sichtbarkeit.'],
    'emerging-intersections':['Neue Querverbindungen','Neue Themen, die mit bestehenden Interessen verschmelzen.'],
    'second-brain-context':['Second Brain & Context Engineering','Wissenssysteme, ContextOps und persönliche Informationsarchitektur.']
  }[key] || [key,''];
}

function limitDefinition(key) {
  return {
    max_transcripts_per_run:['Maximale Transkripte pro Lauf','Absolute Obergrenze je Lauf.'],
    coverage_window_days:['Rückblick in Tagen','Zeitraum für die initiale Kanalprüfung.'],
    minimum_duration_seconds:['Mindestlänge eines Videos','Kürzere Videos werden automatisch übersprungen.'],
    subbatch_limit:['Sichere Teilbatch-Größe','Nach so vielen Videos wird ein stabiler Zwischenstand geschrieben.'],
    recent_channel_limit:['Limit pro automatischem Kanal','Maximale Kandidaten je automatisch geprüftem Kanal.'],
    sampled_channel_limit:['Limit pro Stichprobenkanal','Maximale Kandidaten je Stichprobenkanal.'],
    evaluation_channel_limit:['Limit für neue Kanäle','Maximale Kandidaten bei der ersten Kalibrierung.'],
    unresolved_semantic_backlog_limit:['Stop bei offenem Wissens-Backlog','Ab dieser Zahl werden keine weiteren Transkripte aufgenommen.'],
    initial_live_limit:['Pilotlimit pro Lauf','Zusätzliche Begrenzung für frühe Live-Läufe.'],
    initial_live_channel_limit:['Pilotlimit pro Kanal','Zusätzliche Kanalbegrenzung für frühe Live-Läufe.'],
    open_discovery_share:['Anteil offene Entdeckung','Anteil für wertvolle Themen außerhalb der aktuellen Schwerpunkte.'],
    rate_limit_circuit_breaker:['Stop nach Rate-Limit-Fehlern','Pausiert nach wiederholter Drosselung durch YouTube.'],
    runtime_limit_minutes:['Maximale Laufzeit','Pausiert einen Lauf nach dieser Zeit sicher.']
  }[key] || [key,'Technisches Pipeline-Limit.'];
}

function updateLimitHelp() {
  const [,help] = limitDefinition($('#limit-key').value);
  $('#limit-help').textContent = help;
}

function coverageLabel(value) {
  return {covered:'Abgeschlossen','in-progress':'Noch offen','evaluation-pending':'Noch nicht begonnen'}[value] || value;
}

function renderChannels() {
  const query = ($('#channel-search').value || '').trim().toLocaleLowerCase('de');
  const mode = $('#channel-mode-filter').value;
  const coverage = $('#channel-coverage-filter').value;
  const filtered = state.channel_details.filter(channel => (!query || `${channel.title} ${channel.channel_id}`.toLocaleLowerCase('de').includes(query)) && (!mode || channel.mode === mode) && (!coverage || (channel.coverage_state || 'evaluation-pending') === coverage));
  const visible = filtered.slice(0, channelDisplayLimit);
  $('#channel-count').textContent = `${visible.length} von ${filtered.length} passenden Kanälen angezeigt`;
  $('#channel-rows').innerHTML = visible.length ? visible.map(channel => `<tr><td><strong>${escapeHtml(channel.title)}</strong><details><summary>Technische ID</summary><span class="muted">${escapeHtml(channel.channel_id)}</span></details></td><td>${escapeHtml(channelModeLabel(channel.mode))}</td><td>${escapeHtml(coverageLabel(channel.coverage_state || 'evaluation-pending'))}</td><td><button class="propose-mode mutation quiet" data-id="${escapeHtml(channel.channel_id)}" data-mode="${escapeHtml(channel.mode)}">Änderung vormerken</button></td></tr>`).join('') : '<tr><td colspan="4">Keine Kanäle passen zu diesen Filtern.</td></tr>';
  $('#show-more-channels').hidden = visible.length >= filtered.length;
  document.querySelectorAll('#channel-rows .mutation').forEach(el => el.disabled = !session.mutations_enabled);
}

function renderRunPreview(manifest) {
  const typeLabels = {'coverage-sweep':'Grundabdeckung','delta':'Neue Videos seit dem letzten Lauf','selected-channels':'Ausgewählte Kanäle'};
  const reasonLabels = {'goal-signal':'passt zu deinen Zielen','open-discovery':'bewusste Entdeckung außerhalb der Schwerpunkte','channel-evaluation':'Kanal wird erstmals kalibriert','manual-selection':'manuell ausgewählt'};
  const candidates = manifest.candidates || [];
  const visible = candidates.slice(0, 12);
  const remaining = Math.max(0, candidates.length - visible.length);
  $('#run-preview').className = 'preview';
  $('#run-preview').innerHTML = `<div class="preview-head"><div><span class="eyebrow">VORSCHAU · NOCH NICHT GESTARTET</span><h3>${escapeHtml(typeLabels[manifest.run_type] || manifest.run_type)}</h3></div><span class="pill">${escapeHtml(candidates.length)} Videos</span></div><div class="preview-metrics"><div><strong>${escapeHtml(manifest.considered_count)}</strong><span>geprüft</span></div><div><strong>${escapeHtml(candidates.length)}</strong><span>ausgewählt</span></div><div><strong>${escapeHtml(manifest.deferred_candidate_count)}</strong><span>für später vorgemerkt</span></div><div><strong>${escapeHtml(manifest.semantic_backlog_before)}</strong><span>offener Wissens-Backlog</span></div></div><p>Davon dienen ${escapeHtml(manifest.open_discovery_selected)} Videos der offenen Entdeckung. Der Lauf bleibt auf maximal ${escapeHtml(manifest.capture_budget)} Transkripte begrenzt.</p><div class="candidate-list">${visible.map(item => `<article><strong>${escapeHtml(item.title)}</strong><span>${escapeHtml(item.channel)} · ${escapeHtml(reasonLabels[item.selection_reason] || item.selection_reason)}</span></article>`).join('')}</div>${remaining ? `<p class="muted">+ ${remaining} weitere Kandidaten im exakten Manifest</p>` : ''}<details><summary>Technisches Manifest anzeigen</summary><pre>${escapeHtml(JSON.stringify(manifest, null, 2))}</pre></details>`;
  $('#request-run').disabled = !session.mutations_enabled;
}

function render() {
  const recurring = state.autonomy || {};
  $('#autonomy').textContent = `Automatik ${recurring.active_level || 'L0'}`;
  $('#generated-at').textContent = `Stand ${formatDate(state.generated_at)}`;
  $('#pause').textContent = state.pipeline_paused ? 'Fortsetzen' : 'Pause';
  const coverage = state.coverage || {};
  renderAttention();
  const metrics = [
    ['Abdeckung', `${coverage.percent || 0}%`, `${coverage.covered || 0} von ${coverage.total || 0} Kanälen`],
    ['Semantik-Backlog', state.semantic_backlog, 'Hard stop bei 100 offenen Quellen'],
    ['Letzter Lauf', state.runs[0] ? (runMeaning(state.runs[0]).title.replace('Grundabdeckung ', '').replace('Neue Videos ', '').replace('Ausgewählte Kanäle ', '')) : 'Noch keiner', state.runs[0] ? formatDate(state.runs[0].requested_at) : 'Noch kein Lauf'],
    ['Offene Vorschläge', state.proposals.length, 'Kanalmodi und Limits warten auf Freigabe']
  ];
  $('#metrics').innerHTML = metrics.map(x => `<article class="metric"><span class="eyebrow">${escapeHtml(x[0])}</span><strong>${escapeHtml(x[1])}</strong><span class="muted">${escapeHtml(x[2])}</span></article>`).join('');

  const insights = semanticInsights();
  $('#insight-count').textContent = `${insights.length} Ergebnis${insights.length === 1 ? '' : 'se'}`;
  $('#insight-cards').innerHTML = insights.length ? insights.map(item => {
    const [label,explanation,tone] = semanticMeaning(item.status);
    const target = item.semantic_target_pages ? `<p><strong>Betroffene Wissensseite:</strong> ${escapeHtml(pageLabel(item.semantic_target_pages))}</p>` : '<p><strong>Wiki-Änderung:</strong> keine – die Quelle bleibt nur nachvollziehbar registriert.</p>';
    const rationale = item.semantic_rationale || 'Für dieses ältere Prüfergebnis ist noch keine ausführliche Begründung im Entscheidungsledger hinterlegt.';
    return `<article class="card insight-card"><span class="pill status-${tone}">${escapeHtml(label)}</span><h3>${escapeHtml(item.video_title || item.video_id)}</h3><p class="source-line">${escapeHtml(item.channel_title || item.channel_id)}</p><p>${escapeHtml(explanation)}</p><div class="reasoning-box"><h4>Warum Codex so entschieden hat</h4><p>${escapeHtml(rationale)}</p>${target}</div><p class="decision-question"><strong>Dein Arbeitsauftrag:</strong> Prüfe, ob Einstufung und Begründung plausibel sind.</p><details><summary>Technische Details (optional)</summary><p>Paket ${escapeHtml(item.reason)} · Vertrauen ${escapeHtml(item.semantic_trust_class || '—')} · Claim-Risiko ${escapeHtml(item.semantic_claim_risk || '—')}</p><p class="muted">Video-ID ${escapeHtml(item.video_id)} · Run ${escapeHtml(item.run_id || '—')} · Präferenz v${escapeHtml(item.preference_version)}</p><p class="muted">Source Brief: ${escapeHtml(item.semantic_source_summary || '—')}</p></details><p class="decision-help">Deine Rückmeldung kalibriert künftige Entscheidungen. Sie ändert keine Wiki-Seite direkt.</p><div class="card-actions"><button class="source-action mutation" data-id="${escapeHtml(item.video_id)}" data-action="approve">Einschätzung passt</button><button class="source-action mutation quiet" data-id="${escapeHtml(item.video_id)}" data-action="defer">Später nachprüfen</button><button class="source-action mutation danger" data-id="${escapeHtml(item.video_id)}" data-action="reject">Einschätzung korrigieren</button></div></article>`;
  }).join('') : '<p class="empty-state">Noch keine semantisch geprüften Videos vorhanden.</p>';
  const coverageGroups = Object.entries(state.channel_details.reduce((acc, channel) => { const key = channel.coverage_state || 'evaluation-pending'; (acc[key] ||= []).push(channel); return acc; }, {}));
  $('#coverage-cards').innerHTML = coverageGroups.length ? coverageGroups.map(([key,items]) => `<article class="card"><span class="pill">${escapeHtml(key)}</span><h3>${items.length} Kanäle</h3><details><summary>Kanäle anzeigen</summary><p>${items.map(x => escapeHtml(x.title)).join(' · ')}</p></details></article>`).join('') : '<p class="muted">Noch keine Kanäle registriert.</p>';

  const preference = state.preferences;
  $('#preference-fields').innerHTML = Object.entries(preference.weights).map(([key,value]) => { const [label,help] = interestDefinition(key); return `<label>${escapeHtml(label)}<input class="weight" data-key="${escapeHtml(key)}" type="number" min="0" step="0.25" value="${escapeHtml(value)}"><span class="field-help">${escapeHtml(help)}</span></label>`; }).join('') + `<label>Offene Entdeckung<input id="open-discovery" type="number" min="0" max="1" step="0.05" value="${escapeHtml(preference.open_discovery_share)}"><span class="field-help">Anteil der Auswahl für überraschende, noch nicht gewichtete Themen.</span></label>`;

  renderChannels();
  $('#limit-key').innerHTML = Object.entries(state.limits).filter(([,value]) => typeof value === 'number').map(([key,value]) => { const [label] = limitDefinition(key); return `<option value="${escapeHtml(key)}">${escapeHtml(label)} · aktuell ${escapeHtml(value)}</option>`; }).join('');
  updateLimitHelp();
  $('#proposal-cards').innerHTML = state.proposals.length ? state.proposals.map(p => `<article class="card"><span class="pill">${escapeHtml(p.proposal_type)}</span><h3>${escapeHtml(p.target_id)}</h3><p>${escapeHtml(p.current_value)} → <strong>${escapeHtml(p.proposed_value)}</strong></p><p>${escapeHtml(p.rationale)}</p><button class="apply-proposal mutation" data-id="${escapeHtml(p.proposal_id)}" data-version="${escapeHtml(p.expected_version)}">Jetzt anwenden</button></article>`).join('') : '<p class="muted">Keine offenen Änderungen.</p>';
  $('#run-list').innerHTML = state.runs.length ? state.runs.map(r => { const meaning = runMeaning(r); return `<article class="timeline-item"><strong>${escapeHtml(meaning.title)}</strong><p>${escapeHtml(meaning.result)}</p><span class="muted">${formatDate(r.completed_at || r.requested_at)}</span><details><summary>Technische Details</summary><p class="muted">Run ${escapeHtml(r.run_id)} · Typ ${escapeHtml(r.run_type)} · Auslöser ${escapeHtml(r.trigger_type)}</p>${r.error ? `<p class="error-text">${escapeHtml(r.error)}</p>` : ''}</details></article>`; }).join('') : '<p class="empty-state">Noch kein Pipeline-Lauf vorhanden.</p>';
  const eventGroups = groupedEvents();
  $('#event-list').innerHTML = eventGroups.length ? eventGroups.map(group => { const event = group.items[0]; const meaning = eventMeaning(group); return `<article class="timeline-item"><strong>${escapeHtml(meaning.title)}</strong><p>${escapeHtml(meaning.body)}</p><span class="muted">${formatDate(event.created_at)} · ${escapeHtml(event.actor)}</span><details><summary>Technische Details</summary><p class="muted">${escapeHtml(event.event_type)} · ${escapeHtml(event.subject_type)} · ${escapeHtml(group.items.map(x => x.subject_id).join(', '))}</p></details></article>`; }).join('') : '<p class="empty-state">Noch keine manuellen Entscheidungen oder Änderungen.</p>';
  document.querySelectorAll('.mutation').forEach(el => el.disabled = !session.mutations_enabled);
  $('#request-run').disabled = !session.mutations_enabled || !lastPreview;
}

async function refresh() {
  try { state = await getJson('/api/state'); render(); } catch (error) { toast(error.message); }
}

document.addEventListener('click', async event => {
  const source = event.target.closest('.source-action');
  const propose = event.target.closest('.propose-mode');
  const apply = event.target.closest('.apply-proposal');
  try {
    if (source) {
      const action = source.dataset.action;
      const promptText = action === 'reject' ? 'Was ist an der Einschätzung falsch? Eine kurze Korrektur ist erforderlich:' : action === 'defer' ? 'Optional: Warum möchtest du später nachprüfen?' : null;
      const comment = promptText ? window.prompt(promptText, '') : '';
      if (promptText && comment === null) return;
      if (action === 'reject' && !comment.trim()) { toast('Bitte beschreibe kurz, was korrigiert werden soll.'); return; }
      await command({command:'source-decision', source_id:source.dataset.id, action, comment});
      toast(action === 'approve' ? 'Als passende Einschätzung gespeichert.' : action === 'defer' ? 'Für eine spätere Prüfung vorgemerkt.' : 'Korrektur als Alignment-Signal gespeichert.'); await refresh();
    } else if (propose) {
      const channel = state.channel_details.find(item => item.channel_id === propose.dataset.id);
      $('#mode-channel-id').value = propose.dataset.id;
      $('#mode-value').value = propose.dataset.mode;
      $('#mode-dialog-title').textContent = channel?.title || propose.dataset.id;
      $('#mode-dialog').showModal();
    } else if (apply) {
      await command({command:'apply-configuration', proposal_id:apply.dataset.id, expected_version:apply.dataset.version}); toast('Änderung gilt ab dem nächsten Lauf.'); await refresh();
    }
  } catch (error) { toast(error.message); }
});

$('#refresh').addEventListener('click', event => withBusy(event.currentTarget, 'Aktualisiere …', refresh));
$('#pause').addEventListener('click', async () => {
  const action = state.pipeline_paused ? 'fortsetzen' : 'pausieren';
  if (!window.confirm(`Pipeline wirklich ${action}? Die Änderung gilt sofort an der nächsten sicheren Transaktionsgrenze.`)) return;
  try { await command({command:state.pipeline_paused ? 'resume' : 'pause', expected_version:state.pause_version}); await refresh(); toast(`Pipeline ${state.pipeline_paused ? 'pausiert' : 'fortgesetzt'}.`); } catch (error) { toast(error.message); }
});
$('#inspect-run').addEventListener('click', async () => {
  const button = $('#inspect-run');
  await withBusy(button, 'Erzeuge Vorschau …', async () => { try { const channels = $('#run-channels').value.split(',').map(x => x.trim()).filter(Boolean); lastPreview = await command({command:'inspect-run', run_type:$('#run-type').value, channel_ids:channels, limit:Number($('#run-limit').value)}); renderRunPreview(lastPreview); } catch (error) { toast(error.message); } });
});
$('#request-run').addEventListener('click', async () => {
  try {
    if (!lastPreview) throw new Error('Zuerst eine aktuelle Vorschau erzeugen.');
    const count = lastPreview.candidates?.length || 0;
    if (!window.confirm(`Diesen exakten Lauf mit ${count} Videos verbindlich anfordern? Limits, Auswahl und Hash werden unveränderlich gespeichert.`)) return;
    const result = await command({command:'request-run', manifest:lastPreview});
    $('#run-preview').innerHTML = `<span class="pill">Auftrag angelegt</span><h3>Der Lauf wartet auf Ausführung</h3><p>Run ${escapeHtml(result.run_id || 'angefordert')}. Die Aufnahme startet nicht erneut durch diesen Browser-Klick.</p>`;
    lastPreview = null;
    await refresh();
    toast('Lauf verbindlich angefordert.');
  } catch (error) { toast(error.message); }
});
$('#save-preferences').addEventListener('click', async () => {
  try { const weights = Object.fromEntries([...document.querySelectorAll('.weight')].map(x => [x.dataset.key, Number(x.value)])); await command({command:'save-preferences', weights, open_discovery_share:Number($('#open-discovery').value), expected_version:state.preferences.version}); toast('Interessen gelten ab dem nächsten Lauf.'); await refresh(); } catch (error) { toast(error.message); }
});
$('#queue-limit').addEventListener('click', async () => {
  try { await command({command:'propose-configuration', proposal_type:'limit', target_id:$('#limit-key').value, proposed_value:$('#limit-value').value, rationale:$('#limit-rationale').value}); toast('Limit-Vorschlag vorgemerkt.'); await refresh(); } catch (error) { toast(error.message); }
});
$('#load-audit').addEventListener('click', async () => {
  const button = $('#load-audit');
  await withBusy(button, 'Lade Stichprobe …', async () => { try { const month = new Date().toISOString().slice(0,7); const audit = await getJson(`/api/audit?month=${month}`); $('#audit-cards').innerHTML = audit.selected.length ? audit.selected.map(x => `<article class="card"><span class="pill">${escapeHtml(x.selection_type)}</span><h3>${escapeHtml(x.target_page)}</h3><p>Risikoscore ${escapeHtml(x.risk_score)}</p><details><summary>Änderungsdetails</summary><p class="muted">${escapeHtml(x.source_path)} · ${escapeHtml(x.diff_sha256)}</p></details></article>`).join('') : '<p class="empty-state">Noch keine unauditierten Wiki-Änderungen vorhanden.</p>'; } catch (error) { toast(error.message); } });
});
$('#channel-search').addEventListener('input', () => { channelDisplayLimit = 25; renderChannels(); });
$('#channel-mode-filter').addEventListener('change', () => { channelDisplayLimit = 25; renderChannels(); });
$('#channel-coverage-filter').addEventListener('change', () => { channelDisplayLimit = 25; renderChannels(); });
$('#show-more-channels').addEventListener('click', () => { channelDisplayLimit += 25; renderChannels(); });
$('#limit-key').addEventListener('change', updateLimitHelp);
$('#save-mode-proposal').addEventListener('click', async event => {
  event.preventDefault();
  try {
    await command({command:'propose-configuration', proposal_type:'channel-mode', target_id:$('#mode-channel-id').value, proposed_value:$('#mode-value').value, rationale:$('#mode-rationale').value});
    $('#mode-dialog').close();
    toast('Kanaländerung vorgemerkt. Sie ist noch nicht aktiv.');
    await refresh();
  } catch (error) { toast(error.message); }
});

(async function init() {
  try {
    session = await getJson('/api/session');
    if (!session.mutations_enabled) { $('#policy-banner').textContent = 'Sicherer Implementierungszustand: Das Kontrollzentrum ist lesbar, aber alle Mutationen, Live-Runs und autonomen Freigaben bleiben per Policy deaktiviert.'; $('#policy-banner').classList.add('show'); }
    await refresh();
  } catch (error) { toast(error.message); }
})();

"""CLI wrapper. Payloads are JSON files, never eval or executable source input."""
import argparse
import json
import sys

from engine import EngineError, execute, initialize, read_json, profile_check


def main(argv=None):
    parser = argparse.ArgumentParser(description="Local supervised company intelligence coordinator")
    commands = parser.add_subparsers(dest="action", required=True)
    init = commands.add_parser("init")
    init.add_argument("--profile", required=True)
    init.add_argument("--run-dir", required=True)
    init.add_argument("--tasks", required=True, help="JSON array of task specifications")
    preflight = commands.add_parser("preflight")
    preflight.add_argument("--run-dir", required=True)
    preflight.add_argument("--profile", help="Check prospective profile before run creation")
    for action in ("next", "accept", "reconcile", "verify", "resume", "publish", "claim", "review", "done", "skip", "select-sources", "review-draft", "revise-source-notes", "stop", "continue"):
        command = commands.add_parser(action)
        command.add_argument("--run-dir", required=True)
        command.add_argument("--payload", help="JSON payload file; see contract.json")
        command.add_argument("--expected-revision", type=int)
    args = parser.parse_args(argv)
    try:
        if args.action == "init":
            output = initialize(args.profile, args.run_dir, read_json(args.tasks))
        elif args.action == "preflight" and args.profile:
            profile, _, limits = profile_check(args.profile, args.run_dir)
            output = {"ok": True, "project_id": profile["project_id"], "budget_limits": limits, "model_execution": "Codex coordination only"}
        else:
            payload = read_json(args.payload) if getattr(args, "payload", None) else None
            output = execute(args.run_dir, args.action, payload, getattr(args, "expected_revision", None))
        print(json.dumps(output, ensure_ascii=False, indent=2, allow_nan=False))
        return 0 if output.get("ok", True) else 1
    except (EngineError, OSError, KeyError, TypeError) as exc:
        print(json.dumps({"ok": False, "error": str(exc)}, ensure_ascii=False), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())

import hashlib
import json
import shutil
import sys
import tomllib
from pathlib import Path


REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO / "tools"))

from newsletter_batch import build_review, prepare, retrieval_preflight  # noqa: E402
from newsletter_snapshot_extract import extract_transactions  # noqa: E402


def main() -> None:
    scratch = REPO / "wiki" / "_outputs" / "newsletter-intelligence" / "_pipeline-test"
    if scratch.exists():
        shutil.rmtree(scratch)
    try:
        transactions = scratch / "transactions"
        transaction = transactions / "link-test-deadbeef"
        transaction.mkdir(parents=True)
        snapshot = transaction / "snapshot.bin"
        snapshot.write_text(
            "<html><body><nav>noise</nav><article><h1>Useful Article</h1>"
            "<!-- extraction metadata -->"
            "<h2>Methods</h2><p>Useful evidence.</p>"
            "<a href='https://arxiv.org/pdf/1234.5678'>View PDF</a>"
            "</article></body></html>",
            encoding="utf-8",
        )
        digest = "sha256-" + hashlib.sha256(snapshot.read_bytes()).hexdigest()
        fetch = {
            "candidate_id": "link-test",
            "coverage": "full",
            "mime_type": "text/html",
            "content_hash": digest,
            "final_url": "https://arxiv.org/abs/1234.5678",
            "snapshot_path": str(snapshot),
        }
        (transaction / "fetch-record.json").write_text(json.dumps(fetch), encoding="utf-8")
        result = extract_transactions(transactions, scratch / "extracted")
        assert result[0]["section_count"] == 2
        text = (scratch / "extracted" / "link-test.txt").read_text(encoding="utf-8")
        assert "Useful evidence" in text and "noise" not in text
        links = json.loads((scratch / "extracted" / "outbound-link-candidates.json").read_text())
        assert links[0]["paper_pdf_followup"] is True

        review = {
            "recommended_batch": [
                {
                    "id": "one",
                    "origin": "issue-one",
                    "title": "Primary paper",
                    "url": "https://example.com/paper.pdf",
                    "expected_type": "research paper",
                    "reason": "Verify the claim.",
                }
            ]
        }
        review_path = scratch / "review.json"
        review_path.write_text(json.dumps(review), encoding="utf-8")
        assert prepare(review_path, scratch / "inputs", "test-run") == 1
        candidate = json.loads(next((scratch / "inputs").glob("*-candidate.json")).read_text())
        assert candidate["source_type"] == "research_paper"
        blocked = retrieval_preflight(
            scratch / "inputs",
            {"CODEX_SANDBOX_NETWORK_DISABLED": "1"},
        )
        assert blocked["status"] == "retrieval_pending_network"
        assert blocked["network_available"] is False
        assert blocked["domains"] == ["example.com"]
        ready = retrieval_preflight(scratch / "inputs", {})
        assert ready["status"] == "ready"
        assert ready["network_available"] is True

        profile_template = tomllib.loads(
            (REPO / "tools" / "config" / "newsletter-retrieval-profile.toml").read_text(encoding="utf-8")
        )
        profile = profile_template["permissions"]["newsletter-retrieval"]
        assert profile["extends"] == ":workspace"
        assert profile["network"]["enabled"] is True
        assert "*" not in profile["network"]["domains"]
        assert all(value == "allow" for value in profile["network"]["domains"].values())
        assert set(profile["network"]["domains"]) == {
            "newsletter.pragmaticengineer.com",
            "www.artificialintelligencemadesimple.com",
            "www.latent.space",
            "www.lennysnewsletter.com",
            "youtu.be",
            "www.youtube.com",
            "www.aisi.gov.uk",
            "github.com",
        }

        review["recommended_batch"][0]["url"] = "http://127.0.0.1/private"
        review_path.write_text(json.dumps(review), encoding="utf-8")
        try:
            prepare(review_path, scratch / "unsafe-inputs", "test-run")
            raise AssertionError("private URL should fail")
        except ValueError:
            pass

        proposals = [
            {
                "proposal_id": "proposal-one",
                "source_family": "newsletter -> paper",
                "recommendation": "promote_with_correction",
                "change": "Correct and promote the method.",
                "evidence": "Primary paper.",
                "affected_pages": ["wiki/example.md"],
            }
        ]
        proposals_path = scratch / "proposals.json"
        proposals_path.write_text(json.dumps(proposals), encoding="utf-8")
        assert build_review(proposals_path, scratch / "chat", None) == 1
        rendered = (scratch / "chat" / "chat-review.md").read_text(encoding="utf-8")
        assert "newsletter -> paper" in rendered
        assert "übernehmen" not in rendered
        assert "1 hold akzeptieren" in rendered
        assert "1 korrektur:" in rendered
        assert "1 weitere verifikation" in rendered
        assert "1 promotion vorschlagen" in rendered
        assert "Current step: review ready" in rendered
        assert "Still unauthorized: new retrieval and durable wiki promotion" in rendered
        manifest = json.loads((scratch / "chat" / "decision-manifest-template.json").read_text())
        assert manifest["status"] == "provisional" and manifest["no_automatic_promotion"] is True
        assert manifest["allowed_actions"] == [
            "accept_hold",
            "submit_correction",
            "request_verification",
            "request_promotion_proposal",
            "defer",
        ]
        assert manifest["gate_status"] == {
            "review_step": "awaiting_explicit_action",
            "overall_intent": "open_until_all_items_decided",
            "retrieval_authorized": False,
            "wiki_promotion_authorized": False,
        }
    finally:
        if scratch.exists():
            shutil.rmtree(scratch)


if __name__ == "__main__":
    main()

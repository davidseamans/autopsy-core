# GitHub Checkpoint Test Runbook

## Purpose

Operational verification procedure for n8n GitHub checkpoint workflows.

This runbook validates real rollback authority behaviour.

---

# Test Objective

Prove that:
- n8n can write to GitHub
- GitHub commit exists
- commit is independently verifiable
- workflow fails correctly when proof missing

---

# Pass Criteria

Workflow must produce:
- valid GitHub commit SHA
- verified commit fetch-back
- expected file path exists
- operational log entry
- explicit PASS state

---

# Failure Criteria

FAIL if:
- commit SHA missing
- file not present in repository
- branch mismatch
- fetch-back verification fails
- workflow reports PASS without GitHub proof

---

# Manual Verification Procedure

1. Trigger workflow manually.
2. Record execution timestamp.
3. Capture returned commit SHA.
4. Open GitHub repository.
5. Verify commit exists.
6. Verify expected file path exists.
7. Verify commit branch.
8. Verify operational log entry.
9. Verify workflow PASS state.

---

# Required Test Output

```json
{
  "test_status": "PASS|FAIL",
  "github_commit_sha": "<sha>",
  "github_commit_verified": true,
  "expected_file_verified": true,
  "workflow_execution_verified": true,
  "failure_reason": null
}
```

---

# Governance Rule

No production workflow may be classified operational until this runbook passes.

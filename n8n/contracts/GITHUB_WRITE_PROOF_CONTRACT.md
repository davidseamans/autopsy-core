# GitHub Write Proof Contract

## Purpose

Defines the proof standard required before any n8n workflow may claim GitHub write success.

A Notion diary entry is not proof.
An HTTP 200 alone is not proof.
A node-level success flag is not proof.

GitHub write success is only valid when GitHub returns a concrete commit SHA and the workflow independently verifies that commit exists.

---

# Required Success Evidence

A workflow may only report GitHub success if all of the following are true:

1. GitHub write request completed without error
2. GitHub response includes commit SHA
3. Commit SHA is stored in workflow output
4. Commit SHA is fetched back from GitHub
5. Fetched commit metadata matches expected repository and branch
6. The expected file path exists at the resulting ref
7. Operational log records the verified commit SHA

---

# Invalid Success Evidence

The following are insufficient:

- n8n node says success
- Notion page was created
- HTTP request returned 200 without commit verification
- workflow reached final node
- diary entry says PASS
- GitHub node response exists but commit was not fetched back

---

# Required Workflow Output

```json
{
  "github_write_requested": true,
  "github_commit_sha": "<sha>",
  "github_commit_verified": true,
  "repository": "davidseamans/autopsy-core",
  "branch": "main",
  "path_written": "<path>",
  "proof_status": "PASS|FAIL",
  "failure_reason": null
}
```

---

# Failure Rule

If commit verification fails, workflow status must be FAIL even if Notion logging succeeds.

No workflow may mark itself PASS unless the GitHub proof contract passes.

---

# Canonical Principle

GitHub is rollback authority.
Therefore GitHub success must be verified from GitHub, not inferred from another system.

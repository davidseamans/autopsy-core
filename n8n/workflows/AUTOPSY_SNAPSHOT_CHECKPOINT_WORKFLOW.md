# AUTOPSY — SNAPSHOT CHECKPOINT — PROD

## Purpose

Create a controlled rollback point before any production-impacting mutation.

---

# Trigger Types

Allowed:
- manual execution
- scheduled checkpoint
- pre-migration event
- pre-release event
- emergency operator trigger

---

# Workflow Sequence

1. Validate payload contract
2. Validate environment
3. Verify GitHub availability
4. Verify Supabase availability
5. Create GitHub checkpoint commit/tag
6. Trigger Supabase snapshot process
7. Store rollback reference
8. Write operational log
9. Notify status endpoint

---

# Failure Rules

If GitHub checkpoint fails:
- STOP workflow
- NO mutation allowed

If Supabase snapshot fails:
- STOP workflow
- NO mutation allowed

No partial success state permitted.

---

# Required Outputs

Workflow must produce:
- github_commit_sha
- snapshot_id
- execution_timestamp
- workflow_version
- rollback_reference
- execution_status

---

# Operational Logging

Log destination:
- GitHub operational logs
- optional Notion visibility layer

Supabase is not the audit log for orchestration execution.

---

# Governance Rule

No production mutation workflow may bypass this checkpoint process.

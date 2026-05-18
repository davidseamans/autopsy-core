# Build Runbook — n8n GitHub Checkpoint Workflow

## Workflow Name

AUTOPSY — GITHUB CHECKPOINT PROOF — PROD

## Purpose

Build the first proof-gated n8n workflow.

The workflow must create a GitHub checkpoint file, capture the returned commit SHA, fetch the checkpoint back from GitHub, verify the result, and only then report PASS.

---

# Required Nodes

1. Manual Trigger
2. Set Checkpoint Payload
3. GitHub Create File
4. Set GitHub Commit SHA
5. GitHub Fetch File
6. IF Verify GitHub Proof
7. Set PASS Output
8. Set FAIL Output
9. Optional Notion Visibility Write

---

# Payload Fields

The workflow must generate these fields:

- checkpoint_id
- created_at_aest
- workflow_name
- workflow_version
- repository
- branch
- github_path
- status

Repository must be:

davidseamans/autopsy-core

Branch must be:

main

Checkpoint files must be written under:

checkpoints/

---

# GitHub Create File Node

This node must:

- create a new checkpoint JSON file
- write it to the checkpoints folder
- return a GitHub commit SHA
- fail if GitHub does not return a commit SHA

The checkpoint file content must include:

- checkpoint_id
- workflow_name
- workflow_version
- repository
- branch
- status
- proof_rule

---

# GitHub Fetch File Node

This node must fetch the same checkpoint file back from GitHub.

The workflow must verify:

- file exists
- checkpoint_id matches the generated checkpoint_id
- repository matches davidseamans/autopsy-core
- branch matches main

---

# PASS Condition

PASS requires all:

- commit SHA exists
- fetched file exists
- fetched checkpoint_id matches original checkpoint_id
- fetched repository matches expected repository
- fetched branch matches expected branch

If any condition fails, route to FAIL.

---

# PASS Output

Required output fields:

- proof_status = PASS
- checkpoint_id
- github_commit_sha
- github_commit_verified = true
- file_fetch_verified = true
- visibility_write_allowed = true

---

# FAIL Output

Required output fields:

- proof_status = FAIL
- checkpoint_id
- github_commit_verified = false
- file_fetch_verified = false
- visibility_write_allowed = false
- failure_reason

---

# Notion Visibility Rule

Only execute the Notion write from the PASS path.

Notion records the outcome.

GitHub proves the outcome.

---

# Acceptance Test

Workflow passes only when:

1. GitHub file exists.
2. Commit SHA exists.
3. File fetch-back succeeds.
4. IF node routes PASS.
5. Notion write occurs only after PASS.
6. A forced invalid file path routes FAIL.

---

# Non-Negotiable Rule

No production workflow may claim PASS from n8n execution status alone.

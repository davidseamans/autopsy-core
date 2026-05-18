# Operator Instructions — Retrofit Existing n8n Checkpoint Workflow

## Target Workflow

Existing workflow:

Autopsy - Create checkpoint

New status until proven:

LEGACY — DO NOT TRUST

---

## Objective

Clone and retrofit the existing workflow so it becomes proof-gated.

The workflow must not report PASS unless GitHub proves the checkpoint exists.

---

## Required Action

1. Open n8n.
2. Locate workflow: Autopsy - Create checkpoint.
3. Duplicate the workflow.
4. Rename the duplicate:

AUTOPSY — GITHUB CHECKPOINT PROOF — PROD

5. Disable the original workflow or rename it:

LEGACY — Autopsy - Create checkpoint — DO NOT TRUST

Do not delete it yet. Salvage credentials and working mappings only.

---

## Required Node Order

The new workflow must follow this order:

1. Manual Trigger
2. Set Checkpoint Payload
3. GitHub Create File
4. Capture GitHub Commit SHA
5. GitHub Fetch Same File
6. IF Verify GitHub Proof
7. PASS Output
8. FAIL Output
9. Optional Notion Visibility Write

---

## Build Rules

### Rule 1 — GitHub first

Do not connect Notion until GitHub proof works.

### Rule 2 — Commit SHA required

If GitHub does not return a commit SHA, the workflow must fail.

### Rule 3 — Fetch-back required

After creating the file, the workflow must fetch the same file back from GitHub.

### Rule 4 — PASS is forbidden without proof

n8n node success is not proof.

Notion diary entry is not proof.

Only GitHub fetch-back verification proves success.

---

## Checkpoint Payload

Generate a checkpoint payload with these fields:

- checkpoint_id
- created_at_aest
- workflow_name
- workflow_version
- repository
- branch
- github_path
- status

Required values:

repository = davidseamans/autopsy-core

branch = main

folder = checkpoints/

workflow_version = 1.0.0

status = WRITE_REQUESTED

---

## GitHub Create File Node

The node must create a new JSON file under checkpoints/.

The file must include:

- checkpoint_id
- created_at_aest
- workflow_name
- workflow_version
- repository
- branch
- status
- proof_rule

Commit message format:

n8n proof checkpoint [checkpoint_id]

---

## Capture Commit SHA

Immediately after GitHub Create File, capture the returned commit SHA.

Store as:

github_commit_sha

If missing, route to FAIL.

---

## GitHub Fetch File Node

Fetch the same file back from GitHub.

Verify:

- file exists
- checkpoint_id matches original checkpoint_id
- repository equals davidseamans/autopsy-core
- branch equals main

---

## IF Proof Gate

PASS only if all are true:

- github_commit_sha is not empty
- fetched file exists
- fetched checkpoint_id equals original checkpoint_id
- fetched repository equals davidseamans/autopsy-core
- fetched branch equals main

Otherwise FAIL.

---

## PASS Output

Required PASS fields:

proof_status = PASS
checkpoint_id = generated checkpoint ID
github_commit_sha = verified commit SHA
github_commit_verified = true
file_fetch_verified = true
visibility_write_allowed = true

---

## FAIL Output

Required FAIL fields:

proof_status = FAIL
checkpoint_id = generated checkpoint ID
github_commit_verified = false
file_fetch_verified = false
visibility_write_allowed = false
failure_reason = GitHub proof contract failed

---

## Notion Visibility Write

Only add Notion after the GitHub proof gate passes.

Notion may record:

- checkpoint_id
- proof_status
- github_commit_sha
- execution timestamp
- workflow name
- workflow version

Notion must not decide success.

---

## Required Tests

### Test 1 — Happy Path

Run workflow manually.

Expected:

- GitHub file created
- commit SHA returned
- same file fetched back
- IF routes PASS
- Notion writes only after PASS

### Test 2 — Forced Fail

Break the fetch path intentionally.

Expected:

- GitHub create may succeed
- fetch-back fails
- IF routes FAIL
- Notion PASS is not written

### Test 3 — Commit Missing Fail

Simulate missing commit SHA where possible.

Expected:

- workflow routes FAIL
- no PASS visibility write

---

## Acceptance Rule

The workflow is operational only after both PASS and FAIL behaviour are proven.

If only PASS is tested, the workflow is not approved.

---

## Final Classification

Original workflow remains legacy until inspected.

New workflow becomes production candidate only after proof-gated tests pass.

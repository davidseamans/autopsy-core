# AUTONOMOUS DIRECTIVE — Retrofit n8n Create Checkpoint Workflow

## Directive Status

Execution mode: autonomous
Human intervention: prohibited except for credential re-authorisation if the platform blocks execution
Target workflow: Autopsy - Create checkpoint
Target outcome: proof-gated GitHub checkpoint workflow

---

# Objective

Convert the existing n8n checkpoint workflow into a proof-gated control workflow.

The workflow must not claim PASS unless GitHub independently proves that the checkpoint file exists.

---

# Non-Negotiable Rules

1. Do not rely on n8n green-node status as proof.
2. Do not rely on Notion diary writes as proof.
3. Do not write PASS to Notion before GitHub verification.
4. Do not delete the legacy workflow.
5. Do not mutate Supabase.
6. Do not introduce business logic into n8n.
7. Do not require human interpretation during execution.

---

# Autonomous Execution Plan

## Step 1 — Quarantine Legacy Workflow

Locate workflow:

Autopsy - Create checkpoint

Rename or mark it as:

LEGACY — Autopsy - Create checkpoint — DO NOT TRUST

Disable production trigger if active.

Preserve credentials, node mappings, and payload references for salvage.

---

## Step 2 — Clone Workflow

Duplicate the legacy workflow.

Rename duplicate:

AUTOPSY — GITHUB CHECKPOINT PROOF — PROD

Set workflow status to inactive until all tests pass.

---

## Step 3 — Replace Workflow Logic

The cloned workflow must contain this proof sequence:

1. Trigger
2. Build checkpoint payload
3. Create GitHub checkpoint file
4. Capture GitHub commit SHA
5. Fetch same checkpoint file from GitHub
6. Verify fetched content against original payload
7. Route PASS only if proof succeeds
8. Route FAIL if any proof check fails
9. Write Notion visibility only from PASS route

---

# Required Checkpoint Payload

Each execution must generate:

- checkpoint_id
- created_at_aest
- workflow_name
- workflow_version
- repository
- branch
- github_path
- status

Required constants:

repository = davidseamans/autopsy-core
branch = main
workflow_name = AUTOPSY — GITHUB CHECKPOINT PROOF — PROD
workflow_version = 1.0.0
status = WRITE_REQUESTED
github folder = checkpoints/

Checkpoint ID format:

CHK-[YYYYMMDD-HHMMSS]-N8N-LIVE-PROOF

GitHub path format:

checkpoints/[checkpoint_id].json

---

# GitHub Create File Requirements

Create a JSON file at the generated GitHub path.

The file content must include:

- checkpoint_id
- created_at_aest
- workflow_name
- workflow_version
- repository
- branch
- status
- proof_rule

proof_rule value:

PASS is forbidden until GitHub fetch-back verification succeeds.

Commit message format:

n8n proof checkpoint [checkpoint_id]

The returned GitHub commit SHA must be stored as:

github_commit_sha

If github_commit_sha is empty, route FAIL.

---

# GitHub Fetch-Back Requirements

Fetch the exact same file from GitHub using:

repository = davidseamans/autopsy-core
branch/ref = main
path = generated github_path

The fetched file must be parsed and compared against the original payload.

---

# Proof Gate Requirements

PASS only if all checks are true:

- github_commit_sha exists
- fetched file exists
- fetched checkpoint_id equals original checkpoint_id
- fetched repository equals davidseamans/autopsy-core
- fetched branch equals main
- fetched workflow_name equals AUTOPSY — GITHUB CHECKPOINT PROOF — PROD
- fetched workflow_version equals 1.0.0

If any check fails, route FAIL.

---

# PASS Output Contract

PASS output must include:

proof_status = PASS
checkpoint_id = generated checkpoint ID
github_commit_sha = returned commit SHA
github_commit_verified = true
file_fetch_verified = true
visibility_write_allowed = true
failure_reason = null

---

# FAIL Output Contract

FAIL output must include:

proof_status = FAIL
checkpoint_id = generated checkpoint ID if available
github_commit_sha = captured commit SHA if available
github_commit_verified = false
file_fetch_verified = false
visibility_write_allowed = false
failure_reason = explicit failed proof condition

---

# Notion Visibility Rule

Notion write is allowed only from the PASS branch.

Notion may record:

- checkpoint_id
- proof_status
- github_commit_sha
- execution timestamp
- workflow_name
- workflow_version

Notion must not be used as proof of GitHub success.

---

# Mandatory Tests

## Test A — Valid GitHub Proof

Run workflow with normal payload.

Expected result:

- GitHub file created
- commit SHA captured
- same file fetched back
- proof gate routes PASS
- Notion visibility write permitted only after PASS

## Test B — Broken Fetch Path

Force the fetch path to use an invalid GitHub path.

Expected result:

- workflow routes FAIL
- Notion PASS is not written
- failure_reason identifies fetch-back failure

## Test C — Broken Expected Value

Force expected branch or repository comparison to mismatch.

Expected result:

- workflow routes FAIL
- Notion PASS is not written
- failure_reason identifies mismatch

---

# Acceptance Criteria

Workflow is approved only when:

1. Test A passes.
2. Test B fails safely.
3. Test C fails safely.
4. No Notion PASS record is created before GitHub proof.
5. Legacy workflow remains quarantined.
6. New workflow remains inactive until tests are complete.

---

# Completion Report Required

After execution, create a completion report containing:

- workflow name
- test timestamps
- checkpoint IDs generated
- GitHub commit SHAs returned
- PASS/FAIL results
- failure reasons from negative tests
- final workflow status

---

# Final Rule

If authoritative proof is absent, the workflow must fail.

No exceptions.

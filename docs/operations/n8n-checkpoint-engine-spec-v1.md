# n8n Checkpoint Engine Specification v1

## Purpose

Build the operational control layer that prevents another manual recovery event.

The checkpoint engine exists so Autopsy/Core/Sleeve/Cuff can be restored from verified system checkpoints using a repeatable process.

Final standard:

```text
A non-technical support operator selects a verified checkpoint, presses one button, and receives PASS or FAIL.
```

---

# Required workflows

## Workflow 1 — Autopsy — Create Checkpoint

Purpose:

```text
Capture the current verified system state into a machine-readable checkpoint manifest.
```

Initial trigger:

```text
Manual Trigger
```

Future trigger:

```text
Webhook / button / bookmark
```

### Node sequence

1. Manual Trigger
2. Set checkpoint metadata
3. Query Supabase canon state
4. Query Supabase validation runs
5. Query Supabase stale/incomplete run status
6. Query GitHub latest commit on main
7. Build checkpoint manifest JSON
8. Commit manifest to GitHub under `/checkpoints/`
9. Create Notion checkpoint page
10. Return PASS / FAIL response

### Required inputs

```json
{
  "checkpoint_id": "CHK-YYYYMMDD-HHMM-AEST",
  "reason": "operator supplied reason",
  "mode": "manual"
}
```

### Required Supabase checks

```sql
select count(*) from public.questions where is_active = true;
select count(*) from public.questions where q_id ilike 'S1_%';
select id, run_name, status, score_total, verdict_name, primary_risk, weakest_dimension, permission_level, completed_at
from public.autopsy_runs
where run_name in ('Low Hard Fail Validation', 'UI MID BAND VALIDATION 2026-05-17 — RETEST', 'UI HIGH BAND VALIDATION 2026-05-17 - Test 2');
```

Future version should parameterise validation run names rather than hardcode them.

### PASS criteria

```text
active_question_count = 10
s1_prefixed_question_count = 0
low validation completed
mid validation completed
high validation completed
GitHub commit found
manifest committed
Notion page created
```

---

## Workflow 2 — Autopsy — Verify Checkpoint

Purpose:

```text
Compare current live system state against a selected checkpoint manifest.
```

Initial trigger:

```text
Manual Trigger
```

### Node sequence

1. Manual Trigger
2. Select checkpoint_id
3. Fetch checkpoint manifest from GitHub
4. Query current Supabase state
5. Query current Lovable project identity manually or via stored manifest
6. Compare expected vs actual
7. Return PASS / FAIL with exact mismatch list
8. Write verification result to Notion

### Required comparison fields

```text
Supabase project_ref
Lovable project_id
GitHub repo
GitHub branch
active question count
S1 prefix count
validation run status
critical RPC availability
known issue status
```

### FAIL behaviour

If any required field mismatches:

```text
STOP
DO NOT RESTORE
REPORT MISMATCH
```

---

## Workflow 3 — Autopsy — Restore Checkpoint

Purpose:

```text
Restore or guide restoration to a selected verified checkpoint.
```

This must be built last.

### Required trigger

```text
Manual Trigger with checkpoint_id
```

### Required guardrail

The workflow must refuse to run unless:

```text
checkpoint_status = VERIFIED
```

### Restore stages

1. Fetch checkpoint manifest.
2. Confirm checkpoint is VERIFIED.
3. Confirm operator approval.
4. Confirm target system IDs match expected production IDs.
5. Restore GitHub reference or instruct checkout.
6. Apply Supabase migrations/snapshot restore path.
7. Verify Lovable project identity/export state.
8. Run low/mid/high validation.
9. Create Notion restore report.
10. Return RESTORE COMPLETE — VALIDATION PASS or FAIL.

### Do not automate destructive restore until proven on non-production

First restore test must run against a development/sandbox environment.

---

# Checkpoint manifest contract

```json
{
  "checkpoint_id": "CHK-YYYYMMDD-HHMM-AEST",
  "checkpoint_status": "VERIFIED|DRAFT|FAILED|PARTIAL",
  "created_at_aest": "YYYY-MM-DD HH:mm:ss AEST",
  "created_by": "operator|system",
  "reason": "string",
  "systems": {
    "github": {
      "repository": "davidseamans/autopsy-core",
      "branch": "main",
      "commit_sha": "string",
      "tag": "string"
    },
    "supabase": {
      "project_name": "autopsy-canonical",
      "project_ref": "fzbdztapkyrfwjwxtwte",
      "active_question_count": 10,
      "s1_prefixed_question_count": 0
    },
    "lovable": {
      "project_name": "Autopsy Gateway Shell",
      "project_id": "f9ce02c9-c9fa-4b07-917c-0d521d6aff74"
    },
    "notion": {
      "checkpoint_page_url": "string"
    }
  },
  "validated_runs": {
    "low_band": {
      "run_id": "uuid",
      "score_total": 0,
      "verdict_name": "Not Viable",
      "permission_level": "locked"
    },
    "mid_band": {
      "run_id": "uuid",
      "score_total": 15,
      "verdict_name": "High Risk|Not Viable",
      "permission_level": "blocked|conditional"
    },
    "high_band": {
      "run_id": "uuid",
      "score_total": 30,
      "verdict_name": "Structurally Viable",
      "permission_level": "granted"
    }
  },
  "known_deferred_items": [],
  "restore_manual": {
    "document": "docs/operations/teenage-support-restore-manual-v1.md",
    "status": "created"
  }
}
```

---

# Access and credential requirements

n8n will need controlled access to:

## Supabase

Minimum:

```text
read operational tables
call validation/read RPCs
```

Production write access must be restricted.

## GitHub

Minimum:

```text
create/update checkpoint manifest files
read commit refs
create issue/report if workflow fails
```

## Notion

Minimum:

```text
create checkpoint report pages
update operational dashboard/status
```

## Lovable

If direct API/export is unavailable, checkpoint manifest must store project ID and manual export status until a direct export path exists.

---

# Current checkpoint baseline

Current verified checkpoint:

```text
CHK-20260517-AUTOPSY-RECOMMISSIONED
```

Manifest:

```text
checkpoints/CHK-20260517-AUTOPSY-RECOMMISSIONED.json
```

Restore manual:

```text
docs/operations/teenage-support-restore-manual-v1.md
```

---

# Implementation order

1. Build Workflow 1 — Create Checkpoint.
2. Run it manually.
3. Compare generated manifest against existing checkpoint file.
4. Build Workflow 2 — Verify Checkpoint.
5. Prove verify returns PASS against current system.
6. Only then design Restore Workflow.
7. Test restore against sandbox/dev, not production.

---

# Non-negotiable rule

No future Core/Sleeve/Cuff milestone ships unless:

```text
checkpoint created
checkpoint verified
restore manual still accurate
```

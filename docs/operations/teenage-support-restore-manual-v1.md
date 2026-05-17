# Teenage Support Restore Manual v1

## Purpose

This manual exists so a non-technical support operator can restore Autopsy from a known-good checkpoint without needing David, John, or project history in chat.

Target operator:

```text
A careful teenage support person with access credentials and this manual.
```

They should not need to understand Supabase internals, Lovable internals, or code architecture.

They should know:

```text
which button to press
which checkpoint to choose
how to confirm success
when to stop and escalate
```

---

# Golden Rule

Do not improvise.

If anything differs from this manual:

```text
STOP
DO NOT CLICK RANDOMLY
ESCALATE
```

---

# System Components

Autopsy depends on five controlled systems:

| Layer | System | Purpose |
|---|---|---|
| 1 | GitHub | Version authority and restore files |
| 2 | Supabase | Database, schema, RPCs, runtime data |
| 3 | Lovable | User interface |
| 4 | n8n | Restore/checkpoint automation |
| 5 | Notion | Human-readable operating log and canon |

A restore is only successful when all five agree.

---

# One Button Target

The final restore process must expose one operator action:

```text
n8n → Workflow → Autopsy — Restore Checkpoint → Execute
```

The operator selects:

```text
checkpoint_id
```

and presses:

```text
Execute Workflow
```

The workflow must then restore or verify:

1. GitHub version
2. Supabase schema/data checkpoint
3. Lovable project identity/export state
4. Notion operational log
5. Validation runs

---

# Checkpoint Definition

A valid checkpoint is not just a backup.

A checkpoint must include:

```json
{
  "checkpoint_id": "CHK-YYYYMMDD-HHMM-AEST",
  "created_at_aest": "YYYY-MM-DD HH:mm:ss AEST",
  "created_by": "system|operator",
  "reason": "why this checkpoint exists",
  "github": {
    "repo": "davidseamans/autopsy-core",
    "branch": "main",
    "commit_sha": "...",
    "tag": "checkpoint/..."
  },
  "supabase": {
    "project_ref": "fzbdztapkyrfwjwxtwte",
    "project_name": "autopsy-canonical",
    "migration_version": "...",
    "schema_snapshot_file": "...",
    "data_snapshot_file": "...",
    "rpc_manifest_file": "..."
  },
  "lovable": {
    "project_name": "Autopsy Gateway Shell",
    "project_id": "f9ce02c9-c9fa-4b07-917c-0d521d6aff74",
    "published_url": "...",
    "export_commit_sha": "...",
    "last_verified_at": "..."
  },
  "notion": {
    "checkpoint_page_url": "...",
    "canon_page_url": "..."
  },
  "validation": {
    "low_band_run_id": "...",
    "mid_band_run_id": "...",
    "high_band_run_id": "...",
    "status": "pass"
  },
  "known_issues": []
}
```

If any of those fields are missing, it is not a full restore checkpoint.

---

# Restore Modes

## Mode A — Verification Only

Use when the system seems suspicious but not broken.

Action:

```text
Run n8n workflow: Autopsy — Verify Latest Checkpoint
```

Expected result:

```text
PASS — system matches checkpoint
```

If failed:

```text
STOP and escalate
```

---

## Mode B — Soft Restore

Use when UI or configuration drift is suspected.

Restores/verifies:

- GitHub commit reference
- Lovable project identity
- Supabase migrations/functions
- Notion checkpoint log

Does not overwrite live business data unless explicitly approved.

---

## Mode C — Full Restore

Use only when the system is materially broken.

Requires:

```text
explicit owner approval
```

Restores:

- schema
- functions/RPCs
- policies
- canonical data tables
- Lovable UI version/export
- Notion operating state

Business/customer data restore must be handled separately and carefully.

---

# Operator Procedure — One Button Restore

## Step 1 — Open n8n

Open:

```text
n8n dashboard
```

Find workflow:

```text
Autopsy — Restore Checkpoint
```

## Step 2 — Select checkpoint

Choose the latest checkpoint marked:

```text
status = VERIFIED
```

Never restore from:

```text
DRAFT
FAILED
PARTIAL
UNKNOWN
```

## Step 3 — Press Execute

Click:

```text
Execute Workflow
```

Do not close browser.

## Step 4 — Wait for final result

Expected:

```text
RESTORE COMPLETE — VALIDATION PASS
```

If result is anything else:

```text
STOP
TAKE SCREENSHOT
ESCALATE
```

---

# Post-Restore Validation

The restore workflow must automatically run or verify three test paths:

| Test | Expected |
|---|---|
| Low / hard-fail | Not Viable, score 0, locked |
| Mid-band | High Risk or Not Viable if hard-fail/critical constraint applies |
| High-band | Structurally Viable, score 30, granted |

Manual check in Lovable:

1. Open Autopsy Gateway Shell.
2. Confirm Start screen loads.
3. Click Run History.
4. Confirm latest validation rows exist.
5. Open latest high-band run.
6. Confirm no fake primary constraint appears on Structurally Viable output.

---

# Current Known Canonical IDs

## Supabase

```text
Project name: autopsy-canonical
Project ref: fzbdztapkyrfwjwxtwte
```

## Lovable

```text
Project name: Autopsy Gateway Shell
Project ID: f9ce02c9-c9fa-4b07-917c-0d521d6aff74
```

## GitHub

```text
Repository: davidseamans/autopsy-core
Production branch: main
```

---

# What Support Must Never Do

Never:

- create a new Lovable project
- create a new Supabase project unless the restore workflow explicitly requires it
- edit database tables manually
- edit RPCs manually
- delete runs
- delete questions
- delete answer options
- rename canonical systems
- publish from an unknown Lovable project
- restore from an unverified checkpoint

---

# Escalation Conditions

Escalate if:

- n8n workflow fails
- checkpoint status is not VERIFIED
- Supabase project ref differs from `fzbdztapkyrfwjwxtwte`
- Lovable project ID differs from `f9ce02c9-c9fa-4b07-917c-0d521d6aff74`
- GitHub repo differs from `davidseamans/autopsy-core`
- validation fails
- History does not show completed runs
- UI says Not Viable for a 30/30 high-band test
- system asks to create a new project unexpectedly

---

# Maintenance Rule

Every time Core, Sleeve, or Cuff changes:

1. Create checkpoint.
2. Update checkpoint manifest.
3. Update this manual if restore steps changed.
4. Run low/mid/high validation.
5. Mark checkpoint VERIFIED only after validation passes.

No exception.

---

# Current Build Priority

Next required implementation work:

1. Build n8n `Autopsy — Create Checkpoint` workflow.
2. Build n8n `Autopsy — Verify Checkpoint` workflow.
3. Build n8n `Autopsy — Restore Checkpoint` workflow.
4. Store checkpoint manifests in GitHub.
5. Mirror checkpoint status into Notion.
6. Prove restore on a non-production branch/project before trusting it.

---

# Final Standard

The restore process is acceptable only when this statement is true:

```text
A non-technical support operator can restore Autopsy by selecting a verified checkpoint and pressing one button, then reading PASS or FAIL.
```

Until that is true, recovery is not finished.

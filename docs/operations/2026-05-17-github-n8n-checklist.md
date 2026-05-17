# 2026-05-17 — GitHub + n8n Operational Checklist

## Current operating phase

Autopsy restoration is effectively complete.

Current phase:

```text
stabilisation + operational maturity
```

Validated today:

- Low hard-fail UI path
- Mid-band UI path
- High-band UI path
- 10-question flow
- no S1_ prefix
- finalize orchestration
- history rendering
- worksheet routing
- question parity for Q9/Q10

Deferred:

- question-quality redesign
- randomisation
- user/operator level adaptation
- industry sleeve question variants

## Non-negotiable rule

Do not expand product scope until version control, snapshot discipline, and automation contracts are stable.

---

# Part A — GitHub operating checklist

## A1. Repository source of truth

Repository:

```text
davidseamans/autopsy-core
```

Purpose:

- migration history
- restoration records
- validation evidence
- operational checklists
- issue backlog
- future n8n contracts
- canonical documentation snapshots

## A2. Branch policy

Recommended branches:

```text
main = production / protected truth
dev = active controlled development
feature/* = isolated changes
```

Rules:

- no direct unlogged production changes
- every Supabase migration gets documented in GitHub
- every Lovable directive that changes behaviour gets recorded
- major fixes get a validation note
- unresolved defects become GitHub issues

## A3. Commit discipline

Every meaningful change should answer:

```text
what changed?
why changed?
how validated?
rollback path?
```

Recommended commit message patterns:

```text
docs: record validation pass
fix: repair finalize orchestration
migration: harden autopsy lifecycle rpc
ops: add n8n payload contract
backlog: log question-quality review
```

## A4. Required GitHub artefacts

Already created today:

- `docs/restoration/2026-05-17-recommissioning-proof.md`
- `docs/validation/2026-05-17-lovable-ui-validation-pass.md`
- GitHub issue for Q9/Q10 question-quality review

Still required:

- RPC contract document
- n8n payload contract document
- snapshot/rollback runbook
- Lovable canonical project record
- release checkpoint note after final UI polish

## A5. GitHub issue backlog categories

Use labels:

```text
autopsy
backend
frontend
lovable
n8n
snapshot
validation
question-quality
canon
core-deferred
```

Immediate open items to track:

1. Lovable UI polish
   - make Run History button visually consistent
   - ensure Back/New Run behaviour is distinct and intuitive

2. Dimension display regression protection
   - never fake missing dimension scores as zero

3. Legacy RPC compatibility
   - migrate UI from `record_autopsy_answer` to `rpc_submit_answer`

4. Question quality review
   - Q9/Q10 self-attestation concerns

5. n8n contracts
   - webhook/payload definitions

---

# Part B — Supabase/GitHub snapshot checklist

## B1. Daily snapshot requirement

At end of day, capture:

```text
schema state
RPC definitions
critical table counts
validation run IDs
advisor warning state
latest GitHub commit SHA
Lovable project ID
```

## B2. Minimum snapshot metadata

Record:

```text
date/time AEST
operator
Supabase project ref
GitHub repo
branch
latest commit
validated run IDs
known warnings
open defects
rollback notes
```

## B3. Tables/functions worth snapshotting

Critical Autopsy tables:

```text
questions
answer_options
verdict_bands
verdict_templates / verdict_narratives
run_questions
autopsy_runs
autopsy_answers
run_dimension_scores
restoration_import_log
system_mutations
```

Critical RPCs:

```text
create_autopsy_run
record_autopsy_answer
rpc_submit_answer
finalize_autopsy_run
finalize_autopsy_run_internal
recalculate_run_dimension_scores
apply_hard_fail
refresh_autopsy_intelligence
get_autopsy_gateway_payload
```

## B4. Advisor check cadence

Run after any DDL/security change:

```text
Supabase security advisors
Supabase performance advisors
```

Classify warnings:

```text
expected
must fix
deferred core
false positive / acceptable risk
```

---

# Part C — n8n automation checklist

## C1. n8n replaces Make.com

Do not design new Make.com flows.

Automation layer:

```text
n8n
```

## C2. First n8n objective

Build a manual snapshot trigger.

Goal:

```text
one button / webhook / bookmark
→ create operational snapshot
→ commit/log snapshot reference
→ optionally notify Notion
```

## C3. Recommended first workflow

Workflow name:

```text
Autopsy — Manual Snapshot Checkpoint
```

Trigger options:

```text
Manual Trigger during testing
Webhook Trigger after stable
```

Steps:

1. Receive trigger.
2. Generate checkpoint timestamp.
3. Query Supabase for state summary.
4. Query recent completed runs.
5. Query advisor status if supported externally, or log manual advisor state.
6. Create snapshot payload.
7. Commit snapshot file to GitHub or call GitHub API.
8. Create/update Notion checkpoint page.
9. Return success/failure response.

## C4. Snapshot payload shape

Suggested JSON:

```json
{
  "checkpoint_type": "manual_snapshot",
  "timestamp_aest": "YYYY-MM-DD HH:mm:ss AEST",
  "supabase_project_ref": "fzbdztapkyrfwjwxtwte",
  "github_repo": "davidseamans/autopsy-core",
  "github_branch": "main",
  "lovable_project_id": "f9ce02c9-c9fa-4b07-917c-0d521d6aff74",
  "runtime_status": {
    "autopsy_low_path": "pass",
    "autopsy_mid_path": "pass",
    "autopsy_high_path": "pass",
    "history": "pass",
    "worksheet": "pass"
  },
  "known_defects": [],
  "open_backlog": [],
  "validation_runs": []
}
```

## C5. n8n second workflow

Workflow name:

```text
Autopsy — Completed Run Event Logger
```

Trigger options:

```text
Supabase webhook
polling query
scheduled check
```

Purpose:

When an Autopsy run reaches:

```text
status = completed
```

send structured payload to:

```text
Notion visibility layer
GitHub validation log if required
future reporting system
```

## C6. Completed run payload contract

Minimum event payload:

```json
{
  "event_type": "autopsy_run_completed",
  "run_id": "uuid",
  "run_name": "string",
  "created_at": "timestamp",
  "completed_at": "timestamp",
  "tester_email": "string",
  "industry": "Cleaning",
  "scenario": "startup",
  "operator_class": "unproven",
  "score_total": 0,
  "verdict_name": "Not Viable | High Risk | Viable | Structurally Viable",
  "primary_risk": "string",
  "primary_risk_code": "string",
  "weakest_dimension": "string",
  "weakest_score": 0,
  "permission_level": "locked | blocked | conditional | granted",
  "evidence_mode": "string",
  "hard_fail_question_id": "uuid|null",
  "dimension_scores": [],
  "worksheet_output": "string",
  "retest_condition": "string"
}
```

## C7. n8n guardrails

n8n must not become an uncontrolled write layer.

Rules:

- n8n may read Supabase operational state
- n8n may create Notion visibility records
- n8n may create GitHub documentation/log artefacts
- n8n must not mutate scoring, questions, verdict logic, or core RPCs
- any production mutation requires explicit logged directive

## C8. n8n success KPIs

Measure:

```text
snapshot time saved
time to rollback reference
number of unlogged changes reduced to zero
validation evidence completeness
EOD report automation percentage
manual copy/paste reduction
```

---

# Part D — Immediate next sequence

## Step 1 — Finish Lovable UI polish

Remaining UI polish only:

- Run History link on start screen works; make it visually clear
- Back/New Run distinction is intuitive
- verify high-band dimension profile after latest Lovable patch

## Step 2 — Commit final UI validation note

Create/update GitHub validation record with:

- low pass
- mid pass
- high pass
- remaining cosmetic notes

## Step 3 — Create RPC contract document

Document official frontend RPC contract:

```text
create_autopsy_run
rpc_submit_answer
finalize_autopsy_run
get_autopsy_gateway_payload
```

Also document temporary compatibility RPC:

```text
record_autopsy_answer
```

## Step 4 — Build n8n manual snapshot workflow

Start with manual trigger.

Do not attempt full automation until manual snapshot proves reliable.

## Step 5 — Add completed-run event workflow

Only after snapshot workflow is stable.

## Step 6 — Return to product improvement

Deferred product work:

- question quality
- randomisation
- user-level adaptation
- cleaning sleeve
- evidence tiers

---

# Current status statement

Autopsy is mechanically recommissioned.

Next operational objective:

```text
convert today’s recovery into repeatable governance
```

That means GitHub discipline first, n8n snapshot automation second, product enhancement third.

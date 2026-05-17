# 2026-05-17 — n8n Checkpoint Workflow Proof

## Result

Two n8n checkpoint governance workflows now exist in working form.

## Workflow 1 — Autopsy — Create Checkpoint

Status: PASS

Verified capabilities:

- Manual trigger
- Supabase read verification
- Active question check
- S1 prefix check
- Validation run check
- GitHub repository check
- Checkpoint manifest build
- GitHub checkpoint file commit
- PASS / FAIL result branch

Scope:

- Non-destructive
- No Supabase mutation
- No restore logic

## Workflow 2 — Autopsy — Verify Checkpoint

Status: PASS after sequential refactor

Initial issue:

```text
Parallel branch item pairing caused Compare States failure.
```

Fix:

```text
Refactored verification checks into a sequential chain.
```

Verified capabilities:

- Fetch checkpoint manifest from GitHub
- Parse checkpoint manifest
- Read live Supabase state
- Compare active question count
- Compare S1-prefixed question count
- Compare low/mid/high validation runs
- Verify GitHub repository accessibility
- Return PASS / FAIL with exact mismatches

Scope:

- Read-only
- No Supabase mutation
- No GitHub writes
- No restore logic

## Operational significance

This establishes the first working version of checkpoint governance:

```text
Create checkpoint
Verify checkpoint
```

Restore workflow is intentionally not built yet.

Correct sequence remains:

1. Create checkpoint workflow
2. Verify checkpoint workflow
3. Notion logging
4. Notification/failure alerting
5. Sandbox restore proof
6. Production restore workflow

## Current standard

Checkpoint and verification are now machine-executed after trigger.

Human role is limited to:

```text
trigger
review PASS / FAIL
approve destructive restore later
```

No manual assembly or interpretation is required for checkpoint creation or verification.

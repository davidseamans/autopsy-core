# 2026-05-14 — Automatic Recovery Runbook v1

## Purpose

This runbook exists so future recovery is mechanical, not emotional.

If a Lovable/Supabase/GitHub incident occurs, do not improvise. Follow this checklist.

## Non-negotiables

1. Do not delete or pause the old source project until the replacement produces identical accepted output.
2. Do not ask Lovable to invent product content.
3. Do not rebuild from memory.
4. Do not treat database connectivity as product recovery.
5. Do not accept a visually or behaviourally different app as restored.
6. Preserve the forensic source before mutation.

## Recovery authority order

1. Old Supabase project data and schema
2. GitHub committed source/migrations/docs
3. Notion canonical EOD/directives
4. Screenshots and recorded UI evidence
5. Lovable project state/export, if available
6. Human memory only as last resort

## Recovery phases

### Phase 0 — Stabilise

- Stop feature work.
- Stop Lovable creative regeneration.
- Record the incident in GitHub.
- Confirm source project remains untouched.
- Confirm target project exists and is healthy.

### Phase 1 — Forensic inventory

- List all tables in old Supabase project.
- Count tables and rows.
- Classify tables as:
  - CORE CANONICAL
  - ACTIVE SUPPORTING
  - PIPELINE CORE
  - GOVERNANCE / SYSTEM INTELLIGENCE
  - ADVANCED STRUCTURAL ENGINE
  - ARCHIVE / FORENSIC
  - EXPERIMENTAL
  - DUPLICATE
  - DEAD

### Phase 2 — Schema-first recovery

- Recreate clean tables in the new canonical project.
- Do not import broken migration lineage.
- Preserve old IDs where they are needed for relationships.
- Enable RLS deliberately.
- Add policies after app requirements are known.

### Phase 3 — Data rehydration

- Copy data assets from the old project to the new project.
- Prefer clean INSERT/SELECT transfer or CSV/JSON-style extraction.
- Preserve canonical question, answer, narrative, verdict, worksheet, progression, and pipeline data.

### Phase 4 — Logic recovery

- Rebuild RPCs, functions, triggers, and views deliberately.
- Do not bulk-copy unsafe SECURITY DEFINER functions without review.
- Set explicit search_path on all rebuilt functions.

### Phase 5 — Frontend rebinding

- Lovable must render database content only.
- No local diagnostic arrays.
- No generated questions.
- No generic business copy.
- No UI acceptance without screenshot comparison.

### Phase 6 — Validation

Validate:

- Autopsy starts correctly.
- Canonical dropdowns match accepted prior state.
- Question set matches accepted prior state.
- Answer options match accepted prior state.
- Hard fail behaviour works.
- Score bands work.
- Verdict copy matches accepted state.
- Worksheet access exists.
- Pipeline screens exist.
- Leads, accounts, contacts, sites, quotes, jobs flow works.
- Screenshots match accepted baseline.

### Phase 7 — Release lock

Only after validation:

- Commit final migrations and seed packs.
- Tag GitHub release.
- Capture screenshots.
- Export Make scenarios.
- Record Supabase project ref and schema state.
- Record Lovable project URL/ref.

## Emergency shortcut forbidden

Do not connect a blank frontend to a minimal database and call it recovered.

That is not recovery. That is a new prototype.

## Current incident lesson

The 2026-05-14 incident proved that backend connectivity is insufficient. Product identity includes wording, routes, colours, visuals, layouts, flows, charts, worksheet access, and operator comprehension.

Future snapshots must capture the whole product down to visual and behavioural minutiae.

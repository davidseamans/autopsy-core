# 2026-05-14 — Infallible Recovery and Release Standard

## Standard

The target is not “strong”.

The target is infallible within practical engineering limits.

Infallible means the platform can be restored, verified, and released without invention, memory, panic, or guesswork.

## Definition of infallible recovery

A recovery process is acceptable only if it can prove:

1. The source of truth is identified.
2. The source is preserved before mutation.
3. The recovery target is clean.
4. Polluted runtime data is excluded.
5. Canonical doctrine is rehydrated exactly.
6. Runtime structures are rebuilt cleanly.
7. Frontend rendering is bound to canonical content only.
8. Visual and behavioural state is validated against baseline evidence.
9. Every recovery action is logged.
10. The result can be repeated by checklist.

## Anti-failure rules

### Rule 1 — No invention during recovery

No AI-generated questions, verdicts, dropdown labels, UI copy, or workflows are allowed during recovery unless explicitly marked provisional.

### Rule 2 — Runtime history is not canon

Rows from runtime tables are not automatically promoted:

- autopsy_runs
- autopsy_answers
- run_questions
- run_dimension_scores
- run_worksheets
- run_worksheet_actions
- run_worksheet_evidence
- run_worksheet_retest_gates
- telemetry_events

Runtime tables are recreated clean unless a forensic comparison requires selected historical rows.

### Rule 3 — Canonical doctrine first

Before frontend work resumes, the following must be restored:

- dimensions
- questions
- answer_options
- verdict_bands
- verdict_narratives
- verdict_templates
- dimension failure profiles
- pressure profiles
- evidence profiles
- invalidation rules
- recovery validation
- worksheet templates
- progression gates

### Rule 4 — Lovable is renderer, not authority

Lovable must consume canonical tables and RPCs/views.

It must not create product doctrine.

### Rule 5 — Snapshot means exact restore

A snapshot is valid only if it captures:

- database schema
- seed data
- functions/RPCs
- views
- triggers
- RLS policies
- frontend source
- visual screenshots
- release URL/state
- Make scenario exports
- Notion canon references

If the restored product looks or behaves differently, the snapshot failed.

## Release gate

No release is accepted unless it passes:

- data integrity validation
- schema validation
- canonical content validation
- lifecycle validation
- frontend screenshot comparison
- verdict output comparison
- worksheet access validation
- pipeline flow validation
- rollback test

## Core doctrine

The system must be hard to fake, hard to corrupt, and easy to restore.

Anything less is not production-grade.

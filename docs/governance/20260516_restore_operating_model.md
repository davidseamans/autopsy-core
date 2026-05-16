# 2026-05-16 — Restore Operating Model Notes

## Core lesson
A restore is not complete because the database connects or the UI loads.

A restore is complete only when behavioural parity, narrative parity, UI parity, and governance parity are proven.

## Required restore sequence
1. Supabase schema + RPC audit
2. Supabase content/intelligence audit
3. Lovable reference project reuse check
4. GitHub snapshot comparison
5. UI snapshot manifest check
6. Behavioural test matrix

## Non-negotiable doctrine
Never rebuild from memory when a source artifact may exist.

Use the following hierarchy:
1. Accepted GitHub governance/snapshots
2. Accepted UI snapshot manifest
3. Lovable reference project reuse / Add reference
4. Legacy Lovable project
5. Legacy Supabase project
6. Historical run outputs
7. Screenshots
8. Written directives
9. Controlled reconstruction only as last resort

## Restore must validate these layers
- schema
- RPCs
- triggers
- active question canon
- answer options
- hard_fail options
- verdict bands
- pressure profiles
- failure profiles
- narrative templates
- worksheet templates
- frontend routes
- UI layout and behaviour
- historical run drilldown
- scoring gradient
- final UX acceptance

## Behavioural test matrix
After any restore, prove the following outputs:
- 0 score
- hard_fail triggered score
- 14
- 15
- 16
- 24
- 25
- 30

Each test must verify:
- verdict band
- final verdict label
- primary constraint
- pressure stage
- pressure summary
- mechanical failure chain
- execution diagnosis
- mechanism steps
- final outcome
- worksheet output
- retest condition
- UI rendering

## Lovable reference reuse rule
Before any future Lovable rebuild or UI recovery, use Lovable's "Reuse work from other projects" / "Add reference" option where available.

Reference reuse must be checked before manual UI reconstruction.

## UI snapshot rule
Every accepted UI state must be captured and committed with:
- route
- screenshot
- expected behaviour
- backend project ref
- frontend project ID
- accepted date/time
- status: draft / accepted / superseded

## Current canonical refs
- Lovable canonical project: `f9ce02c9-c9fa-4b07-917c-0d521d6aff74`
- Supabase canonical project: `fzbdztapkyrfwjwxtwte`
- Legacy Supabase source observed during recovery: `pjbiylbzlacbzgzkppzf`

## Current recovery status
Operational runtime has been largely restored. The current active recovery workstream remains:
- narrative intelligence restoration
- severity language restoration
- mechanical failure chain enrichment
- pressure-profile rendering
- permission/progression logic
- final UX refinement

## Standard
If the system cannot prove behavioural parity, it is not restored.
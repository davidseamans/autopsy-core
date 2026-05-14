# 2026-05-14 — Migration Governance Boundary

## Decision

This repository now treats migration history in two eras:

1. Legacy era — before 2026-05-09
2. Governed era — from 2026-05-09 onward

## Legacy Era

The legacy era includes historical Supabase migrations that may have empty migration names and were created before strict governance discipline was established.

These migrations are treated as immutable historical record.

Do not rename, rewrite, squash, delete, or manually edit legacy migration history.

## Governed Era

From 2026-05-09 onward, all migrations must be:

- explicitly named
- committed to GitHub
- applied first in dev where possible
- validated before production promotion
- rollback-aware
- traceable to an operational decision

## Branch Discipline

Supabase branch model:

- main = production canonical truth
- dev = isolated mutation and validation environment

Normal flow:

1. Write migration file in GitHub dev branch
2. Apply migration to Supabase dev branch
3. Validate outcome in dev
4. Confirm production is unaffected where relevant
5. Promote intentionally only when required
6. Record rollback or cleanup migration where needed

## Production Rule

Production must not be used as the experimentation environment.

All structural changes, RPC changes, trigger changes, policy changes, worksheet changes, and narrative changes must be tested in dev first unless explicitly marked as emergency production repair.

## Emergency Exception

Emergency production repair is allowed only when:

- production is broken
- the repair SQL is documented
- the repair is committed to GitHub
- validation SQL is run
- rollback notes are recorded

## Current Known Issue

The Supabase dev branch may report MIGRATIONS_FAILED because the pre-governance production history contains unnamed legacy migrations.

This is a migration metadata issue, not proof of schema failure.

Branch functionality has been validated by creating and cleaning up a dev-only governance test table.

## Operational Boundary

Do not attempt to repair legacy migration names in production.

Governance starts from the current boundary and is enforced forward.

# 2026-05-14 — Security Hardening Program: Phases 1 to 4

## Status

This document establishes the controlled hardening program arising from the Supabase security advisor review.

## Phase 1 — RLS Disabled Tables

Critical exposed tables identified:

- public.sites
- public.questions_backup_20260415
- public.verdict_narratives_legacy_archive

Action:

- Enable RLS in dev first.
- Allow read access on public.sites only if required by the app.
- Keep backup/archive tables service-role only unless a documented read requirement exists.

GitHub migration already created:

- migrations/20260514_1225__security__enable_rls_on_exposed_tables_dev_test.sql

## Phase 2 — Over-Permissive Anonymous Mutation Policies

Advisor identified broad anon INSERT/UPDATE policies on operational tables including:

- accounts
- contacts
- leads
- pipeline
- quotes
- jobs
- run_dimension_scores
- run_feedback
- run_questions

Decision:

- Public INSERT may be temporarily necessary for Autopsy onboarding and anonymous run creation.
- Public UPDATE is high risk and should be removed or replaced with function-controlled mutation.
- DELETE must not be public.

Action:

- Inventory all anon/authenticated mutation policies.
- Replace direct table mutation with RPC-mediated writes where required.
- Preserve current app function until Lovable call paths are validated.

## Phase 3 — SECURITY DEFINER Views and Functions

Advisor identified SECURITY DEFINER views:

- public.v_autopsy_gateway
- public.v_autopsy_stale_runs
- public.v_autopsy_product_readiness
- public.v_autopsy_canonical_verdict

Advisor also identified SECURITY DEFINER functions executable by anon/authenticated roles.

Decision:

- Do not bulk revoke blindly.
- Classify each object as intentional public API, internal-only, or obsolete.
- Public API functions must be narrow, parameterised, and validated.
- Internal functions must have EXECUTE revoked from anon/authenticated.

## Phase 4 — Function search_path hardening

Many functions have mutable search_path.

Decision:

- All new or replaced functions must explicitly set search_path.
- Existing high-risk/public RPCs are remediated first.
- No blind bulk replacement of production functions.

Target standard:

```sql
security definer
set search_path = public, pg_temp
```

or, where security definer is not required:

```sql
security invoker
set search_path = public, pg_temp
```

## Execution Rule

All hardening proceeds:

1. Document finding.
2. Commit migration or remediation note to GitHub dev.
3. Apply in Supabase dev only where tool permissions allow.
4. Validate application behaviour.
5. Promote to production only after validation.

## Non-Negotiable

Production security changes must not be performed as ad hoc dashboard edits.

If tool execution is blocked for security-policy SQL, GitHub remains the authoritative audit trail and manual execution must be from the committed migration only.

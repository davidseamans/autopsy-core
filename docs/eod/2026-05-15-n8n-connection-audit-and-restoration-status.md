# 2026-05-15 — End of Day Directive / Summary

## Status
Autopsy restoration remains active. n8n connection audit completed safely.

## Primary control position
- `autopsy` = source / legacy project being copied FROM.
- `autopsy-canonical` = restoration target and future real project.
- n8n is replacing Make.com as orchestration layer.
- GitHub remains version-control and rollback authority.
- Supabase remains transactional truth.
- Notion remains operational documentation / control visibility layer.

## n8n connection audit completed
Workflow: `WF-N8N-001-ConnectionAudit`

Mode:
- manual trigger only
- read/test only
- no schedules
- no webhooks armed
- no production mutations

Results:
- GitHub read test: PASSED
  - Read issue from `davidseamans/autopsy-core`.
- OpenAI test: PASSED
  - Model: GPT-4O-MINI
  - Output: `OpenAI connection OK`
- Supabase test: PASSED
  - Project: `autopsy-canonical`
  - Ref: `fzbdztapkyrfwjwxtwte`
  - Table read: `recovery_table_classification`
  - Limit: 1
- Notion read test: PASSED
  - Search text: `Autopsy`
  - Limit: 1
- Google Drive read test: PASSED
  - Search query: `Autopsy`
  - Limit: 1

## Restoration state observed
Current `autopsy-canonical` public tables include:
- recovery_events
- recovery_table_classification
- dimensions
- questions
- answer_options
- verdict_bands
- verdict_narratives
- verdict_templates
- dimension_dictionary
- domain_narratives
- dimension_failure_profiles
- dimension_pressure_profiles
- dimension_evidence_profiles
- dimension_invalidation_rules
- dimension_recovery_validation
- accounts
- contacts
- leads
- sites
- pipeline
- quotes
- jobs
- revenue_events
- documents
- audit_log
- config

Observed gap:
- `autopsy_runs` does not yet exist in `autopsy-canonical`.

## Security / governance observations
Supabase advisory observed:
- RLS disabled on `recovery_events`.
- RLS disabled on `recovery_table_classification`.

Do not blindly enable RLS tonight. Enabling RLS without policies can break recovery visibility. Add to governance review list.

n8n Supabase credential uses service role secret. Treat as high-risk.

Rules:
- no Supabase write actions from n8n during restoration
- no RPC calls from n8n during restoration
- no scheduled workflows
- no webhooks armed
- no Notion writes until permissions are narrowed and workflow is reviewed

Notion access was granted broadly for connection testing. Reduce access later to only:
- Autopsy System (Canonical)
- EOD / End of Day control area
- My Priorities / Execution Engine
- restoration pages actually required

## Make.com → n8n transition
Decision direction confirmed:
- Make.com is being replaced by n8n for orchestration.
- n8n is not the source of truth.
- n8n must not contain hidden business logic.
- n8n may orchestrate, read, notify, export, snapshot, and call governed operations after controls are in place.

Updated stack direction:
AI reasons → n8n orchestrates → Supabase validates → GitHub protects → Notion visualizes → Lovable surfaces

## EOD gating questions
Does this strengthen auditability?
- Yes. n8n connection audit is explicit and repeatable.

Does this reduce human mutation?
- Yes, once workflows are exported and governed. Tonight was connection proof only.

Does this preserve Core purity?
- Yes. No business logic was moved into n8n.

Does this improve rollback safety?
- Partially. GitHub dev documentation improved; n8n workflow export discipline remains next.

Does this convert ambiguity into structure?
- Yes. System roles and connection boundaries are now clearer.

Does this create measurable operational intelligence?
- Yes. We now know which integrations work and which Supabase tables exist in the restoration target.

## Next execution agenda
1. Continue restoration into `autopsy-canonical`.
2. Confirm required Autopsy application tables still missing.
3. Recreate/preserve missing runtime tables such as `autopsy_runs` if required by current Lovable app logic.
4. Continue copying governed schema/data from `autopsy` to `autopsy-canonical` using controlled SQL only.
5. Export `WF-N8N-001-ConnectionAudit` JSON and commit to GitHub under `/n8n/workflows/dev/`.
6. Tighten Notion permissions.
7. Decide RLS policy for recovery tracking tables.
8. Do not enable n8n production writes until restoration baseline passes validation.

## Control rule for restart
Restart from:
- GitHub branch: `dev`
- Supabase target: `autopsy-canonical`
- n8n workflow: `WF-N8N-001-ConnectionAudit`
- mode: manual/read-only until explicitly promoted

## Final position
Tonight was successful.

We did not advance Autopsy features directly, but we completed the orchestration foundation needed to replace Make.com with n8n safely.

The restoration was not harmed.

The next work block returns to restoring `autopsy-canonical` to the working condition previously achieved in `autopsy`.
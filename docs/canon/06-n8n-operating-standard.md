# n8n Operating Standard

## Purpose
n8n is the orchestration layer for Autopsy / Core / Sleeve.

It is not the authoritative owner of business logic or transactional truth.

---

## Allowed Responsibilities

n8n may:
- trigger workflows
- orchestrate integrations
- move data between systems
- call Supabase RPCs
- generate notifications
- initiate snapshots
- log execution states
- coordinate operational automation

---

## Forbidden Responsibilities

n8n must not:
- contain hidden scoring logic
- become the source of truth
- bypass governed validation
- directly mutate production data without audit
- contain undocumented workflow branches
- duplicate core business rules already governed in Supabase

---

## Workflow Naming Standard

Format:
WF-[SYSTEM]-[NUMBER]-[DESCRIPTION]

Examples:
- WF-AUT-001-RunFinalisation
- WF-AUT-002-WebhookPush
- WF-CORE-001-LeadCreated
- WF-SNAP-001-GitBackup

---

## Environment Structure

All workflows eventually require:
- DEV
- STAGING
- PRODUCTION

Production workflows are isolated from experimentation.

---

## Version-Control Rule

All production workflows must:
- be exported
- be committed to GitHub
- have rollback capability
- have identifiable ownership
- have change history

---

## Credential Governance

Separate credentials by operational responsibility.

Avoid universal high-privilege tokens.

---

## Strategic Rule

n8n must remain:
- deterministic
- governed
- auditable
- recoverable

No automation jungle.

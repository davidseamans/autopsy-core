# Operating Model

**Status:** Current governing summary  
**Governing standard:** DS-001 — BuildOS Engineering Standards v1.0  
**Last reviewed:** 2026-07-15

## System Roles

| System | Responsibility |
|---|---|
| GitHub | Canonical engineering artefacts, version control, audit history, and rollback evidence |
| Supabase | Operational business truth, data integrity, and governed business logic |
| n8n | Deterministic orchestration, reconciliation, recovery routing, and automation execution |
| Notion | Operational governance, human-control surfaces, design records, and readable mirrors |
| Vercel | Approved application delivery, environment-scoped deployment, and product-surface hosting |
| OpenAI/ChatGPT | Bounded reasoning, extraction, classification, drafting, and tool use under explicit authority |

Lovable, Bubble, and Make are retired from the active canonical stack. References in dated records are historical evidence only.

---

## Architectural Rule

Business logic belongs primarily in Supabase or another explicitly assigned canonical owner.

n8n must not become a hidden business-rules engine.

n8n responsibilities:
- trigger workflows
- coordinate systems
- move data under validated contracts
- validate authority and states
- log actions and evidence
- notify operators
- invoke governed RPCs
- reconcile outcomes and route recovery

---

## Source Control Rule

All material operational changes must be:
- authorised
- documented
- version controlled
- recoverable
- attributable
- independently verified against the expected business outcome

No direct production modification without an audit trail and proportionate recovery path.

---

## Environment Rule

Every production component must support environment separation proportionate to risk:
- DEV
- STAGING or equivalent controlled pre-production validation
- PRODUCTION

Production is never used for uncontrolled experimentation.

---

## AI Governance Rule

AI may:
- assist
- extract
- classify
- draft
- review
- orchestrate through authorised tools
- audit

AI must not:
- bypass governance
- overwrite canonical truth without deterministic validation and explicit authority
- self-modify production systems outside certified controls
- create hidden operational pathways
- treat fluent output as authority or evidence
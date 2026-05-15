# Operating Model

## System Roles

| System | Responsibility |
|---|---|
| GitHub | Version control, audit history, rollback authority |
| Supabase | Transactional truth and governed business logic |
| n8n | Orchestration and automation execution |
| Notion | Operational control and execution documentation |
| Lovable | User-facing application layer |
| OpenAI/ChatGPT | Intelligence and augmentation layer |

---

## Architectural Rule

Business logic belongs primarily in Supabase.

n8n must not become a hidden business-rules engine.

n8n responsibilities:
- trigger workflows
- coordinate systems
- move data
- validate states
- log actions
- notify operators
- invoke governed RPCs

---

## Source Control Rule

All material operational changes must be:
- documented
- version controlled
- recoverable
- attributable

No direct production modification without audit trail.

---

## Environment Rule

Every operational component must eventually support:
- DEV
- STAGING
- PRODUCTION

Production is never used for experimentation.

---

## AI Governance Rule

AI may:
- assist
- generate
- review
- orchestrate
- audit

AI must not:
- bypass governance
- overwrite canonical truth
- self-modify production systems without controls
- create hidden operational pathways

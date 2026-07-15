# Source of Truth Map

**Status:** Current governing summary  
**Governing standard:** DS-001 — BuildOS Engineering Standards v1.0  
**Last reviewed:** 2026-07-15

## Authority Matrix

| Domain | System of Record / Authority |
|---|---|
| Canonical engineering version history | GitHub |
| Operational canon and human control | Notion mirror linked to GitHub canonical text |
| Transactional application data | Supabase |
| Autopsy scoring and verdict logic | Supabase |
| Workflow orchestration | n8n |
| Operational reporting truth | Supabase; rendered through approved product or governance surfaces |
| EOD control records | Notion operational record with canonical evidence links and reconciliation |
| User interface delivery | Vercel-delivered BuildOS application |
| Accounting/legal financials | QBO or another explicitly governed accounting interface |

---

## Critical Rule

One authoritative owner per data domain.

No duplicated operational truth.

Presentation, orchestration, and mirror layers must identify their source, generation time, and authority state.

---

## Prohibited Patterns

### Forbidden
- business rules duplicated in multiple systems
- hidden scoring logic inside n8n or a presentation client
- manual spreadsheet truth overrides
- undocumented production changes
- direct production experimentation
- retired tools represented as active canonical architecture without a dated ADR and current certification evidence

### Required
- governed RPC operations
- immutable audit history
- version-controlled workflow changes
- rollback or deterministic replay capability
- environment separation
- reconciliation between canonical and operational mirrors

---

## Operational Hierarchy

### GitHub
Owns:
- canonical code and engineering specifications
- workflow source and history
- deployment evidence
- rollback artefacts
- standards, ADRs, and certification evidence

### Supabase
Owns:
- transactional truth
- scoring logic
- validation
- immutable operational records

### n8n
Owns:
- orchestration execution
- automation routing
- notification coordination
- reconciliation and recovery routing

n8n does **not** own business truth.

### Vercel
Owns:
- delivery of approved product surfaces
- environment-scoped deployments

Vercel does **not** own business truth or unversioned business rules.

### Notion
Owns:
- operational governance and human-control surfaces
- readable mirrors and review records

Notion does **not** own competing operational truth.

Historical Lovable-, Bubble-, and Make-era records remain preserved as evidence and do not override this map.
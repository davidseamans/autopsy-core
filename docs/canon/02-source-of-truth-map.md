# Source of Truth Map

## Authority Matrix

| Domain | System of Record |
|---|---|
| Version history | GitHub |
| Operational canon | GitHub + Notion mirror |
| Transactional application data | Supabase |
| Autopsy scoring and verdict logic | Supabase |
| Workflow orchestration | n8n |
| Operational reporting | Supabase |
| EOD control logs | Notion + GitHub snapshot |
| User interface | Lovable |
| Accounting/legal financials | QBO |

---

## Critical Rule

One authoritative owner per data domain.

No duplicated operational truth.

---

## Prohibited Patterns

### Forbidden
- business rules duplicated in multiple systems
- hidden scoring logic inside n8n
- manual spreadsheet truth overrides
- undocumented production changes
- direct production experimentation

### Required
- governed RPC operations
- immutable audit history
- version-controlled workflow changes
- rollback capability
- environment separation

---

## Operational Hierarchy

### GitHub
Owns:
- code truth
- workflow history
- deployment history
- rollback authority

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

n8n does NOT own business truth.

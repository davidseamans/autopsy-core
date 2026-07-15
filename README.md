# Autopsy Core

**Status:** Current operational overview  
**Governing standard:** DS-001 — BuildOS Engineering Standards v1.0  
**Last reviewed:** 2026-07-15

## Canonical Doctrine

Supabase = Operational Business Truth + Data Integrity  
GitHub = Canonical Engineering Memory + Rollback Authority  
n8n = Deterministic Orchestration Layer  
Notion = Operational Governance + Human-Control Surface  
Vercel = Approved Product Delivery Surface  
OpenAI = Bounded Intelligence Under Explicit Authority

---

## Operational Mutation Rule

Every production mutation must follow:

1. Authority and target validation
2. Snapshot or equivalent recovery evidence
3. Rollback or replay path
4. Controlled change artefact prepared
5. Validation query/test prepared
6. Apply
7. Verify the business outcome independently
8. Commit and reconcile evidence

No uncontrolled mutation is permitted.

---

## Repository Structure

/migrations  
/rpc  
/functions  
/policies  
/views  
/seeds  
/snapshots  
/rollback  
/docs  
/architecture  
/operational_logs  
/n8n

---

## Development Standard

- No hardcoded UUIDs during normal testing
- Use embedded selectors
- Supabase RPCs operate via `p_run_id`
- One authoritative owner per datum
- No hidden business logic in presentation clients or deployment surfaces
- No pseudo-Core logic in n8n
- n8n orchestrates hand-offs only; Supabase remains validation and operational-truth authority
- OpenAI output is advisory or preparatory until validated by deterministic controls and authorised at the mutation boundary
- Retired tools, including Lovable, Bubble, and Make, are historical only unless formally re-authorised by ADR and certification evidence

---

## Historical Material

Dated governance, restoration, checkpoint, and validation files may describe earlier Lovable-, Bubble-, or Make-based architecture. Those files are retained as evidence and do not override DS-001 or this current overview.

---

## Canonical Embedded Selector Pattern

```sql
(
  select id
  from autopsy_runs
  order by created_at desc
  limit 1
)
```
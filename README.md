# Autopsy Core

## Canonical Doctrine

Supabase = Core Truth
GitHub = Operational Memory + Rollback Authority
Make = Orchestration Layer
Notion = Visibility + Management Layer
Lovable = UI Surface Layer

---

## Operational Mutation Rule

Every production mutation must follow:

1. Snapshot
2. Rollback path
3. SQL script prepared
4. Validation query prepared
5. Apply
6. Verify
7. Commit

No uncontrolled mutation permitted.

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

---

## Development Standard

- No hardcoded UUIDs during normal testing
- Use embedded selectors
- Supabase RPCs operate via p_run_id
- One source of truth only
- No hidden business logic in Lovable
- No pseudo-Core logic in Make.com

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

# Mutation Protocol

## Mandatory Execution Sequence

1. Snapshot
2. Rollback label
3. Migration script
4. Validation query
5. Apply mutation
6. Verify outputs
7. Commit to GitHub
8. Label release/snapshot

---

## Prohibited

- Direct production edits without rollback
- Hidden front-end business logic
- Manual UUID testing
- Undocumented SQL mutation
- Multiple sources of truth

---

## Validation Requirement

Every mutation must include:

- success condition
- validation query
- rollback path

---

## Canonical Principle

Governance before feature velocity.

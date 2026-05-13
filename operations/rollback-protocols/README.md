# Rollback Protocols

## Purpose

This directory stores rollback procedures, rollback notes, recovery checkpoints, and recovery validation procedures.

## Operational Doctrine

Every structural mutation must be reversible.

No uncontrolled mutation permitted.

## Mandatory Pre-Mutation Sequence

1. Create snapshot branch
2. Export affected SQL/functions
3. Record validation query
4. Record expected outcome
5. Apply mutation
6. Validate result
7. Commit to GitHub
8. Record rollback method

## Recovery Priority

1. Data integrity
2. Function integrity
3. UI integrity
4. Automation integrity
5. Cosmetic cleanup

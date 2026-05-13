# Lovable Directives

## Purpose

This directory stores canonical Lovable directives used to mutate UI behaviour, rendering logic, workflows, and frontend structure.

## Operational Rules

- No hidden business logic in Lovable
- Core logic belongs in Supabase
- Lovable is presentation and orchestration only
- All major Lovable mutations must reference a GitHub checkpoint
- UI fixes must not mutate scoring logic or canonical backend logic

## Directive Standard

Every directive should include:

1. Objective
2. Scope
3. Files/components affected
4. Constraints
5. Validation steps
6. Rollback expectation

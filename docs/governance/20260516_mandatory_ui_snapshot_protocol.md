# 2026-05-16 — Mandatory UI Snapshot Protocol

## Purpose
Final Autopsy product UI must be treated as canon, not decoration. Future recovery must not depend on memory, screenshots buried in chat, or vague aesthetic instructions.

## Rule
Every materially accepted UI state must be snapshotted and committed to governance.

## Mandatory capture points
Capture UI screenshots after any approved milestone affecting:
- intake screen
- question flow
- verdict page
- worksheet page
- history page
- CRM/sidebar shell
- pipeline screens
- quotes/jobs/accounts/leads screens

## Required artefacts
Each UI snapshot must include:
1. route/path
2. screenshot
3. short description of expected behaviour
4. known backend project ref
5. known frontend project ID
6. accepted date/time
7. status: draft / accepted / superseded

## Canonical project references
- Lovable canonical project: `f9ce02c9-c9fa-4b07-917c-0d521d6aff74`
- Supabase canonical project: `fzbdztapkyrfwjwxtwte`

## Storage convention
Use:

```text
ui-snapshots/YYYY-MM-DD/<screen-name>.png
ui-snapshots/YYYY-MM-DD/manifest.md
```

## Manifest must record
- screen name
- route
- source screenshot filename
- acceptance status
- known defects
- next correction pass

## Recovery doctrine
UI recovery source hierarchy:
1. accepted UI snapshots in GitHub
2. legacy Lovable screenshots
3. legacy Lovable project if accessible
4. written UI directives
5. controlled reconstruction only if no visual source exists

## Non-negotiable
No future rebuild may proceed without checking the latest accepted UI snapshot manifest first.

## Current risk
Current UI is functional but not yet final. It must be considered `draft` until explicitly accepted.

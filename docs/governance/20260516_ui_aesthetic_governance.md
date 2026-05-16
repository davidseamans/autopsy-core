# 2026-05-16 — UI Aesthetic Governance Standard

## Purpose
Autopsy/Core/Sleeve UI restoration must not rely on memory, generic Lovable defaults, or black-on-white sterile layouts. UI is part of product canon and must be preserved as an operational asset.

## Doctrine
No aesthetic reconstruction from memory.

Source hierarchy for UI/aesthetic recovery:
1. Legacy Lovable project `autopsy`
2. Screenshots from known-good states
3. GitHub UI snapshots where available
4. Written design tokens/directives
5. Controlled reconstruction only if visual source is unavailable

## Canonical visual direction
Autopsy should feel like:
- serious diagnostic system
- operational console
- high-trust SME decision tool
- structured, evidence-led, controlled

Autopsy should NOT feel like:
- generic SaaS dashboard
- sterile black-on-white admin panel
- playful consumer app
- mockup/demo product

## Approved aesthetic characteristics
- red/pink Autopsy accent
- pale grey page background
- white cards with subtle borders/shadows
- rounded cards
- strong verdict hero area
- visible primary-constraint badges
- human-readable labels, never raw snake_case
- small uppercase section labels
- generous vertical spacing
- operational sidebar for Autopsy/Core modules

## Sidebar direction
Preferred shell direction:
- red-accent or red-dominant sidebar is acceptable and preferred over sterile black/white
- Autopsy should appear above Leads
- Pipeline modules should remain visible as downstream operational flow

Sidebar order:
1. Autopsy
2. Leads
3. Accounts
4. Pipeline
5. Quotes
6. Jobs

## UI governance rule
Any future UI rebuild must include:
- screenshot reference
- source project reference
- design token summary
- acceptance criteria
- GitHub record

## Acceptance criteria for restored UI
- visually resembles legacy Autopsy screenshots
- preserves canonical backend authority
- no local scoring, narrative, worksheet, or pipeline business logic
- no raw database labels shown to users
- no unnecessary interruption during diagnostic flow
- red primary constraint treatment preserved
- operational sidebar preserved

## Known issue logged
The recovered canonical UI is functional but still aesthetically incomplete. Next pass should restore stronger sidebar identity and reduce sterile black/white treatment.
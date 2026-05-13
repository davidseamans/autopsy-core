# QBO / ChatGPT Connection — Staging Note

## Date

2026-05-13

## Position

A QBO/ChatGPT connection may be worth setting up early if it has no material cost and can remain unused until the architecture is ready.

## Guardrail

QBO is evidence, not architecture.

QBO must not redefine Core entities, Core relationships, or source-of-truth boundaries.

Core remains the operating discipline and telemetry layer.

QBO may later provide accounting actuals, ledger evidence, GST/tax context, job costing actuals, and financial validation.

## Recommended Setup Mode

If connected early, QBO should be configured as:

- read-only where possible
- no automatic writes
- no sync mutation
- no entity overwrite
- no invoice/customer/job restructuring
- no production automation until Core/QBO source-of-truth rules are written

## Future Use

Possible later uses:

- margin validation
- job profitability evidence
- payroll cost reconciliation
- expense classification review
- accounts receivable risk
- cashflow actuals
- proof for guarantee telemetry
- evidence for Core/Sleeve reporting

## Current Decision

Set up connection only if low/no cost and safe.

Do not build QBO automation yet.

Do not let QBO pollute Core.

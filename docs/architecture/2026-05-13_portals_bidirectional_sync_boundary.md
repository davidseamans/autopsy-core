# Portal / Bidirectional Sync Boundary

## Date

2026-05-13

## Core Question

Employee portals may need to provide a one-stop shop for staff to access rostering, payroll information, bank account details, address changes, messages, bosses, and HR.

The question is whether this is bidirectional sync.

## Answer

It becomes bidirectional sync only when data is changed in more than one system and must be reconciled between them.

If the portal merely displays source-system data, it is not bidirectional sync.

If the portal accepts updates and writes them back to payroll, HR, rostering, QBO, or Core, it becomes controlled writeback / bidirectional integration.

## Architecture Rule

Core remains the source of operational truth.

Sleeve owns the industry-specific portal experience.

External systems remain specialist systems:

- QBO / payroll = payroll and accounting evidence
- Core = universal operating discipline and telemetry
- Sleeve = industry workflow and portal surface
- Notion = prototype/scaffolding only

## Portal Classes

### Class 1 — Read-only portal

Safe first version.

Examples:

- view roster
- view policies
- view payslip links
- view boss/HR contacts
- view messages
- view training documents

No external system writeback.

### Class 2 — Request portal

Preferred next step.

Employee submits a change request. Manager/admin reviews and approves before any source system is changed.

Examples:

- bank account change request
- address change request
- leave request
- availability change request
- incident report
- HR document acknowledgement

### Class 3 — Controlled writeback

Only after audit rules are mature.

Examples:

- approved address change updates payroll/HR
- approved availability updates roster system
- approved document acknowledgement updates compliance record

### Class 4 — True bidirectional sync

High-risk. Avoid early.

Multiple systems can update the same field and must reconcile conflicts.

Examples:

- payroll changes bank account while portal also changes bank account
- roster updated in external tool and Sleeve simultaneously
- employee profile edited in QBO/payroll/Core/portal concurrently

## Directive

Do not start with true bidirectional sync.

Start with:

1. read-only portal
2. request-and-approval workflow
3. audit log
4. controlled writeback only where needed
5. true sync only if unavoidable

## Security / Compliance Guardrails

Sensitive fields require approval and audit:

- bank details
- TFN / tax declarations
- superannuation details
- address
- emergency contacts
- payroll classifications
- visa/work rights

Never allow silent writeback for sensitive payroll or HR fields.

## Product Doctrine

The employee portal should feel like one stop shop to the staff member, but internally it must remain source-of-truth disciplined.

Good user experience must not become data chaos.

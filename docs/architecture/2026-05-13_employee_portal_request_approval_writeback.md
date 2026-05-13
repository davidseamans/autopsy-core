# Employee Portal — Request / Approval / Writeback Pattern

## Date

2026-05-13

## Core Question

Does an employee portal request workflow mean documentation is handled twice?

## Answer

No, not if designed correctly.

The employee creates the first structured record. The manager/admin reviews and approves that record. The approved record then updates the relevant source system automatically or semi-automatically.

The same submitted data should flow through the workflow. It should not be re-keyed from scratch.

## Correct Pattern

1. Employee submits structured request.
2. Request is stored in Core/Sleeve as pending.
3. Manager/admin reviews the request.
4. Manager/admin approves, rejects, or requests correction.
5. On approval, the system writes the approved data to the correct source system or creates a controlled task for payroll/admin.
6. Audit log records who submitted, who approved, when, old value, new value, and destination system.

## Example — Bank Account Change

Employee enters:

- account name
- BSB
- account number
- effective date
- declaration/confirmation

Manager/admin sees the request and approves.

After approval:

- payroll update is triggered if safe integration exists; or
- payroll/admin receives a controlled update task; or
- exported approved change file is generated.

The employee's submitted data remains the original evidence record.

## Important Distinction

Bad design:

Employee submits details, then admin manually retypes them elsewhere with no audit trail.

Good design:

Employee submits once, admin approves once, system writes or packages the approved update with audit trail.

## Architecture Rule

Approval is not duplicate documentation.

Approval is the control gate.

## Guardrails

Do not allow silent direct updates to sensitive payroll/HR fields.

Sensitive fields include:

- bank details
- address
- tax details
- superannuation details
- emergency contacts
- work rights
- payroll classifications

All sensitive updates require:

- structured input
- validation
- approval
- audit log
- source-of-truth update record

## Future Implementation

Start with request-and-approval.

Later add controlled writeback only where safe.

Avoid true bidirectional sync until unavoidable.
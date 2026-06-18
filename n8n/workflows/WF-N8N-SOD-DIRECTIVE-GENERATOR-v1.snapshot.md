# WF-N8N-SOD-DIRECTIVE-GENERATOR-v1

Status: operational and active in n8n.

Purpose: generate a Start of Day Directive from the latest Current Authority EOD record and write it to the EOD Master Index as Record Type `Directive`.

Canonical stack:

- Notion: EOD Master Index visibility and authority records
- n8n: orchestration
- Supabase: telemetry via RPC
- GitHub: sanitized workflow/version snapshot

Security note: raw n8n workflow exports must not be committed. Supabase service role/API key values must be redacted before storage.

Sanitized workflow file name:

`WF-N8N-SOD-DIRECTIVE-GENERATOR-v1.sanitized.json`

Required redactions before committing JSON:

- Supabase JWT/service role values
- `Authorization: Bearer ...` values
- raw `apikey` values

Last known operational outcome:

- SOD record created in Notion
- Current Authority set
- Finish telemetry returned success

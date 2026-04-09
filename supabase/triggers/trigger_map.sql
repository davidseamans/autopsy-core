-- =========================================
-- TRIGGER MAP — AUTOPSY SYSTEM
-- =========================================

-- PIPELINE STAGE TRANSITION
create trigger trg_validate_pipeline_stage_transition
before update on pipeline
for each row
execute function validate_pipeline_stage_transition();

-- JOB STATUS VALIDATION
create trigger trg_validate_job_quote_status
before update on jobs
for each row
execute function validate_job_quote_status();

-- LEAD REGRESSION PREVENTION
create trigger trg_prevent_lead_regression
before update on pipeline
for each row
execute function prevent_lead_regression();

-- AUDIT TRIGGERS (example — expand based on your export)
-- create trigger trg_audit_accounts
-- after insert or update or delete on accounts
-- for each row
-- execute function audit_log_changes();

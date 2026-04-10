-- =========================================
-- TRIGGER MAP — AUTOPSY SYSTEM (GENERATED FROM DB)
-- =========================================Last night
 create trigger trg_accounts_audit after insert on accounts for each row execute function log_audit();
 create trigger update_objects_updated_at before update on objects for each row execute function update_updated_at_column();
 create trigger enforce_bucket_name_length_trigger before insert on buckets for each row execute function enforce_bucket_name_length();
 create trigger protect_buckets_delete before delete on buckets for each statement execute function protect_delete();
 create trigger protect_objects_delete before delete on objects for each statement execute function protect_delete();
 create trigger tr_check_filters before insert on subscription for each row execute function subscription_check_filters();
 create trigger trg_prevent_run_questions_delete before delete on run_questions for each row execute function prevent_run_questions_delete();
 create trigger trg_auto_freeze after insert on autopsy_runs for each row execute function auto_freeze_run_questions();
 create trigger trg_prevent_run_questions_update before update on run_questions for each row execute function prevent_run_questions_update();
 create trigger trg_prevent_answer_changes_on_completed_run before insert on autopsy_answers for each row execute function prevent_answer_changes_on_completed_run();
 create trigger trg_contacts_audit after insert on contacts for each row execute function log_audit();
 create trigger trg_leads_audit after insert on leads for each row execute function log_audit();
 create trigger trg_pipeline_audit after insert on pipeline for each row execute function log_audit();
 create trigger trg_quotes_audit after insert on quotes for each row execute function log_audit();
 create trigger trg_jobs_audit after insert onjobs for each row execute function log_audit();
 create trigger trg_prevent_lead_regression before update on leads for each row execute function prevent_lead_status_regression();
 create trigger trg_validate_quote_pipeline before insert on quotes for each row execute function validate_quote_pipeline();
 create trigger trg_validate_job_quote_status before insert on jobs for each row execute function validate_job_quote_status();
 create trigger trg_validate_pipeline_stage_transition before update on pipeline for each row execute function validate_pipeline_stage_transition();

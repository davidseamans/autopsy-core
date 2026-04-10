-- =========================================
-- FUNCTION: prevent_run_questions_delete
-- =========================================

CREATE OR REPLACE FUNCTION prevent_run_questions_delete()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
  raise exception 'run_questions cannot be deleted once created';
end;
$function$ language plpgsql;

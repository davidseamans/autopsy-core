-- =========================================
-- FUNCTION: prevent_run_questions_update
-- =========================================

CREATE OR REPLACE FUNCTION prevent_run_questions_update()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
  raise exception 'run_questions is immutable once created';
end;
$function$ language plpgsql;

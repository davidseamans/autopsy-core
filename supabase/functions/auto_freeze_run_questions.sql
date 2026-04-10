-- =========================================
-- FUNCTION: auto_freeze_run_questions
-- =========================================
CREATE OR REPLACE FUNCTION auto_freeze_run_questions()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
  perform freeze_run_questions(new.id, new.scenario);
  return new;
end;
$function$ language plpgsql;

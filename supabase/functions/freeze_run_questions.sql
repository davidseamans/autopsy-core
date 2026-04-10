-- =========================================
-- FUNCTION: freeze_run_questions
-- =========================================

CREATE OR REPLACE FUNCTION freeze_run_questions(p_run_id uuid, p_scenario text)
RETURNS void
LANGUAGE plpgsql
AS $function$
begin

  -- 🔥 FORCE CLEAN (idempotent reset)
  delete from run_questions where run_id = p_run_id;

  insert into run_questions (run_id, question_id, position)
  select 
    p_run_id,
    q.id,
    row_number() over ()
  from questions q
  where upper(q.scenario_code) = p_scenario
  and q.is_active = true;

end;
$function$ language plpgsql;

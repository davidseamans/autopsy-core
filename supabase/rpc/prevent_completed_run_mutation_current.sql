-- CURRENT CAPTURE: prevent_completed_run_mutation
-- Captured from live Supabase state on 2026-05-13
-- Status: immutability enforcement trigger

-- Purpose:
-- Prevent mutation of completed Autopsy runs.
-- This is a foundational governance and audit integrity control.

CREATE OR REPLACE FUNCTION public.prevent_completed_run_mutation()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
begin

  if old.status = 'completed' then

    if (
      new.score_total is distinct from old.score_total
      or new.final_verdict is distinct from old.final_verdict
      or new.execution_diagnosis is distinct from old.execution_diagnosis
      or new.worksheet_output is distinct from old.worksheet_output
      or new.retest_condition is distinct from old.retest_condition
    ) then

      raise exception 'Completed autopsy runs are immutable';

    end if;

  end if;

  return new;

end;
$function$;

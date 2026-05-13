-- CURRENT CAPTURE: validate_autopsy_run_lifecycle
-- Captured from live Supabase state on 2026-05-13
-- Status: lifecycle state enforcement

-- Purpose:
-- Enforce valid run lifecycle transitions.

-- Current lifecycle states observed:
-- in_progress
-- completed
-- archived

-- Governance doctrine:
-- completed runs become immutable
-- historical records must remain auditable
-- invalid lifecycle transitions must be rejected

CREATE OR REPLACE FUNCTION public.validate_autopsy_run_lifecycle()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
begin

  if old.status = 'completed'
     and new.status not in ('completed', 'archived') then

    raise exception 'Cannot revert completed runs to active state';

  end if;

  return new;

end;
$function$;

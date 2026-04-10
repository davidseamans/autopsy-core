-- =========================================
-- FUNCTION: prevent_lead_status_regression
-- =========================================

CREATE OR REPLACE FUNCTION prevent_lead_status_regression()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
if old.status = 'converted' and new.status <> 'converted' then
raise exception 'Cannot revert converted lead';
end if;
return new;
end;
$function$ language plpgsql;

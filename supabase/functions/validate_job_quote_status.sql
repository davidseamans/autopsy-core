-- =========================================
-- FUNCTION: validate_job_quote_status
-- =========================================

CREATE OR REPLACE FUNCTION validate_job_quote_status()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
declare
v_status text;
begin
select status into v_status
from quotes
where id = new.quote_id;

if v_status is null then
raise exception 'INVALID QUOTE_ID';
end if;

if v_status <> 'accepted' then
raise exception 'JOB CAN ONLY BE CREATED FROM ACCEPTED QUOTE';
end if;

return new;
end;
$function$ language plpgsql;

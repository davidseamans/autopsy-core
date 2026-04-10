-- =========================================
-- FUNCTION: validate_quote_pipeline
-- =========================================

CREATE OR REPLACE FUNCTION validate_quote_pipeline()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
begin
if new.pipeline_id is null then
raise exception 'QUOTE MUST HAVE PIPELINE_ID';
end if;

return new;
end;
$function$ language plpgsql;

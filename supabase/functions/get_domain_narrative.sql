-- =========================================
-- FUNCTION: get_domain_narrative
-- =========================================

CREATE OR REPLACE FUNCTION get_domain_narrative(p_dimension_code text)
RETURNS TABLE(failure_condition text, requirement_to_proceed text, retest_condition text)
LANGUAGE sql
AS $function$
  select
    failure_condition,
    requirement_to_proceed,
    retest_condition
  from public.domain_narratives
  where dimension_code = lower(p_dimension_code)
  and is_active = true
  limit 1;
$function$ language plpgsql;

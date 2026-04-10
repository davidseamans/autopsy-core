-- =========================================
-- FUNCTION: assign_random_questions
-- =========================================

CREATE OR REPLACE FUNCTION assign_random_questions(p_run_id uuid)
RETURNS void
LANGUAGE plpgsql
AS $function$
BEGIN
  INSERT INTO run_questions (run_id, question_id, position)
  SELECT
    p_run_id,
    q.id,
    ROW_NUMBER() OVER (ORDER BY random())
  FROM questions q
  WHERE q.is_active = true
  LIMIT 10;
END;
$function$ language plpgsql;

-- 2026-05-16
-- Canonical Scoring Normalisation
-- Decision: restore original 10-question canon / max score 30.
-- Runtime engine remains unchanged. Frontend remains dynamic and backend-driven.

update public.questions
set is_active = false
where q_id in ('S1_CR_02', 'S1_EL_03');

update public.questions
set is_active = true
where q_id in (
  'S1_CR_01',
  'S1_EL_01',
  'S1_EL_02',
  'S1_EX_01',
  'S1_EX_02',
  'S1_MR_01',
  'S1_MR_02',
  'S1_MR_03',
  'S1_OP_01',
  'S1_PR_01'
);

insert into public.recovery_events (
  event_label,
  event_type,
  event_summary,
  source_project_ref,
  target_project_ref
)
values (
  'Canonical Scoring Normalisation: 10 Questions',
  'governance_migration',
  'Restored original 10-question runtime canon so active question count aligns with 30-point verdict bands. Deactivated S1_CR_02 and S1_EL_03 as non-canonical runtime questions pending later content review.',
  'pjbiylbzlacbzgzkppzf',
  'fzbdztapkyrfwjwxtwte'
);

-- Verification
select count(*) as active_questions
from public.questions
where is_active = true;

select label, min_score, max_score
from public.verdict_bands
order by min_score;

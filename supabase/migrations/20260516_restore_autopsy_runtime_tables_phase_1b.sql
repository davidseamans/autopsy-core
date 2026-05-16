-- 2026-05-16
-- Phase 1B: Restore missing Autopsy runtime tables in autopsy-canonical
-- Applied to Supabase project: autopsy-canonical (fzbdztapkyrfwjwxtwte)
-- Purpose: resolve Caveat 1 by restoring runtime data layer only.
-- Scope: tables, constraints, indexes, RLS enablement.
-- Excludes: RPCs, triggers, automation hooks, webhook logic, seed/history data.

create table if not exists public.autopsy_runs (
  id uuid primary key default gen_random_uuid(),
  run_name text,
  industry text,
  scenario text default 'startup',
  score_total integer,
  verdict_name text,
  verdict_body text,
  primary_risk_code text,
  status text not null default 'in_progress' check (status = any (array['in_progress'::text, 'completed'::text, 'abandoned'::text, 'invalidated'::text])),
  created_at timestamp with time zone default now(),
  questions_frozen boolean default false,
  hard_fail_question_id uuid,
  question_ids uuid[],
  tester_email text check (tester_email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text),
  output_mode text,
  mechanism_mode text,
  band_position text,
  evidence_mode text,
  required_actions text,
  failure_shape text,
  operator_class text default 'unproven',
  permission_level text,
  execution_diagnosis text,
  mechanism_step_1 text,
  mechanism_step_2 text,
  mechanism_step_3 text,
  final_outcome text,
  primary_risk text,
  core_failure_point text,
  failure_drivers text,
  repair_sequence text,
  evidence_required text,
  retest_condition text,
  completed_at timestamp without time zone,
  failure_cascade jsonb,
  primary_risks jsonb,
  primary_risk_score numeric,
  diagnosis jsonb,
  dimension_scores jsonb,
  adjusted_score integer,
  weakest_dimension text,
  weakest_score integer,
  final_verdict text,
  narrative_output text,
  worksheet_output text,
  user_id text,
  failure_type text,
  failure_speed text,
  recoverability text,
  visibility text,
  narrative_tone text,
  permission_bias text,
  collapse_pattern text,
  urgency_level text,
  collapse_style text,
  survivability_signal text,
  structural_diagnosis text,
  pressure_stage text,
  pressure_summary text,
  progression_state text,
  diagnostic_posture text,
  immediate_next_move text,
  progression_directive text,
  evidence_requirement text,
  invalid_evidence text,
  progression_proof text,
  worksheet_recovery_protocol text,
  recovery_authority_statement text,
  progression_code text
);

create table if not exists public.run_questions (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null,
  question_id uuid not null references public.questions(id),
  position integer not null,
  created_at timestamp with time zone default now(),
  question_order integer,
  response_value integer,
  score_value integer
);

create table if not exists public.autopsy_answers (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references public.autopsy_runs(id),
  question_id uuid not null references public.questions(id),
  selected_option uuid,
  score_value integer not null check (score_value >= 0),
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

create table if not exists public.run_dimension_scores (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null,
  dimension_code text not null,
  score_total integer not null,
  created_at timestamp without time zone default now()
);

create table if not exists public.run_feedback (
  id uuid primary key default gen_random_uuid(),
  run_id uuid not null references public.autopsy_runs(id),
  clarity_score integer check (clarity_score is null or clarity_score between 1 and 10),
  usefulness_score integer check (usefulness_score is null or usefulness_score between 1 and 10),
  trust_score integer check (trust_score is null or trust_score between 1 and 10),
  confusing_point text,
  missing_something text,
  additional_comments text,
  created_at timestamp with time zone default now(),
  tester_email text
);

alter table public.run_questions
  add constraint run_questions_run_id_fkey foreign key (run_id) references public.autopsy_runs(id) on delete cascade;

alter table public.run_dimension_scores
  add constraint run_dimension_scores_run_id_fkey foreign key (run_id) references public.autopsy_runs(id) on delete cascade;

create index if not exists idx_autopsy_runs_status_created_at on public.autopsy_runs(status, created_at desc);
create index if not exists idx_autopsy_answers_run_id on public.autopsy_answers(run_id);
create index if not exists idx_autopsy_answers_question_id on public.autopsy_answers(question_id);
create index if not exists idx_run_questions_run_id on public.run_questions(run_id);
create index if not exists idx_run_questions_question_id on public.run_questions(question_id);
create index if not exists idx_run_dimension_scores_run_id on public.run_dimension_scores(run_id);
create index if not exists idx_run_feedback_run_id on public.run_feedback(run_id);

alter table public.autopsy_runs enable row level security;
alter table public.autopsy_answers enable row level security;
alter table public.run_questions enable row level security;
alter table public.run_dimension_scores enable row level security;
alter table public.run_feedback enable row level security;

-- Verification query
select table_name
from information_schema.tables
where table_schema = 'public'
  and table_name in (
    'autopsy_runs',
    'autopsy_answers',
    'run_questions',
    'run_dimension_scores',
    'run_feedback'
  )
order by table_name;

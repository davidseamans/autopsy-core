-- =========================================================
-- AUTOPSY SYSTEM — CANONICAL SCHEMA SNAPSHOT
-- Source: Live Supabase (public schema)
-- Mode: Option A (Exact Snapshot — No Refactor)
-- =========================================================

-- EXTENSIONS
create extension if not exists "uuid-ossp";

-- =========================================================
-- TABLES
-- =========================================================

-- ACCOUNTS
create table if not exists accounts (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  created_at timestamp default now()
);

-- CONTACTS
create table if not exists contacts (
  id uuid primary key default gen_random_uuid(),
  account_id uuid references accounts(id),
  name text,
  email text,
  created_at timestamp default now()
);

-- LEADS / PIPELINE
create table if not exists pipeline (
  id uuid primary key default gen_random_uuid(),
  contact_id uuid references contacts(id),
  stage text not null,
  created_at timestamp default now()
);

-- QUOTES
create table if not exists quotes (
  id uuid primary key default gen_random_uuid(),
  pipeline_id uuid references pipeline(id),
  status text,
  created_at timestamp default now()
);

-- JOBS
create table if not exists jobs (
  id uuid primary key default gen_random_uuid(),
  quote_id uuid references quotes(id),
  status text,
  created_at timestamp default now()
);

-- QUESTIONS
create table if not exists questions (
  id uuid primary key default gen_random_uuid(),
  prompt text not null,
  created_at timestamp default now()
);

-- ANSWER OPTIONS
create table if not exists answer_options (
  id uuid primary key default gen_random_uuid(),
  question_id uuid references questions(id),
  label text,
  score integer,
  created_at timestamp default now()
);

-- AUTOPSY RUNS
create table if not exists autopsy_runs (
  id uuid primary key default gen_random_uuid(),
  run_name text,
  tester_email text,
  score_total integer,
  verdict_label text,
  created_at timestamp default now()
);

-- RESPONSES
create table if not exists run_responses (
  id uuid primary key default gen_random_uuid(),
  run_id uuid references autopsy_runs(id),
  question_id uuid references questions(id),
  selected_option uuid references answer_options(id),
  score_value integer,
  created_at timestamp default now(),
  unique(run_id, question_id)
);

-- RUN QUESTIONS (FROZEN SET)
create table if not exists run_questions (
  id uuid primary key default gen_random_uuid(),
  run_id uuid references autopsy_runs(id),
  question_id uuid references questions(id),
  question_order integer
);

-- VERDICT BANDS
create table if not exists verdict_bands (
  id uuid primary key default gen_random_uuid(),
  band_name text,
  min_score integer,
  max_score integer,
  created_at timestamp default now()
);

-- DOMAIN NARRATIVES
create table if not exists domain_narratives (
  id uuid primary key default gen_random_uuid(),
  domain text,
  failure_condition text,
  requirement_to_proceed text,
  retest_condition text
);

-- RUN FEEDBACK
create table if not exists run_feedback (
  id uuid primary key default gen_random_uuid(),
  run_id uuid references autopsy_runs(id),
  clarity_score integer,
  usefulness_score integer,
  trust_score integer,
  confusing_point text,
  missing_something text,
  additional_comments text,
  created_at timestamp default now(),
  unique(run_id)
);

-- AUDIT LOG
create table if not exists audit_log (
  id uuid primary key default gen_random_uuid(),
  table_name text,
  action text,
  created_at timestamp default now()
);

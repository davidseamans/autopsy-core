-- Canonical governed baseline
-- Applied to autopsy-canonical
-- Project ref: fzbdztapkyrfwjwxtwte

create extension if not exists pgcrypto;

create table public.dimensions (
  dimension_code text primary key,
  dimension_name text not null,
  sort_order integer
);

create table public.scenario (
  code text primary key,
  name text not null,
  is_active boolean default true
);

create table public.questions (
  id uuid primary key default gen_random_uuid(),
  q_id text not null unique,
  prompt text not null,
  scenario_code text default 'startup' references public.scenario(code),
  dimension_code text not null references public.dimensions(dimension_code),
  weight numeric default 1,
  is_active boolean default true,
  is_hard_fail boolean default false,
  hard_fail_message text,
  failure_condition text,
  requirement_to_proceed text,
  retest_condition text,
  constraint_label text,
  constraint_why text,
  action_required text,
  created_at timestamptz default now()
);

-- truncated for canonical baseline tracking

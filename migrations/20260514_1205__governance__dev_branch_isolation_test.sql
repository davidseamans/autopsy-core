create table if not exists public.governance_dev_test (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  note text not null default 'dev branch operational'
);

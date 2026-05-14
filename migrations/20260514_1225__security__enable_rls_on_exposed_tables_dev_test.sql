-- DEV TEST ONLY
-- Purpose: close exposed table access identified during baseline inventory.
-- Production promotion requires validation before merge.

alter table public.sites enable row level security;
alter table public.questions_backup_20260415 enable row level security;
alter table public.verdict_narratives_legacy_archive enable row level security;

drop policy if exists "allow read sites" on public.sites;

create policy "allow read sites"
on public.sites
for select
to anon, authenticated
using (true);

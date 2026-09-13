-- <Product> landing · waitlist (rename the table and the allowed source values to match the page's forms)
-- anon (публічний ключ): лише INSERT у дозволені колонки; SELECT/UPDATE/DELETE заборонені
-- service_role: повний доступ (список читати з дашборда або сервісним ключем)

create extension if not exists "pgcrypto";

create table if not exists public.early_birds (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  email text not null,
  source text not null default 'landing',
  page text,
  referrer text,
  user_agent text,
  constraint early_birds_email_format
    check (char_length(email) between 6 and 254 and email ~* '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]+$'),
  constraint early_birds_source_len check (char_length(source) <= 40),
  constraint early_birds_page_len check (page is null or char_length(page) <= 200),
  constraint early_birds_referrer_len check (referrer is null or char_length(referrer) <= 500),
  constraint early_birds_user_agent_len check (user_agent is null or char_length(user_agent) <= 400)
);

-- одна адреса = один запис; повторна відправка дає 409
create unique index if not exists early_birds_email_key on public.early_birds (lower(email));
create index if not exists early_birds_created_at_idx on public.early_birds (created_at desc);

alter table public.early_birds enable row level security;

drop policy if exists early_birds_anon_insert on public.early_birds;
create policy early_birds_anon_insert on public.early_birds
  for insert to anon
  with check (
    email = lower(btrim(email))
    and source in ('hero', 'final', 'landing')
  );

-- жодного читання для anon; INSERT лише в ці колонки, тож id і created_at не підмінити
revoke all on table public.early_birds from anon, authenticated;
grant insert (email, source, page, referrer, user_agent) on table public.early_birds to anon;

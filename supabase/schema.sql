-- Samy Store — esquema do banco (Supabase, plano gratuito)
-- Projeto: samy-store (sa-east-1 / São Paulo)

create table public.settings (
  id int primary key default 1 check (id = 1),
  name text not null, tagline text, whatsapp text, instagram text,
  headline text, subline text, freight jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

create table public.products (
  id text primary key,
  sort int not null default 0,
  name text not null, category text, specs jsonb not null default '[]'::jsonb,
  price numeric(10,2), colors jsonb, ask_model boolean, ref text,
  active boolean not null default true,
  photo text,            -- caminho da foto no site (ex.: img/<id>.webp)
  updated_at timestamptz not null default now()
);

create table public.reviews (
  id bigint generated always as identity primary key,
  sort int not null default 0,
  name text, product text, stars int not null default 5 check (stars between 1 and 5),
  text text, photos jsonb, video text, video_url text,
  created_at timestamptz not null default now()
);

-- Custos e pedidos, já criptografados com a senha da loja. Sem acesso público.
create table public.admin_vault (
  id int primary key default 1 check (id = 1),
  secret jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.settings    enable row level security;
alter table public.products    enable row level security;
alter table public.reviews     enable row level security;
alter table public.admin_vault enable row level security;

create policy "leitura publica" on public.settings for select to anon, authenticated using (true);
create policy "leitura publica de ativos" on public.products for select to anon, authenticated using (active);
create policy "leitura publica" on public.reviews for select to anon, authenticated using (true);

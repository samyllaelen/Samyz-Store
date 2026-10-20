# Samy Store — catálogo online

Site estático (um `index.html` + fotos em `img/`) que lê produtos, configurações e avaliações do Supabase. Se o banco estiver fora do ar, o site mostra os dados embutidos na página.

## Peças (tudo no plano gratuito)

- **Site:** Vercel (Hobby), sem build — publica a pasta como está.
- **Banco:** Supabase (Free), projeto `samy-store`, região São Paulo. Esquema em `supabase/schema.sql`.
- **Código:** este repositório no GitHub; cada push na `main` publica de novo na Vercel.

## Como alterar produtos

Pelo painel do Supabase → Table Editor → `products` (preço, nome, categoria, ativo). As mudanças aparecem no site ao recarregar.
Foto nova: coloque o arquivo em `img/` e escreva o caminho (ex.: `img/meu-produto.webp`) na coluna `photo`.

## Segurança

A chave no `index.html` é a chave pública (publishable) do Supabase — só permite leitura, controlada por RLS. Custos e pedidos ficam em `admin_vault`, criptografados e sem acesso público.

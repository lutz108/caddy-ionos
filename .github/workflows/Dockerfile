FROM caddy:2.11.4-builder@sha256:c7ae80243a530d532d20062d56d6198b3ab161eb6971d28716ef7ec55599fea4 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/ionos \
    --with github.com/mholt/caddy-l4

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
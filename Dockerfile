FROM caddy:2.11.7-builder@sha256:bf6a7d38add2508b7d2e3e3f40cf2af399214f143c0fa3daa51f254e01f8d293 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/ionos \
    --with github.com/mholt/caddy-l4

# The image is tagged with this version, keep it in sync with the builder.
FROM caddy:2.11.7@sha256:5e5286cb37d44086d651a5363f05f43a692ce4d649d88fb1bd844579f45fa9e8

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

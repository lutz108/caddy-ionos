FROM caddy:2.11.9-builder@sha256:b5cf210885555bd4fe0bb0fa5ac775e8cacb152153c94080e47894eaea999709 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/ionos \
    --with github.com/mholt/caddy-l4

# The image is tagged with this version, keep it in sync with the builder.
FROM caddy:2.11.9@sha256:13d490f64f99ee3e3dcd828add6d3b822a916cdb3490d9d272a8d761678da624

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

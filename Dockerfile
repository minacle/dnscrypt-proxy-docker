FROM debian:bookworm-slim

COPY dnscrypt-proxy /usr/local/bin/dnscrypt-proxy

COPY example-dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

EXPOSE 53/tcp 53/udp

ENTRYPOINT [ "/usr/local/bin/dnscrypt-proxy", "-config", "/etc/dnscrypt-proxy/dnscrypt-proxy.toml" ]

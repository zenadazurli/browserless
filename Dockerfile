FROM browserless/chrome:latest

USER root
RUN apt-get update && apt-get install -y socat curl && rm -rf /var/lib/apt/lists/*
USER blessuser

CMD socat TCP-LISTEN:8081,reuseaddr,fork SOCKS5:sazz16014w96:t3vz152mql23@resi.fusionproxy.net:13822 & \
    socat TCP-LISTEN:8082,reuseaddr,fork SOCKS5:sazz16014w96:t3vz152mql23@resi.fusionproxy.net:14693 & \
    /usr/local/bin/dumb-init -- /usr/local/bin/browserless

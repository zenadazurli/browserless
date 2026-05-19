#!/bin/bash

# Tunnel SOCKS5 -> HTTP verso FusionProxy (porta casuale)
PORTS=(13822 14693 13711 14329 14012 14465 13768 13506 14995 13353 13231)
RANDOM_PORT=${PORTS[$RANDOM % ${#PORTS[@]}]}

echo "🚀 Tunnel FusionProxy sulla porta: $RANDOM_PORT"

socat TCP-LISTEN:8080,reuseaddr,fork \
  SOCKS5:sazz16014w96:t3vz152mql23@resi.fusionproxy.net:$RANDOM_PORT &

# Avvia lo script originale di Browserless
exec /usr/local/bin/dumb-init -- /usr/local/bin/browserless

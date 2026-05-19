FROM browserless/chrome:1-chrome-stable

# Mantieni tutte le impostazioni originali
ENV ENABLE_DEBUGGER=false
ENV DEBUG=browserless:server
ENV PRINT_NETWORK_INFO=false

# AGGIUNGI solo socat e il tunnel
USER root
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*
USER blessuser

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

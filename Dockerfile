FROM browserless/chrome:1-chrome-stable

ENV ENABLE_DEBUGGER=false
ENV DEBUG=browserless:server
ENV PRINT_NETWORK_INFO=false
# Installa socat per il tunnel proxy
USER root
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*
USER blessuser

# Copia il nostro entrypoint personalizzato
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Sovrascrivi l'ENTRYPOINT originale
ENTRYPOINT ["/entrypoint.sh"]

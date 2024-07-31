FROM --platform=linux/amd64 ethereum/client-go:alltools-latest

EXPOSE 8545 30303

RUN apk add --no-cache curl
COPY start-miner.sh /start-miner.sh
RUN chmod +x /start-miner.sh

ENTRYPOINT ["/start-miner.sh"]
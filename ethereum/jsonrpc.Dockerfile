FROM --platform=linux/amd64 ethereum/client-go:alltools-latest

EXPOSE 8545 30303

RUN apk add --no-cache curl
COPY start-geth.sh /start-geth.sh
RUN chmod +x /start-geth.sh

ENTRYPOINT ["/start-geth.sh"]
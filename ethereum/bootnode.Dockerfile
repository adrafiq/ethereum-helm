FROM --platform=linux/amd64 ethereum/client-go:alltools-latest

RUN bootnode -genkey /bootnode.key

EXPOSE 30301/udp

COPY start-bootnode.sh /start-bootnode.sh
RUN chmod +x /start-bootnode.sh

# Create a directory for the enode information
RUN mkdir /bootnode_data

ENTRYPOINT ["/start-bootnode.sh"]
FROM alpine:latest
WORKDIR /root/
COPY http-server .
CMD ["./http-server"]
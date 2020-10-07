FROM golang:1.13
WORKDIR /go/src/github.com/wilhelmguo/multi-stage-demo/
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o http-server .

FROM alpine:latest
WORKDIR /root/
COPY --from=0 /go/src/github.com/wilhelmguo/multi-stage-demo/http-server .
CMD ["./http-server"]
FROM golang:1.23-alpine AS builder

LABEL stage=gobuilder

ENV CGO_ENABLED=0

WORKDIR /build
COPY . .
RUN go build

FROM ubuntu:22.04

ENV TZ=Asia/Shanghai

WORKDIR /app

COPY --from=builder /build/lxcfs-admission-webhook /app/lxcfs-admission-webhook
ENTRYPOINT ["./lxcfs-admission-webhook"]

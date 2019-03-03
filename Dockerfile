FROM alpine:latest as builder

RUN MSMTP_VERSION=1.8.1-r1 && \
    apk --no-cache add msmtp=${MSMTP_VERSION} && \
    MSMTP_VERSION=

FROM netdata/netdata:latest

COPY --from=builder / /


FROM alpine:latest as builder

RUN MSMTP_VERSION=1.8.1-r1 && \
    apk --no-cache add msmtp=${MSMTP_VERSION} && \
    rm /usr/sbin/sendmail && \
    ln -sf /usr/bin/msmtp /usr/sbin/sendmail && \
    MSMTP_VERSION=

FROM netdata/netdata:latest

COPY --from=builder / /


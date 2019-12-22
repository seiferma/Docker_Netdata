FROM alpine:latest as builder

RUN MSMTP_VERSION=1.8.6-r1 && \
    apk --no-cache add msmtp=${MSMTP_VERSION} && \
    MSMTP_VERSION=

FROM netdata/netdata:latest

COPY --from=builder /usr/bin/ /usr/bin/
COPY --from=builder /usr/lib/lib*so* /usr/lib/

RUN rm /usr/sbin/sendmail && \
    ln -sf /usr/bin/msmtp /usr/sbin/sendmail

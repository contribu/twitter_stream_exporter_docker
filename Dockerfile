FROM alpine:3.9.2
SHELL ["/bin/sh", "-c"]
ADD ca-certificates.crt /etc/ssl/certs/
ADD twitter_stream_exporter /bin

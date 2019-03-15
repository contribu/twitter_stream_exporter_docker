FROM alpine:3.9.2
SHELL ["/bin/sh", "-c"]
ADD twitter_stream_exporter /bin

FROM alpine:3.9.2
SHELL ["/bin/bash", "-c"]
ADD twitter_stream_exporter /usr/local/bin

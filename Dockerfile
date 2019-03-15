FROM buildpack-deps:cosmic
SHELL ["/bin/bash", "-c"]
ADD twitter_stream_exporter /usr/local/bin

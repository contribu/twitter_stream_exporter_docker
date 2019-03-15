FROM buildpack-deps:cosmic

SHELL ["/bin/bash", "-c"]

ENV PATH /root/go/bin:$PATH
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV LIBRARY_PATH /usr/local/lib:$LIBRARY_PATH
# https://qiita.com/yagince/items/deba267f789604643bab
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y golang \
    && mkdir -p $(go env GOPATH)/bin \
    && mkdir -p $(go env GOPATH)/src/github.com/cosmopetrich \
    && cd $(go env GOPATH)/src/github.com/cosmopetrich \
    && git clone -b master --single-branch --depth 1 https://github.com/cosmopetrich/twitter_stream_exporter.git \
    && cd twitter_stream_exporter \
    && (curl https://glide.sh/get | sh) \
    && glide install \
    && export GOOS="linux" \
    && export GOARCH="amd64" \
    && VERSION=$(git describe --always --dirty) \
    && SHA1=$(git rev-parse --short --verify HEAD) \
    && BUILD_DATE=$(date -u +%F-%T) \
    && go build -ldflags "-extldflags -static -X main.VERSION=${VERSION} -X main.COMMIT_SHA1=${SHA1} -X main.BUILD_DATE=${BUILD_DATE}" \
    && mv twitter_stream_exporter /usr/local/bin \
    && cd \
    && rm -rf $(go env GOPATH) \
    && rm -rf $(go env GOROOT) \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

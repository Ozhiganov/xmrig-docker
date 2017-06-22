FROM  alpine:latest
MAINTAINER Evgeniy N. Ozhiganov <eozhiganov@ya.ru>
RUN   adduser -S -D -H -h /xmrig xminer
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        openssl-dev \
        curl-dev \
        git \
        cmake \
        build-base && \
      git clone https://github.com/xmrig/xmrig && \
      cd xmrig && \
      mkdir build && \
      cmake -DCMAKE_BUILD_TYPE=Release . && \
      make && \
      apk del \
        build-base \
        cmake \
        git
USER xminer
WORKDIR    /xmrig
ENTRYPOINT  ["./xmrig"]

ARG CHIA_VERSION
FROM ghcr.io/chia-network/chia:${CHIA_VERSION}

RUN apt-get update && apt-get install -y \
  wget \
  nano \
  && rm -rf /var/lib/apt/lists/*

ARG UID=11322
ARG GID=$UID
RUN groupadd -g $GID -r chiagroup \
  && useradd -u $UID --no-log-init --create-home -r -g chiagroup chiauser \
  && mkdir /data && chown -R $UID:$GID /data \
  && mkdir /.chia_keys && chown -R $UID:$GID /.chia_keys \
  && mkdir /plots && chown -R $UID:$GID /plots \
  && chown -h $UID /etc && chown -h $UID /etc/timezone

ENV CHIA_ROOT=/data

COPY docker-entrypoint.sh /usr/local/bin/

USER $UID:$GID

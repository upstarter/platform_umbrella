# Alias this container as builder:
FROM frolvlad/alpine-glibc
ARG APP_NAME=platform_umbrella
ARG PHOENIX_SUBDIR=./apps/platform_web
ENV MIX_ENV=prod REPLACE_OS_VARS=true TERM=xterm
WORKDIR /opt/app
RUN apk update \
    && apk add ca-certificates \
    && apk add wget python2 \
    && apk add gmp build-base \
    && apk --no-cache --update add yarn nodejs nodejs-npm

RUN apk add --update \
      git \
      erlang=20.1.7-r2 \
      elixir=1.5.2-r0 \
      erlang-crypto \
      erlang-parsetools \
      erlang-syntax-tools \
      erlang-runtime-tools

RUN mix local.rebar --force \
    && mix local.hex --force \
    && wget https://dl.bintray.com/elmlang/elm-platform/0.18.0/linux-x64.tar.gz \
    && tar xvzf linux-x64.tar.gz

ENV PATH="/opt/app/dist_binaries:${PATH}"

COPY . .
RUN mix do deps.get, deps.compile, compile
RUN cd ${PHOENIX_SUBDIR}/assets \
    && yarn install \
    && ./node_modules/brunch/bin/brunch build -p \
    && cd .. \
    && mix phx.digest
RUN mix release --env=prod --verbose \
    && mv _build/prod/rel/${APP_NAME} /opt/release \
    && mv /opt/release/bin/${APP_NAME} /opt/release/bin/start_server
# End Build Container

# Run Container
FROM frolvlad/alpine-glibc:latest

RUN apk update && apk --no-cache --update add \
    ncurses-libs \
    zlib \
    ca-certificates \
    bash \
    openssl-dev

ENV PORT=8080 MIX_ENV=prod REPLACE_OS_VARS=true
WORKDIR /opt/app
EXPOSE ${PORT}
COPY --from=0 /opt/release .
CMD ["/opt/app/bin/start_server", "foreground"]

# End Run Container

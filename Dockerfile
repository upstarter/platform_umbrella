# Alias this container as builder:
FROM elixir:alpine
ARG APP_NAME=platform_umbrella
ARG PHOENIX_SUBDIR=./apps/platform_web
ENV PORT=4000 MIX_ENV=prod REPLACE_OS_VARS=true TERM=xterm
WORKDIR /opt/app
RUN apk update \
    && apk --no-cache --update add gmp yarn nodejs nodejs-npm python2 \
    && mix local.rebar --force \
    && mix local.hex --force
RUN apk add build-base

COPY . .
RUN mix do deps.get, deps.compile, compile
RUN cd ${PHOENIX_SUBDIR}/assets \
    && npm install \
    && yarn global add elm \
    && ./node_modules/brunch/bin/brunch build -p \
    && cd .. \
    && mix phx.digest
RUN mix release --env=prod --verbose \
    && mv _build/prod/rel/${APP_NAME} /opt/release \
    && mv /opt/release/bin/${APP_NAME} /opt/release/bin/start_server
# End Build Container

# Run Container
FROM alpine:latest
RUN apk update && apk --no-cache --update add bash openssl-dev
ENV PORT=4000 MIX_ENV=prod REPLACE_OS_VARS=true
WORKDIR /opt/app
EXPOSE ${PORT}
COPY --from=0 /opt/release .
CMD ["/opt/app/bin/start_server", "foreground"]

# End Run Container

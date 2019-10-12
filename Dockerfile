FROM elixir:latest as build-stage
ARG app_name=platform_umbrella
ARG phoenix_subdir=apps/platform_web
ARG platform_subdir=apps/platform
ARG build_env=prod
ENV MIX_ENV=${build_env} TERM=xterm
ENV DATABASE_URL=/tmp/cloudsql/eternal-sunset-206422:us-central1:umbrella-db
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=ZQLm3AsToWtXkyePALtGRhjs
ENV PORT=80

ENV CW_KEYFILE=platform-web.ai.key
ENV CW_CERTFILE=platform-web.ai.pem
ENV DB_CA_CERTFILE=server-ca.pem
ENV DB_KEYFILE=client-key.pem
ENV DB_CERTFILE=client-cert.pem

WORKDIR /app
RUN apt-get update -y \
    && mix local.rebar --force \
    && mix local.hex --force

COPY . .

RUN mix do deps.get, compile
# RUN cd ${phoenix_subdir} \
#     && mix phx.digest \
#     && cd ..

RUN mix distillery.release --env=${build_env} --executable --verbose
RUN mv _build/${build_env}/rel/${app_name}/bin/${app_name}.run start_release

# PROD STAGE
FROM envoyproxy/envoy:latest as production-stage
ENV MIX_ENV=${build_env} TERM=xterm

ENV DATABASE_URL=/tmp/cloudsql/eternal-sunset-206422:us-central1:umbrella-db
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=ZQLm3AsToWtXkyePALtGRhjs

ENV CW_KEYFILE=platform-web.ai.key
ENV CW_CERTFILE=platform-web.ai.pem
ENV DB_CA_CERTFILE=server-ca.pem
ENV DB_KEYFILE=client-key.pem
ENV DB_CERTFILE=client-cert.pem

ENV PORT=80
EXPOSE 80
# RUN chmod 777 -R ${phoenix_subdir}/priv/cert
# RUN chmod 777 -R ${platform_subdir}/priv/cert

COPY --from=build-stage /app/start_release start_release

RUN apt update \
    && apt upgrade \
    && apt install -y wget

RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 \
    -O cloud_sql_proxy
RUN chmod +x cloud_sql_proxy
RUN mkdir /tmp/cloudsql
RUN cloud_sql_proxy -projects=eternal-sunset-206422 -dir=/tmp/cloudsql &

COPY ./container-bootstart.sh /usr/local/bin
RUN chmod +x /usr/local/bin/container-bootstart.sh
ENTRYPOINT ["/usr/local/bin/container-bootstart.sh"]

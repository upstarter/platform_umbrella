FROM envoyproxy/envoy:v1.20.0 as build-stage

FROM elixir:latest as production-build
COPY --from=build-stage /etc/envoy /etc/envoy/
COPY --from=build-stage /usr/local/bin/envoy /usr/local/bin

ARG app_name=platform_umbrella
ARG phoenix_subdir=apps/platform_web
ARG platform_subdir=apps/platform
ARG build_env=prod
ENV MIX_ENV=${build_env} TERM=xterm
ENV CMC_PRO_API_KEY=108d9086-dbf4-49f7-a388-ed6c69c19b87


ENV CW_KEYFILE=platform-web.ai.key
ENV CW_CERTFILE=platform-web.ai.pem
ENV DB_CA_CERTFILE=server-ca.pem
ENV DB_KEYFILE=client-key.pem
ENV DB_CERTFILE=client-cert.pem
ENV PORT=8080
EXPOSE 8080
EXPOSE 80
WORKDIR /app
RUN apt-get update -y \
    # && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y -q --no-install-recommends net-tools

RUN mix local.rebar --force \
    && mix local.hex --force

# caches unchanged dependencies
COPY config/config.exs .
COPY ${phoenix_subdir}/mix.exs .
COPY ${platform_subdir}/mix.exs .
COPY mix.exs mix.lock ./

COPY . .

# RUN chmod 777 -R ${phoenix_subdir}/priv/cert
# RUN chmod 777 -R ${platform_subdir}/priv/cert
RUN mix do deps.get, compile
# RUN cd ${phoenix_subdir} \
#     && mix phx.digest \
#     && cd ../..

# RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 \
#     -O cloud_sql_proxy
# RUN chmod +x cloud_sql_proxy
# RUN mkdir /tmp/cloudsql

RUN mix distillery.release --env=${build_env} --executable --verbose
RUN mv _build/${build_env}/rel/${app_name}/bin/${app_name}.run start_release

COPY .iex.exs /root
COPY ./container-bootstart.sh /usr/local/bin
RUN chmod +x /usr/local/bin/container-bootstart.sh
ENTRYPOINT ["/usr/local/bin/container-bootstart.sh"]

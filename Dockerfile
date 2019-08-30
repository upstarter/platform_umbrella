FROM elixir:latest
ARG app_name=platform_umbrella
ARG phoenix_subdir=apps/platform_web
ARG build_env=prod
ENV MIX_ENV=${build_env} TERM=xterm
ENV PORT=8080
EXPOSE 8080
EXPOSE 443
WORKDIR /app
RUN apt-get update -y \
    # && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    # && apt-get install -y -q --no-install-recommends nodejs \
    && apt-get install -y postgresql-client \
    && mix local.rebar --force \
    && mix local.hex --force
COPY . .

RUN chmod 777 -R ${phoenix_subdir}/priv/cert
RUN mix do deps.get, compile
RUN cd ${phoenix_subdir} \
    && mix phx.digest \
    && cd ..
RUN mix distillery.release --env=${build_env} --executable --verbose \
    && mv _build/${build_env}/rel/${app_name}/bin/${app_name}.run start_release

COPY ./container-bootstart.sh /
RUN chmod +x /container-bootstart.sh
ENTRYPOINT ["/container-bootstart.sh"]

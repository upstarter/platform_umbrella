FROM elixir:latest
ARG app_name=platform_umbrella
ARG phoenix_subdir=apps/platform_web
ARG build_env=prod
ENV MIX_ENV=${build_env} TERM=xterm
ENV CW_KEYFILE_PATH="priv/cert/platform-web.ai.key"
ENV CW_CERTFILE_PATH="priv/cert/platform-web.ai.pem"
WORKDIR /app
ENV PORT=8080
EXPOSE 8080
RUN apt-get update -y \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y -q --no-install-recommends nodejs \
    && mix local.rebar --force \
    && mix local.hex --force
COPY . .
RUN mix do deps.get, compile
RUN cd ${phoenix_subdir} \
    && mix phx.digest \
    && cd ..
RUN mix distillery.release --env=${build_env} --executable --verbose \
    && mv _build/${build_env}/rel/${app_name}/bin/${app_name}.run start_release

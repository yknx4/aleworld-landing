FROM elixir:1.11-alpine AS build

# install build dependencies
RUN apk add --no-cache build-base npm git && npm install -g yarn

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

# install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN DATABASE_URL="" SECRET_KEY_BASE="" mix do deps.get, deps.compile

# build assets
COPY assets/package.json assets/yarn.lock ./assets/
RUN cd assets && yarn install --frozen-lockfile

COPY priv priv
COPY assets assets
RUN cd assets && yarn deploy
RUN DATABASE_URL="" SECRET_KEY_BASE="" mix phx.digest

# compile and build release
COPY lib lib
# uncomment COPY if rel/ exists
# COPY rel rel
RUN DATABASE_URL="" SECRET_KEY_BASE="" mix do compile, release

# prepare release image
FROM alpine:3.9 AS app
RUN apk add --no-cache openssl ncurses-libs

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/aleworld ./

ENV HOME=/app

CMD ["bin/aleworld", "start"]
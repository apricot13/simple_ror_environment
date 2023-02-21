FROM ruby:2.6.6-alpine as base_image
RUN apk add --no-cache -t .build-dependencies \
  build-base \
  libpq \
  postgresql-dev \
  && apk add --no-cache \
    git \
    tzdata \
    gcompat \
    python3

# gcompat is for nokogiri - alpine doesnt include glibc it needs https://nokogiri.org/tutorials/installing_nokogiri.html#linux-musl-error-loading-shared-library
# python2 for node-sass drama

# install node v16
# see here for reference https://github.com/timbru31/docker-ruby-node/blob/master/3.0/16/alpine/Dockerfile
RUN apk -U upgrade \
  && apk add --repository https://dl-cdn.alpinelinux.org/alpine/v3.13/main/ --no-cache \
    "nodejs<18" \
  && apk add --no-cache \
    npm \
    yarn

FROM base_image as development
COPY ./application/Gemfile /tmp/Gemfile
COPY ./application/Gemfile.lock /tmp/Gemfile.lock
COPY ./containers/ruby/runners/runner.development.sh /rdebug_ide/runner.sh

# git config line is for mimemagic 0.3.5
RUN cd /tmp && \
  gem install ruby-debug-ide && \
  gem install debase && \
  git config --global url."https://github".insteadOf git://github && \
  bundle install && \
  chmod +x /rdebug_ide/runner.sh && \
  apk add --no-cache git \
  nodejs \
  yarn
WORKDIR /app

ENTRYPOINT ["tail", "-f", "/dev/null"]

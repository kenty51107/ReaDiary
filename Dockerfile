FROM ruby:3.1.2
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn
RUN apt-get install -y vim
RUN apt-get install -y imagemagick

ENV APP_PATH /readiary

RUN mkdir $APP_PATH
WORKDIR $APP_PATH

ADD Gemfile $APP_PATH/Gemfile
ADD Gemfile.lock $APP_PATH/Gemfile.lock

RUN gem update bundler
RUN gem update --system
RUN bundle install

ADD . $APP_PATH

# Nginxと通信を行うための準備
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

VOLUME $APP_PATH/public
VOLUME $APP_PATH/tmp

RUN yarn install --check-files
RUN SECRET_KEY_BASE=placeholder bundle exec rails assets:precompile
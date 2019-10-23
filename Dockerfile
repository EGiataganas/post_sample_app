FROM ruby:2.5.3

RUN bash -c "export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -qq && \
    apt-get -y upgrade && \
    apt-get install -y \
        build-essential \
        libpq-dev"

RUN gem install bundler --no-doc

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
        apt-get install -y nodejs

WORKDIR /app

ADD . /app

RUN bundle install

EXPOSE 3000
CMD bin/rails server -b 0.0.0.0 -p 3000

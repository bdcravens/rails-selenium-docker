FROM ruby:3.1

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips42 \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ENV LANG=C.UTF-8 \
#   BUNDLE_JOBS=4 \
#   BUNDLE_RETRY=3

ENV APP_HOME /opt/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
  
RUN gem update --system && gem install bundler

COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
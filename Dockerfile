# syntax=docker/dockerfile:1
FROM ruby:3.3.4-slim

LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
LABEL org.opencontainers.image.title="github-pages"
LABEL org.opencontainers.image.description="Jekyll environment aligned with GitHub Pages gem versions"
LABEL org.opencontainers.image.source="https://github.com/naoigcat/docker-github-pages"

ARG DEBIAN_FRONTEND=noninteractive
ENV GEM_HOME=/usr/local/bundle \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG=/usr/local/bundle

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        g++ \
        make \
    && gem install bundler -v 4.0.9 --no-document \
    && echo 'source "https://rubygems.org"\ngem "github-pages", "232"' > /Gemfile \
    && bundle install --gemfile=/Gemfile \
    && rm -f /Gemfile /Gemfile.lock \
    && gem uninstall bundler -v 4.0.9 \
    && apt-get purge -y --auto-remove g++ make \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /src/site

WORKDIR /src/site

RUN groupadd --gid 1000 jekyll \
    && useradd \
        --uid 1000 \
        --gid jekyll \
        --home-dir /src/site \
        --no-create-home \
        --shell /usr/sbin/nologin \
        jekyll \
    && chown -R jekyll:jekyll /src/site

USER jekyll

EXPOSE 4000

CMD ["jekyll", "serve", "-w", "-H", "0.0.0.0", "-P", "4000"]

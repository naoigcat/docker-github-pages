FROM ruby:3.3.4-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
RUN apt-get update && \
    apt-get install -y --no-install-recommends g++ make && \
    gem install bundler -v 4.0.9 && \
    echo 'source "https://rubygems.org"\ngem "github-pages", "232"' > Gemfile && \
    bundle install && \
    gem uninstall bundler -v 4.0.9 && \
    mkdir -p /src/site
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

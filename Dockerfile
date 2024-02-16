FROM ruby:2.7.4-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
RUN apt-get update && \
    apt-get install -y --no-install-recommends g++ make && \
    gem install bundler -v 2.4.22 && \
    echo 'source "https://rubygems.org"\ngem "github-pages", "231"' > Gemfile && \
    bundle install && \
    gem uninstall bundler -v 2.4.22 && \
    mkdir -p /src/site
WORKDIR /src/site
CMD ["jekyll", "serve", "-w", "-H", "0.0.0.0", "-P", "4000"]

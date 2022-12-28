FROM ruby:2.7.3-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
RUN gem install github-pages -v 226 ; \
    mkdir -p /src/site
WORKDIR /src/site
CMD ["jekyll", "serve", "-w", "-H", "0.0.0.0", "-P", "4000"]

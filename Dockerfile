FROM ruby:2.7.4-slim
LABEL maintainer="naoigcat <17925623+naoigcat@users.noreply.github.com>"
RUN apt-get update && \
    apt-get install -y --no-install-recommends g++ make && \
    gem install github-pages -v 227 && \
    mkdir -p /src/site
WORKDIR /src/site
CMD ["jekyll", "serve", "-w", "-H", "0.0.0.0", "-P", "4000"]

FROM ruby:2.7.4
RUN gem install github-pages -v 228 ; \
    mkdir -p /src/site
WORKDIR /src/site
CMD ["jekyll", "serve", "-w", "-H", "0.0.0.0", "-P", "4000"]

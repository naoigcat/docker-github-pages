# Docker GitHub Pages

[![Docker Builds](https://github.com/naoigcat/docker-github-pages/actions/workflows/push.yml/badge.svg)](https://github.com/naoigcat/docker-github-pages/actions/workflows/push.yml)

[![GitHub Stars](https://img.shields.io/github/stars/naoigcat/docker-github-pages.svg)](https://github.com/naoigcat/docker-github-pages/stargazers)
[![Docker Pulls](https://img.shields.io/docker/pulls/naoigcat/github-pages)](https://hub.docker.com/r/naoigcat/github-pages)

**Docker Image for [GitHub Pages](https://pages.github.com)'s Gem**

## Installation

```sh
docker pull naoigcat/github-pages
```

## Usage

```sh
docker run --rm -v ${PWD}:/src/site -p 4000:4000 naoigcat/github-pages
```

### If file changes are not detected on macOS (Docker Desktop)

With bind mounts in Docker Desktop, file change events from the host may not be reliably propagated into the container.
In that case, using polling-based watching can detect updates.

```sh
docker run --rm -v ${PWD}:/src/site -p 4000:4000 naoigcat/github-pages \
    jekyll serve -w --force_polling -H 0.0.0.0 -P 4000
```

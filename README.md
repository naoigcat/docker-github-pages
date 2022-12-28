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

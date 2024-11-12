# syntax=docker/dockerfile:1@sha256:865e5dd094beca432e8c0a1d5e1c465db5f998dca4e439981029b3b81fb39ed5

# renovate: datasource=docker depName=yhs88a/alpine
ARG BASE_VERSION=3.20.3@sha256:083dbfad80225fd744b5f6d9dc9d4d31fd99cc93358a6009df986fe75cbf02a4

FROM yhs88a/alpine:${BASE_VERSION:-latest} AS base

LABEL maintainer="Anthony Yung <yhs88a@gmail.com>" \
    org.opencontainers.image.source="https://github.com/yhs88a/alpine-ci"

RUN apk add --no-cache \
    sudo bash git aws-cli curl ca-certificates jq \
    && rm -rf /var/cache/apk/* \
    && ln -fs $(which aws) /usr/local/bin/aws-cli \
    && mkdir -p /var/cache/apk \
    && ln -fs /var/cache/apk /etc/apk/cache

USER root

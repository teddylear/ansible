# Using ThePrimeagen's Dockerfile for local testing
FROM ubuntu:focal AS base
ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt update && \
    apt install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    apt install -y unzip && \
    apt install -y fontconfig

FROM base AS teddy
ARG TAGS
RUN addgroup --gid 1000 teddylear
RUN adduser --gecos teddylear --uid 1000 --gid 1000 --disabled-password teddylear
USER teddylear
WORKDIR /home/teddylear

FROM teddy
COPY . .
CMD ["sh", "-c", "ansible-playbook local.yml --tags \"fonts\""]

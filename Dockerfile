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
    apt install -y sudo

FROM base AS teddy
# https://dev.to/emmanuelnk/using-sudo-without-password-prompt-as-non-root-docker-user-52bg
RUN adduser --disabled-password \
--gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers
USER docker
WORKDIR /home/docker

FROM teddy
COPY . .
CMD ["sh", "-c", "ansible-playbook local.yml -b --tags \"fonts\""]

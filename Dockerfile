FROM ubuntu:trusty
MAINTAINER Thishan D Pathmanathan <thishandp7@gmail.com>

ENV TERM=xterm-256color

RUN apt-get update && \
    apt-get install -y \
    -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    python3 python3-pip python3.4-venv libpython2.7 python-mysqldb

RUN python3 -m venv /appenv && \
    . /appenv/bin/activate && \
    pip3 install --upgrade pip

ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT  ["entrypoint.sh"]

LABEL application=todobackend

FROM python:3.7.2-alpine3.8
RUN apk add --no-cache git build-base \
    && python3 -m venv /venv \
    && /venv/bin/pip install -U pip \
    && /venv/bin/pip install \
    sphinx==1.8.4 \
    sphinx_rtd_theme==0.4.3 \
    sphinx-autobuild recommonmark
COPY bootstrap.sh /bootstrap.sh
RUN mkdir /docs
WORKDIR /docs
EXPOSE 8000
STOPSIGNAL SIGINT
CMD ["/bootstrap.sh"]

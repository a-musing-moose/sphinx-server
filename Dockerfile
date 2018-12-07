FROM python:3.7-alpine
RUN python3 -m venv /venv \
    && /venv/bin/pip install -U pip \
    && /venv/bin/pip install \
        sphinx==1.8.2 \
        sphinx_rtd_theme==0.4.2 \
        sphinx-autobuild recommonmark
COPY bootstrap.sh /bootstrap.sh
RUN mkdir /docs
WORKDIR /docs
EXPOSE 8000
STOPSIGNAL SIGINT
ENTRYPOINT ["/bootstrap.sh"]

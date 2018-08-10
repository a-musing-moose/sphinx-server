FROM python:3.7-alpine
RUN pip install sphinx==1.7.6 sphinx_rtd_theme==0.4.1 sphinx-autobuild recommonmark
COPY bootstrap.sh /bootstrap.sh
RUN mkdir /docs
WORKDIR /docs
EXPOSE 8000
CMD /bootstrap.sh

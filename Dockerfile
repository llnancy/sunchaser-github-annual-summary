FROM python:3.8-alpine
RUN pip3 install requests Flask Pillow flask-cors && \
    mkdir /app
WORKDIR /app
ADD github-annual-summary.tar.gz .
LABEL maintainer=admin@lilu.org.cn
ENTRYPOINT ["python", "app.py"]

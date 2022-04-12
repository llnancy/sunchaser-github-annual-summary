FROM python:3.9.12-alpine3.15
RUN pip3 install requests Flask Pillow flask-cors -i https://mirrors.aliyun.com/pypi/simple/
LABEL maintainer=admin@lilu.org.cn
RUN mkdir /app
WORKDIR /app
ADD github-annual-summary.tar.gz .
ENTRYPOINT ["python", "app.py"]

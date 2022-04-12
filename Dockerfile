FROM python:3.8-alpine
RUN pip3 install requests Flask Pillow flask-cors
LABEL maintainer=admin@lilu.org.cn
RUN mkdir /app
WORKDIR /app
ADD github-annual-summary.tar.gz .
ENTRYPOINT ["python", "app.py"]

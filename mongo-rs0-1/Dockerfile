FROM mongo:4.0-xenial

WORKDIR /usr/src/configs

COPY mongo.conf .

EXPOSE 27017

CMD ["--config", "./mongo.conf"]
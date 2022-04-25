FROM mariadb:latest

ENV MYSQL_DATABASE=laliga \
    MYSQL_ROOT_PASSWORD=1111

ADD schema.sql /docker-entrypoint-initdb.d

EXPOSE 3306

ARG UID

# Create user and some useful stuff
RUN adduser -u ${UID} --disabled-password --gecos "" appuser 
RUN mkdir /home/appuser/.ssh
RUN chown -R appuser:appuser /home/appuser/

WORKDIR /home/appuser
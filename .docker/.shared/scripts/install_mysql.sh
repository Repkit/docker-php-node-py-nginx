#!/bin/sh

MYSQL_SERVER_PACKAGE=$1
MYSQL_SHELL_PACKAGE=$2

yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
      https://repo.mysql.com/mysql-community-release-el7.rpm \
  && yum-config-manager --enable mysql57-server-minimal \
  && yum install -y \
      ${MYSQL_SERVER_PACKAGE} \
      ${MYSQL_SHELL_PACKAGE} \
      libpwquality \
  && yum clean all \
  && mkdir /docker-entrypoint-initdb.d
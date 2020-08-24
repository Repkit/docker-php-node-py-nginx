FROM oraclelinux:7-slim

# path to the directory where the Dockerfile lives relative to the build context
ARG SERVICE_DIR="./mysql"

ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-5.7.30
ARG MYSQL_SHELL_PACKAGE=mysql-shell-8.0.20

# get the scripts from the build context and make sure they are executable
COPY .shared/scripts/ /tmp/scripts/
RUN chmod +x -R /tmp/scripts/

# set timezone
ARG TZ=UTC
RUN /tmp/scripts/install_mysql.sh ${TZ}

# Install server
RUN /tmp/scripts/install_mysql.sh ${MYSQL_SERVER_PACKAGE} ${MYSQL_SHELL_PACKAGE}

# add users
ARG APP_USER=www-data
ARG APP_USER_ID=1000
ARG APP_GROUP=$(APP_USER)
ARG APP_GROUP_ID=$(APP_USER_ID)

RUN /tmp/scripts/create_user.sh ${APP_USER} ${APP_GROUP} ${APP_USER_ID} ${APP_GROUP_ID}

# install common software
RUN /tmp/scripts/install_software.sh

# service specific configuration
VOLUME /var/lib/mysql

COPY ${SERVICE_DIR}/docker-entrypoint.sh /entrypoint.sh
COPY ${SERVICE_DIR}/healthcheck.sh /healthcheck.sh

# cleanup 
RUN /tmp/scripts/cleanup.sh

# define ENTRYPOINT
ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK CMD /healthcheck.sh
EXPOSE 3306 33060
CMD ["mysqld"]
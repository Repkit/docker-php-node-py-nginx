# Use the latest LTS (long term support) version
ARG TARGET_PYTHON_VERSION
FROM python:${TARGET_PYTHON_VERSION}

# get the scripts from the build context and make sure they are executable
COPY .shared/scripts/ /tmp/scripts/
RUN chmod +x -R /tmp/scripts/

RUN /tmp/scripts/install_scrapy.sh

# WORKDIR /root/py1
# ADD . /root
FROM openjdk:8u102-jre

MAINTAINER Erwin Mueller "erwin.mueller@nttdata.com"

# Configuration variables.
ENV SEYREN_VERSION 1.5.0

# Download Seyren.
ADD https://github.com/scobal/seyren/releases/download/${SEYREN_VERSION}/seyren-${SEYREN_VERSION}.jar /opt/seyren/seyren.jar

# Setup Seyren user.
RUN set -x \
    && useradd -rU seyren \
    && chmod 0644 /opt/seyren/seyren.jar \
    && mkdir /var/seyren \
    && chown seyren.seyren /var/seyren

# Seyren HTTP port.
EXPOSE 8080

# Set Seyren user.
USER seyren

# Seyren work directory.
WORKDIR /var/seyren

# Run Seyren.
CMD ["java", "-jar", "/opt/seyren/seyren.jar"]

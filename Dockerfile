FROM alpine:3.5

MAINTAINER jre8.111


ENV JAVA_HOME=/usr/lib/jvm/default-jvm/jre


add repositories /etc/apk/repositories


RUN apk upgrade --update-cache; \

    apk add openjdk8-jre; \

    rm -rf /tmp/* /var/cache/apk/*


CMD ["java", "-version"]

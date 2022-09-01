FROM anapsix/alpine-java:8_server-jre_unlimited
MAINTAINER cfn2

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ARG jarfile
RUN mkdir -p /cfneasy

COPY ./target/cfneasy-1.jar /cfneasy/app.jar
WORKDIR /cfneasy

EXPOSE 8088
ENV LOG_PATH  '/cfneasy/logs/'
ENV LOG_LEVE warn
ENV JIEAN_LOG_LEVEL info
ENV LOG_FILE 'cfneasy.log'
ENV CONG_ARG ''
CMD java -Dfile.encoding=UTF8 -Duser.timezone=GMT+08 -Djava.security.egd=file:/dev/./urandom -jar app.jar $CONG_ARG --logging.path=$LOG_PATH
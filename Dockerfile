# select operating system
FROM amazoncorretto:8

RUN yum update -y && yum install -y \
    gzip \
    unzip \
    procps \
    wget \
    tar \
  && yum clean all \
  && rm -rf /var/cache/yum

ENV SPARK_VERSION 2.4.4
ENV LIVY_VERSION 0.5.0
ENV SPARK_HOME /opt/spark-$SPARK_VERSION-bin-hadoop2.7
ENV APACHE=""

# apache livy
RUN wget https://archive.apache.org/dist/incubator/livy/$LIVY_VERSION-incubating/${APACHE}livy-$LIVY_VERSION-incubating-bin.zip -O /tmp/livy.zip && \
  unzip /tmp/livy.zip -d /opt/ && \
  rm /tmp/livy.zip && \
  mkdir /opt/${APACHE}livy-$LIVY_VERSION-incubating-bin/logs

# apache spark
RUN wget https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7.tgz -O /tmp/spark.tgz && \
  tar -xvzf /tmp/spark.tgz -C /opt/ && \
  rm /tmp/spark.tgz

COPY init /opt/docker-init
COPY conf/livy.conf /opt/${APACHE}livy-$LIVY_VERSION-incubating-bin/conf/livy.conf

# expose ports
EXPOSE 8998

# start from init folder
WORKDIR /opt/docker-init
ENTRYPOINT ["./entrypoint"]


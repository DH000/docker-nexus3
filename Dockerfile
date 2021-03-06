FROM registry.cn-hangzhou.aliyuncs.com/dthan/debian-jre8u151:1.8.151

# install nexus3
ADD https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.6.2-01-unix.tar.gz /usr/local/
RUN cd /usr/local && tar -zxvf nexus-3.6.2-01-unix.tar.gz && rm -f nexus-3.6.2-01-unix.tar.gz && mv nexus-3.6.2-01/ nexus3/

RUN useradd -r -u 200 -m -c "nexus role account" -d /usr/local/sonatype-work -s /bin/bash nexus

ENV NEXUS_HOME /usr/local/nexus3

USER nexus

VOLUME /usr/local/nexus3/etc
VOLUME /usr/local/sonatype-work
EXPOSE 8081
CMD ["./usr/local/nexus3/bin/nexus", "start"]

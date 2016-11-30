#docker-network-weathermap
#www.GitHub.com/jmhardison/docker-network-weathermap

FROM ubuntu:16.04

MAINTAINER Jonathan Hardison <jmh@jonathanhardison.com>

#VOLUMES
#VOLUME ["/var/something"]

#Expose used ports
#EXPOSE 80

#ENV
ENV DEBIAN_FRONTEND noninteractive

#ADD 'latest' release.
ADD https://github.com/howardjones/network-weathermap/releases/download/version-0.98/php-weathermap-0.98.zip /opt/php-weathermap.zip

#RUN
RUN apt-get update && apt-get install -y php7.0-cli unzip imagemagick rrdtool xsltproc php-pear php-gd && \
    #Extract
    unzip /opt/php-weathermap.zip -d /opt && \
    rm -rf /opt/php-weathermap.zip && \
    #Remove components
    apt-get remove -y unzip && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y && \
    apt-get clean

WORKDIR /opt/weathermap

#Add entrypoint file
ADD docker-entrypoint.sh /docker-entrypoint.sh
#Enable execution one entrypoint
RUN chmod +x /docker-entrypoint.sh
#Set Entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
#execute entrypoint with command.
CMD



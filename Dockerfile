#docker-network-weathermap
#www.GitHub.com/jmhardison/docker-network-weathermap

FROM ubuntu:16.04

MAINTAINER Jonathan Hardison <jmh@jonathanhardison.com>

#VOLUMES
#VOLUME ["/var/something"]

#Expose used ports
EXPOSE 80

#ENV
ENV DEBIAN_FRONTEND noninteractive

#RUN
RUN apt-get update && apt-get install -y php7.0-cli unzip

#ADD 'latest' release.
ADD https://github.com/howardjones/network-weathermap/releases/download/version-0.98/php-weathermap-0.98.zip /opt/php-weathermap.zip

#Extract
RUN  unzip /opt/php-weathermap.zip -d /opt

RUN rm -rf /opt/php-weathermap.zip

#Remove components
RUN apt-get remove -y unzip



WORKDIR /opt/weathermap

#Add entrypoint file
ADD docker-entrypoint.sh /docker-entrypoint.sh
#Enable execution one entrypoint
RUN chmod +x /docker-entrypoint.sh
#Set Entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
#execute entrypoint with command.
CMD



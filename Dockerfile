FROM ubuntu:16.04
MAINTAINER Przemek Szalko <przemek@mobtitude.com>

ENV DEBIAN_FRONTEND noninteractive
RUN sudo apt-get update
RUN sudo apt-get install -y pptpd 
RUN sudo apt-get install -y iptables

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]

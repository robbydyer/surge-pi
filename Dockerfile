FROM raspbian/stretch

RUN apt-get update && \
    apt-get install -y \
      wiringpi \
      apache2 \
      php7.0 \
      php7.0-cgi \
      libapache2-mod-php7.0

ADD ./ /app/

RUN /app/install.sh

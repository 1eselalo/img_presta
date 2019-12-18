FROM debian

RUN apt update && apt -y upgrade
RUN apt install apache2 apache2-utils -y
RUN apt install mariadb-server mariadb-client -y
RUN apt install php7.3 libapache2-mod-php7.3 php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline -y
RUN a2enmod php7.3
RUN apt update && apt -y upgrade

RUN apt install unzip
COPY prestashop_1.7.6.2.zip /var/www/html
WORKDIR /var/www/html
RUN unzip prestashop_1.7.6.2.zip
RUN mkdir /home/prestashop
COPY readme.txt /home/prestashop
COPY set_parameters.php /home/prestashop
WORKDIR /home/prestashop
EXPOSE 3306
EXPOSE 80

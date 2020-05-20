FROM php:7.2-apache
RUN apt update && apt -y install vim git && apt clean
#COPY CU-HWS/ /var/www/html/
#WORKDIR /var/www/html
RUN git clone https://github.com/ktrue/CU-HWS /var/www/html
COPY settings1.php /var/www/html/
RUN chmod 777      /var/www/html/settings1.php && \
    chmod -R 777   /var/www/html/jsondata 

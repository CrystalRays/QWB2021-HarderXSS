FROM ubuntu:18.04

# dir
RUN mkdir -p /home/ctf
WORKDIR /home/ctf

# install pkgs
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list\
	&& apt-get update && apt-get upgrade -y \
	&& apt-get install -y man ca-certificates php php-xml php-mysqli apache2 libapache2-mod-php mariadb-server mariadb-client curl wget fonts-liberation
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs chromium-browser
RUN curl -o chrome.deb 'https://www.slimjetbrowser.com/chrome/files/86.0.4240.75/google-chrome-stable_current_amd64.deb' 
RUN dpkg -i chrome.deb

# release
COPY * ./
RUN rm -rf /var/www/* \
	&& tar -zxvf www.tar.gz -C /var/www >/dev/null\
	&& tar -zxvf sites-enabled.tar.gz -C /etc/apache2/sites-enabled \
	&& cp  php.ini /etc/php/7.2/apache2/ \
	&& tar -zxvf ca.tar.gz -C /home/ctf/ >/dev/null\
	&& cp /home/ctf/ca/demoCA/cacert.pem /usr/local/share/ca-certificates/cacert.crt \
	&& update-ca-certificates  \
	&& service mysql start && mysql<sql.sql \
	&& chown www-data:root -R /var/www && chmod -R 570 /var/www && chmod -R 770 /var/www/html/upload  \
	&& a2enmod ssl && chmod -R 770 /var/www/visitor/log \
	&& rm -r *.* Docker*


# hosts
RUN echo "echo \$1 >/var/www/visitor/flag\nservice dbus start \n service mysql start \n service apache2 start \n google-chrome --headless --disable-gpu --remote-debugging-port=9222 --no-sandbox –-user-data-dir=/tmp --crash-dumps-dir=/tmp --ignore-certificate-errors" > /home/ctf/init.sh

# set
USER root
MAINTAINER cubestone
EXPOSE 80 443
ENTRYPOINT ["bash","/home/ctf/init.sh"]
CMD ['flag{demo}']

FROM debian:buster

RUN		apt-get update -y	\
	&&	apt-get upgrade -y	\
	&&	apt-get install -y nginx wget

COPY 	./conf/ .
COPY 	./tools/ .

RUN		mv ./nginx.conf /etc/nginx/nginx.conf					\
	&&	mv ./site.conf /etc/nginx/sites-available/site.conf		\
	&&	ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf

RUN		sh ./ssl.sh

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
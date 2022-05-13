# !/bin/bash
openssl req -x509 -nodes -days 1 -newkey rsa:2048					\
		-subj "/C=FR/ST=FRANCE/L=LYON/O=INCEPTION/CN=kbarbry.42.fr"	\
		-keyout etc/ssl/private/nginx-cert.key						\
		-out etc/ssl/certs/nginx-cert.crt
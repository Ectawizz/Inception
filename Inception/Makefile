BBLU 		=	\033[1;34m
BGREEN		=	\033[1;32m
BRED		=	\033[1;31m
BLU 		=	\033[0;34m
MGT			=	\033[0;35m
LMGT		=	\033[0;95m
LBLU 		=	\033[0;96m
GRN 		=	\033[0;32m
RED 		=	\033[0;31m
GRY 		=	\033[0;90m
RST 		=	\033[0m

all: print_header
	cp ./srcs/.env ./srcs/requirements/mariadb/conf/
	cp ./srcs/.env ./srcs/requirements/wordpress/conf/
	docker-compose -f ./srcs/docker-compose.yml up -d --remove-orphans
	rm ./srcs/requirements/mariadb/conf/.env
	rm ./srcs/requirements/wordpress/conf/.env
.PHONY: all

print_header:
	echo "\e[1;1H\e[2J"
	echo "            ${GRY}=====================================================${RST}             \n"
	echo "${LBLU}██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗██╗${LMGT} ██████╗ ██████╗ ${LBLU}███╗   ██╗${RST}"
	echo "${LBLU}██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║${LMGT}██╔═══████╔═══██╗${LBLU}████╗  ██║${RST}"
	echo "${LBLU}██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ██║${LMGT}██║   ████║   ██║${LBLU}██╔██╗ ██║${RST}"
	echo "${LBLU}██║██║╚██╗██║██║     ██╔══╝  ██╔═══╝    ██║   ██║${LMGT}██║   ████║   ██║${LBLU}██║╚██╗██║${RST}"
	echo "${LBLU}██║██║ ╚████║╚██████╗███████╗██║        ██║   ██║${LMGT}╚██████╔╝██████╔╝${LBLU}██║ ╚████║${RST}"
	echo "${LBLU}╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝        ╚═╝   ╚═╝${LMGT} ╚═════╝ ╚═════╝ ${LBLU}╚═╝  ╚═══╝${RST}\n"
	echo "            ${GRY}===============>${RST} By ${LMGT}Kbarbry${RST} ft. ${LMGT}Remi${RST} ${GRY}<===============${RST}\n"

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	docker rmi -f srcs_mariadb
	docker rmi -f srcs_wordpress
	docker rmi -f srcs_nginx
.PHONY: clean

logs:
	docker-compose -f ./srcs/docker-compose.yml logs
.PHONY: log

re : clean all
.PHONY: re

fclean:	clean
	sudo rm -rf /home/kbarbry/data/wordpress
	sudo rm -rf /home/kbarbry/data/mariadb
	mkdir /home/kbarbry/data/wordpress
	mkdir /home/kbarbry/data/mariadb
	docker system prune --force --all
.PHONY: fclean

.SILENT:
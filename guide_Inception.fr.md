Bienvenue dans le guide pour bien débuter un Inception.

Ce guide a pour but de rassembler le maximum d'informations sur ce projet pour en avoir une vision la plus globale
possible. La moindre précision à apporter est le bienvenue, mes maigres recherches ne sont pas évidemment pas
suffisantes (surtout pour ceux voulant faire les bonus).

- Pour commencer qu'est ce qu'un docker ?
Un docker est un outil de conteneurisation, il permet de créer un processus prennant le rôle d'une machine
virtuelle bien plus légère et plus modulable.

- Quel est l'utilité d'un docker ? Pourquoi ne pas se servir d'une machine virtuelle classique ?
Chaque docker va avoir son propre système d'exploitation. Et va prendre la forme d'un processus. Il ne nécessite
donc pas l'installation lourde d'une VM séparant les ressources de la machine, tandis qu'ici un docker va
simplement les exploiter comme un programme (ou presque).

- Qu'est ce qu'un docker-compose ?
Un docker-compose est tout simplement un gestionnaire de Docker. Il va orchestrer et coordonner chaque docker.
Ici on nous demande de faire 3 docker, le docker-compose sera donc divisé en trois partie pour chacun des 3 docker. 
Docker-compose permet également la mise en place d'un network, pour faire communiquer les docker entre eux de façon 
sécurisé. Ainsi que la mise en place de volumes, qui sont des espaces de stockage externe aux docker, permettant de 
sauvegarder des informations même lorsque l'on ferme ces docker (On est ici face à des processus, donc les données ne
sont pas sauvegardés lorsque l'on ferme un docker, d'ou l'utilite des volumes).

- Comment s'organise l'arborescence de ce projet ?
Comme ceci:

├─ Makefile
└─ srcs
   ├─ .env
   ├─ docker-compose.yml
   └─ requirement
      └─ mariadb
         ├─ Dockerfile
         └─ conf
            └─ ...
         └─ tools
            └─ ...
      └─ nginx
         ├─ Dockerfile
         └─ conf
            └─ ...
         └─ tools
            └─ ...
      └─ wordpress
         ├─ Dockerfile
         └─ conf
            └─ ...
         └─ tools
            └─ ...

On vous demandera pendant la soutenance l'intérêt de cette arborescence, qui est évidemment la separation des trois 
services dans trois dossiers différents, ainsi que le Makefile à la racine permettant juste de make, et de clean sans
entrer dans toute l'arborescence.

- Que dire sur cette arborescence ?
Pour chaque service (docker) un dossier est présent dans l'arborescence. Chacun de ces dossiers est composé d'un 
Dockerfile, c'est la base de tout docker. On reviendra plus en détails sur comment se compose un Dockerfile plus tard.
Il y a également la présence de deux dossiers, un dossier conf qui contiendra l'ensemble des fichiers de configuration
du service en question (par exemple pour Wordpress on a besoin d'un fichier .php pour son bon fonctionnement, c'est ici
qu'il sera stocké avant d'être déplacé au bon endroit.) Il y a également un dossier tools qui contiendra les fichiers
de code bash lorsque c'est nécessaire.

---- MAKEFILE ----
Le Makefile est relativement simple. La règle all est simplement composé de la commande
docker-compose -f ./srcs/docker-compose.yml up -d --remove-orphans
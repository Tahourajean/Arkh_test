# Arkh_test
#Étape 1


j'ai créé un petit fichier de test pour vérifier si ma fonction est bien exécutée. laissez s'exécuter sur la première console

generator-server/serveur.py
et testez le code dans un autre terminal

python code_solution.py " (((())))) ((( "
python code_solution.py 

# Étape 2
Je crée un Dockerfile , ce dockerfile construira l'image docker pour encapsuler la partie solveur.

DE Python: 3.8
 AJOUTER my_solution.py.
AJOUTER checker.py.
ENV RUN_IN_DOCKER Oui
 COPY ./requirements.txt /app/requirements.txt
 RUN pip install -r /app/requirements.txt
 ENTRYPOINT [ "python3" , "./my_solution.py" ]
La var "RUN_IN_DOCKER" m'a permis de vérifier si le code s'exécute dans le docker (container) ou dans le vrai ordinateur, afin de choisir le

bonne adresse. ("localhost: 5000" dans un ordinateur réel ou "server: 5000" dans le conteneur)

J'ai créé un autre Dockerfile pour créer l'image de la partie serveur.

Pour tester la my_solution, essayez la commande suivante depuis la racine du projet.

docker build -t solveur . 
Solveur d'exécution de docker " [({})] "
Pour vérifier le serveur dans le conteneur, vous devez vous déplacer dans le dossier générateur-serveur et exécuter la ligne suivante

serveur docker build -t . 
serveur d'exécution docker
En bonus :-), j'ai réalisé un fichier Docker-compose pour lancer plusieurs conteneurs (server_web et solveur)

docker-composer

Étape 3
Utilisation d'un CI pour créer une publication de votre image Docker. J'utilise Github Action.

J'ai créé des secrets github avec les informations d'identification du hub docker.Je crée un événement sur demande push et pull.

Cet événement testera le code et extraira l'image docker sur le hub docker

Étape 4
Explication de la partie automatisation Ansible
Tout d'abord, j'ai installé Vagrant et le plugin supplémentaire vagrant-disksize

Je crée une clé pub sur mon propre ordinateur afin de me connecter facilement à la VM (ubuntu)
J'ai lancé la VM ubuntu sur vagrant avec la commande suivante:
vagabonder
Pour se connecter au Vm:
vagabond ssh
afin d'automatiser le processus d'installation de mon propre ordinateur vers la VM, j'ai suivi les étapes suivantes.

L'inventaire du fichier contient l'adresse des différents hôtes de la solution (dans mon cas l'IP de la VM ou l'IP de mon serveur distant).
Le fichier playbook contient la liste des exécutions à faire pour installer l'outil docker, extraire mon image et l'exécuter avec l'exemple de texte à vérifier.
depuis mon propre ordinateur, j'ai lancé avec la commande suivante:
ansible-playbook playbook.yml -i inventaire.yml --user vagrant 
--user vagrant car l'utilisateur par défaut de la VM est vagrant dans mon cas.

Je crée également un AWS EC2 pour déployer la solution. Pour le tester, j'ai ajouté la clé timesaver.pem dans le projet, vous pouvez l'exécuter. Je vais supprimer le serveur dans une semaine. (Donc, si vous vérifiez après une semaine, le serveur sera inaccessible)
ansible-playbook playbook.yml -i inventaire.yml --user ubuntu --key-file timesaver.pem
Pour vérifier avec ma VM distante. Accédez au dossier "ansible" du projet et exécutez la commande précédente.
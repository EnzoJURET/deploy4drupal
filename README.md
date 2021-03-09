# Deploy4drupal
(scripts de création et de déploiement de sites Drupal)

## Version du Projet
version : 1.1 stable

## Configuration de test

Cette configuration regroupe toutes les versions des différents logiciels d'environnement du projet [Version 1.1_stable] :

| Nom du logiciel      	| Version |
| -------------------  	| ---------------------- |
| **WampServer**	| 3.2.0 |
| **Composer**	| 1.10.15 |
| **Git** | 2.21.0.windows.1 |
| **Drush** | 10.3.5 |

Configuration interne à WampServer :

| Nom de l'outil      	| Version |
| -------------------  	| ---------------------- |
| **phpMyAdmin**	| 4.9.2 |
| **php**	| 7.4.0 |
| **MariaDB** | 10.4.10 |

Il est préférable que vous aillez la même configuration, afin que les scripts fonctionnent au mieux.


## Comment installer drupal4deploy ?

Il vous suffit pour cela de cloner ce répertoire sur votre local avec la commande : ``` git clone http://gitlab.sarthe.fr:8181/enzo.juret/deploy4drupal ```

## Comment utiliser les scripts ?

Pour cela, vous avez deux options selon votre système d'exploitation :

- Windows : Entrer dans le répertoire du projet après l'avoir cloné, puis double-cliquer sur les scripts pour les exécuter.
- Linux : Entrer dans le répertoire du projet avec la commande ``` cd drupal4deploy ``` à l'endroit ou vous l'avez cloné, puis entrer le nom du script qui vous intéresse, normalement celui ci devrait s'exécuter (Exemple de commande : ``` create ``` ou ``` deploy ```)

## Détails des scripts

### Script : create.bat
Ce script vous permet de créer un site drupal dans sa dernière version 8 ou 9 traduit en français, mais également de le relier à un logiciel de gestion de version qui est git.

Lorsque vous exécutez ce script, vous devez saisir plusieurs valeurs :

| Demande de saisi     	| Obligatoire ou non ? | Description | 
| -------------------  	| ---------------------- | ---------------------- |
| **Version du site**	| ✓ | La version du site correspond à la version de drupal que vous souhaitez installer |
| **Chemin d'accès vers l'exécutable mysql**	| ✓ | Ce chemin correspond au chemin absolu interne à votre système permettant d'accéder à l'exécutable mysql, celui permettra au script d'injecter des requêtes sql dans votre base de données correspondante (par exemple si vous utilisez WampServer, ce fichier se trouve à ce chemin ci ``` [Chemin vers votre wamp]\wamp64\bin\[Nom de la base de données que vous utilisez]\[Version de la base de données]\bin ```, exemple concret : ``` C:\wamp64\bin\mariadb\mariadb10.4.10\bin ```)|
| **Répertoire d'installation** | ✓ | Ce chemin correspond au chemin absolu ou vous souhaitez installer votre site (Si vous utilisez WampServer il est préférable que le chemin soit : ``` [Chemin vers votre wamp]/wamp64/www ```) |
| **Nom de votre dossier drupal** | ✓ | Nom qui va être attribué au répertoire de votre site |
| **Nom de votre base de données** | ✓ | Nom qui va être attribué à la base de données de votre site |
| **Identifiant de l'utilisateur de la base de données** | ✓ | Nom de l'utilisateur qui a accès à votre base de données (cela est facilement paramétrable en passant dans phpMyAdmin, exemple fréquent : ``` root ```) |
| **Mot de passe de l'utilisateur de la base de données** |  | Mot de passe permettant à l'utilisateur de la base de données d'accéder aux données |
| **Identifiant de l'administrateur du site** | ✓ | Identifiant attribué à l'utilisateur dis administrateur de votre site, celui-ci aura tous les droits, ainsi lors de votre première arrivée sur votre site, vous pourrez utiliser cet identifiant pour vous connecter |
| **Mot de passe de l'administrateur du site** | ✓ | Mot de passe attribué à l'administrateur de votre site, faites bien attention à mettre un mot de passe assez conséquent |
| **Slogan de votre site** |  | Le slogan correspond au libellé qui se retrouvera sous le titre de votre site en page d'accueil |
| **E-mail de connexion à un répertoire distant git** | ✓ | Cette e-mail correspond à l'e-mail vous permettant de vous connecter à votre service de répertoire distant git, celui-ci servira d'identifiant de connexion pour le script, dans le cadre du Conseil département de la Sarthe, cette e-mail correspond à l'e-mail de connexion @sarthe.fr |
| **Lien du répertoire distant** | ✓ | C'est le lien vers votre répertoire distant git, que vous devez créer au préalable de l'exécution du ce script (exemple de lien : ``` http://gitlab.sarthe.fr:8181/enzo.juret/deploy4drupal ```)|

À la fin du traitement de ce script le site devrait s'ouvrir tout seul dans votre navigateur par défaut.

### Script : deploy.bat
Ce script vous permet de déployer un site existant sur votre machine en local. Pour cela vous devrez possédez plusieurs sources :
- Lien vers le répertoire distant git du site.
- Dump de la base de données du site correspondant à la version du site.

Lorsque vous exécutez ce script vous devez saisir plusieurs valeurs :

| Demande de saisi     	| Obligatoire ou non ? | Description | 
| -------------------  	| ---------------------- | ---------------------- |
| **Chemin d'accès vers l'exécutable mysql**	| ✓ | Ce chemin correspond au chemin absolu interne à votre système permettant d'accéder à l'exécutable mysql, celui permettra au script d'injecter des requêtes sql dans votre base de données correspondante (par exemple si vous utilisez WampServer, ce fichier se trouve à ce chemin ci ``` [Chemin vers votre wamp]\wamp64\bin\[Nom de la base de données que vous utilisez]\[Version de la base de données]\bin ```, exemple concret : ``` C:\wamp64\bin\mariadb\mariadb10.4.10\bin ```)|
| **Répertoire d'installation** | ✓ | Ce chemin correspond au chemin absolu ou vous souhaitez installer votre site (Si vous utilisez WampServer il est préférable que le chemin soit : ``` [Chemin vers votre wamp]/wamp64/www ```) |
| **Lien du répertoire distant** | ✓ | C'est le lien vers le répertoire distant git du site que vous souhaitez déployer, (exemple de lien : ``` http://gitlab.sarthe.fr:8181/enzo.juret/deploy4drupal ```)|
| **Nom de votre base de données** | ✓ | Nom de la base de données du site que vous souhaitez installer |
| **Identifiant de l'utilisateur de la base de données** | ✓ | Nom de l'utilisateur qui a accès à votre base de données |
| **Chemin vers le fichier de script sql à importer** | ✓ | Chemin absolu permettant d'accéder au script / dump sql de la base de données du site que vous souhaitez déployer |

À la fin du traitement de ce script le site devrait s'ouvrir tout seul dans votre navigateur par défaut.

## Évolution futur ?
Le projet est actuellement dans sa version 1.1 stable, il est bien sûr amené à évoluer, pour cela, plusieurs pistes ont déjà été traversés :
- Possibilité d'insérer le thème drupal du Conseil département de la Sarthe.
- Alléger le script afin qu'il s'exécute plus rapidement.

## Information sur le fichier README
Mis à jour le 14/01/2021

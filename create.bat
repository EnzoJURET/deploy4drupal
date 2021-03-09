REM -------------------------------------------
REM Fonctionnalités : Création d'un site drupal
REM Versions compatibles : 8.x et 9.x
REM -------------------------------------------

@echo off
cls

echo             ____             _               _  _   
echo            ^|  _ \  ___ _ __ ^| ^| ___  _   _  ^| ^|^| ^|  
echo            ^| ^| ^| ^|/ _ \ '_ \^| ^|/ _ \^| ^| ^| ^| ^| ^|^| ^|_ 
echo            ^| ^|_^| ^|  __/ ^|_) ^| ^| (_) ^| ^|_^| ^| ^|__   _^|
echo            ^|____/ \___^| .__/^|_^|\___/ \__, ^|    ^|_^|  
echo                       ^|_^|            ^|___/                  
echo           88                                               88  
echo           88                                               88  
echo           88                                               88  
echo   ,adPPYb,88 8b,dPPYba, 88       88 8b,dPPYba,  ,adPPYYba, 88
echo  a8"    `Y88 88P'   "Y8 88       88 88P'    "8a "       Y8 88
echo  8b       88 88         88       88 88       d8 ,adPPPPP88 88
echo  "8a,   ,d88 88         "8a,   ,a88 88b,   ,a8  88,    ,88 88 
echo   `"8bbdP"Y8 88          `"YbbdP'Y8 88`YbbdP"'  `"8bbdP"Y8 88  
echo                                     88                         
echo                                     88                         
echo.
echo ----------------------------------------------------------------
echo.
echo    ______  _______     ________       _     _________  ________  
echo  .' ___  ^|^|_   __ \   ^|_   __  ^|     / \   ^|  _   _  ^|^|_   __  ^| 
echo / .'   \_^|  ^| ^|__) ^|    ^| ^|_ \_^|    / _ \  ^|_/ ^| ^| \_^|  ^| ^|_ \_^| 
echo ^| ^|         ^|  __ /     ^|  _^| _    / ___ \     ^| ^|      ^|  _^| _  
echo \ `.___.'\ _^| ^|  \ \_  _^| ^|__/ ^| _/ /   \ \_  _^| ^|_    _^| ^|__/ ^| 
echo  `.____ .'^|____^| ^|___^|^|________^|^|____^| ^|____^|^|_____^|  ^|________^|                                                                    
echo.                                                                 
echo.

REM ------------------------- Version de drupal à installer 
goto versionSaisi
:versionTest1
	echo.
	echo Veuillez saisir une valeur correcte (8/9) ! 
:versionSaisi
	set VAR_version=
	set /p VAR_version= Drupal 8 ou 9 ? : 
	if "%VAR_version%"=="" (goto versionTest1) else (goto versionTest2)
:versionTest2
	if "%VAR_version%"=="8" (goto versionOk) else (goto versionTest3)	
:versionTest3
	if "%VAR_version%"=="9" (goto versionOk) else (goto versionTest1)
:versionOk


echo ------------------------ Prealable a l'installation de drupal %VAR_version%
	echo.
	REM ------------------------- Chemin vers le mysql le l'hébergeur
	goto mysqlSaisi
	:mysqlTest1
		echo.
		echo Veuillez saisir une valeur !
	:mysqlSaisi
		set VAR_mysql=
		echo Veuillez indiquer le chemin d'acces a l'executable mysql de votre hebergeur (C:\wamp64\bin\mariadb\mariadb10.4.10\bin)
		set /p VAR_mysql= Entrer un chemin : 
		if "%VAR_mysql%"=="" (goto mysqlTest1) else (goto mysqlOk)
	:mysqlOk
	echo.	


	REM ------------------------- Chemin vers le répertoire ou l'on souhaite installer drupal
	goto emplacementSaisi
	:emplacementTest1
		echo.
		echo Veuillez saisir une valeur !
	:emplacementSaisi
		set VAR_emplacement=
		set /p VAR_emplacement= Ou souhaitez vous installer votre drupal Ex: D:\laragon\www : 
		if "%VAR_emplacement%"=="" (goto emplacementTest1) else (goto emplacementOk)
	:emplacementOk
	echo.


	REM ------------------------- Nom du repertoire drupal
	goto nomDossierSaisi
	:nomDossierTest1
		echo.
		echo Veuillez saisir une valeur !
	:nomDossierSaisi
		set VAR_nomDossier=
		set /p VAR_nomDossier= Quel est le nom de votre dossier drupal : 
		if "%VAR_nomDossier%"=="" (goto nomDossierTest1) else (goto nomDossierOk)
	:nomDossierOk
	echo. 


	REM ------------------------- Nom de la base de données
	goto nomBddSaisi
	:nomBddTest1
		echo.
		echo Veuillez saisir une valeur !
	:nomBddSaisi
		set VAR_nomBdd=
		set /p VAR_nomBdd= Nom de votre base de donnees : 
		if "%VAR_nomBdd%"=="" (goto nomBddTest1) else (goto nomBddOk)
	:nomBddOk
	echo.


	REM ------------------------- Identifiant de l'utilisateur de la base de données
	goto userBddSaisi
	:userBddTest1
		echo.
		echo Veuillez saisir une valeur !
	:userBddSaisi
		set VAR_userBdd=
		set /p VAR_userBdd= Identifiant de l'utilisateur de la base de donnees : 
		if "%VAR_userBdd%"=="" (goto userBddTest1) else (goto userBddOk)
	:userBddOk
	echo.


	REM ------------------------- Mot de passe de l'utilisateur de la base de données
	set /p VAR_mdpBdd= Mot de passe de l'utilisateur de la base de donnees : 
	echo.


	REM ------------------------- Identifiant du compte administrateur du site drupal installé
	goto idDrupalSaisi
	:idDrupalTest1
		echo.
		echo Veuillez saisir une valeur !
	:idDrupalSaisi
		set VAR_idDrupal=
		set /p VAR_idDrupal= Identifiant de l'administrateur du site : 
		if "%VAR_idDrupal%"=="" (goto idDrupalTest1) else (goto idDrupalOk)
	:idDrupalOk
	echo.


	REM ------------------------- Mot de passe du compte administrateur du site drupal installé
	goto mdpDrupalSaisi
	:mdpDrupalTest1
		echo.
		echo Veuillez saisir une valeur !
	:mdpDrupalSaisi
		set VAR_mdpDrupal=
		set /p VAR_mdpDrupal= Mot de passe de l'administrateur du site : 
		if "%VAR_mdpDrupal%"=="" (goto mdpDrupalTest1) else (goto mdpDrupalOk)
	:mdpDrupalOk
	echo.


	REM echo ------------------------- Paramètres de base du site :
	REM REM ------------------------- Slogan du site drupal installé
	REM set /p VAR_slogan= Slogan pour le site : 
	REM echo.

	REM REM ------------------------- Nom du site drupal installé
	REM set /p Var_siteNom= Nom du site : 
	REM echo.

	REM ------------------------- E-mail de connexion au serveur GitLab interne à la Direction des systèmes d'informations
	goto gitIDSaisi
	:gitIDTest1
		echo.
		echo Veuillez saisir une valeur !
	:gitIDSaisi
		set VAR_gitID=
		set /p VAR_gitID= E-mail de connexion GitLab : 
		if "%VAR_gitID%"=="" (goto gitIDTest1) else (goto gitIDOk)
	:gitIDOk
	echo.


	REM ------------------------- Lien du répertoire distant GitLab
	goto gitlabSaisi
	:gitlabTest1
		echo.
		echo Veuillez saisir une valeur !
	:gitlabSaisi
		set VAR_gitlab=
		set /p VAR_gitlab= Lien du répertoire distant GitLab : 
		if "%VAR_gitlab%"=="" (goto gitlabTest1) else (goto gitlabOk)
	:gitlabOk
	echo.

echo ------------------------ Creation de la base de donnees
	call chmod -R 777 bdd.sql
	call sed -i -e "s/mabdd/%VAR_nomBdd%/g" bdd.sql
	call %VAR_mysql%\mysql.exe -u %VAR_userBdd% < bdd.sql
	call sed -i -e "s/%VAR_nomBdd%/mabdd/g" bdd.sql


echo ------------------------ Installation et Mise a jour des packages drupal
	call composer global require hirak/prestissimo
	echo.

echo ------------------------ Installation de l'arborescence Drupal %VAR_version%.x
	REM call composer create-project drupal/recommended-project:^^%VAR_version%.x %VAR_emplacement%/%VAR_nomDossier%
	call composer create-project drupal-composer/drupal-project:^^%VAR_version%.x-dev %VAR_emplacement%/%VAR_nomDossier% --no-interaction
	echo.

echo ------------------------ Preparation de l Initialisation de git
	cd %VAR_emplacement%/%VAR_nomDossier%
	mkdir files
	cd files
	mkdir private
	mkdir tmp
	cd %VAR_emplacement%/%VAR_nomDossier%/web/sites/default
	REM call chmod -R 444 settings.php
	echo if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {include $app_root . '/' . $site_path . '/settings.local.php';} >> settings.php
	echo $settings['file_temp_path'] = '../files/tmp'; >> settings.php
	echo $settings['file_private_path'] = '../files/private'; >> settings.php

echo -------------------------- Installation de Drupal %VAR_version%.x avec drush
	cd %VAR_emplacement%/%VAR_nomDossier%
	call composer require drush/drush
	call cp .env.example .env
	call drush si --db-url=mysql://%VAR_userBdd%:%VAR_mdpBdd%@localhost:3306/%VAR_nomBdd% --account-name=%VAR_idDrupal% --account-pass=%VAR_mdpDrupal% -y
	echo.

echo -------------------------- Traduction en francais en cours...
	echo ---- Activation des modules language et locale
	call drush en locale -y
	call drush language-add fr -y
	call drush config:set system.site default_langcode fr -y
	echo.

echo -------------------------- Optimisation de Composer 
	call composer require zaporylie/composer-drupal-optimizations:^1.1
	call composer require composer/installers
	call composer require cweagans/composer-patches
	call composer require zaporylie/composer-drupal-optimizations:^1.1 composer/installers cweagans/composer-patches
	echo.

echo -------------------------- Mise a jour de securite
	cd %VAR_emplacement%/%VAR_nomDossier%/web/sites/default
	call chmod -R 777 settings.php
	call rm settings.php
	cd /d %~dp0
	cp settings.php %VAR_emplacement%/%VAR_nomDossier%/web/sites/default/
	cd %VAR_emplacement%/%VAR_nomDossier%/web/sites/default
	
	REM -------------------------- Modification settings.php et creation du fichier de configuration d'accès à la base de données : settings.local.php
	REM echo $config['system.site']['slogan'] = '%VAR_slogan%'; >> settings.php
	REM echo $config['system.site']['name'] = '%Var_siteNom%'; >> settings.php
	call chmod -R 444 settings.php
	call touch settings.local.php
	echo ^<?php >> settings.local.php
	echo. >> settings.local.php
	echo $databases['default']['default'] = array ( >> settings.local.php
	echo   'database' =^> '%VAR_nomBdd%', >> settings.local.php
	echo   'username' =^> '%VAR_userBdd%', >> settings.local.php
	echo   'password' =^> '%VAR_mdpBdd%', >> settings.local.php
	echo   'prefix' =^> '', >> settings.local.php
	echo   'host' =^> 'localhost', >> settings.local.php
	echo   'port' =^> '3306', >> settings.local.php
	echo   'namespace' =^> 'Drupal\\Core\\Database\\Driver\\mysql', >> settings.local.php
	echo   'driver' =^> 'mysql', >> settings.local.php
	echo ); >> settings.local.php

	cd %VAR_emplacement%/%VAR_nomDossier%
	call drush cr
	call drush status
	echo.

echo -------------------------- Configuration des répertoires interne au projet
	cd %VAR_emplacement%/%VAR_nomDossier%/web/modules/
	call mkdir contrib
	call mkdir custom
	cd ../themes/
	call mkdir contrib
	call mkdir custom

echo -------------------------- Initialisation de git
	cd %VAR_emplacement%/%VAR_nomDossier%
	call git init
	call git remote add origin %VAR_gitlab%
	call git add README.md
	call git commit -m "Initialisation du répertoire distant | Ajout du fichier README.md"
	call git push --set-upstream origin master
	cd %VAR_emplacement%/%VAR_nomDossier%/config
	mkdir dev
	mkdir preprod
	mkdir prod
	call touch preprod/.gitkeep
	call touch prod/.gitkeep
	call touch .gitignore
	echo /preprod >> .gitignore
	echo /prod >> .gitignore
	cd %VAR_emplacement%/%VAR_nomDossier%
	mkdir db
	cd %VAR_emplacement%/%VAR_nomDossier%/db
	call touch .gitignore
	echo *.sql >> .gitignore
	echo *.sql.gz >> .gitignore
	cd %VAR_emplacement%/%VAR_nomDossier%/drush
	call cp drush.yml example.drush.yml
	call touch .gitignore
	echo drush.yml >> .gitignore
	cd %VAR_emplacement%/%VAR_nomDossier%/files
	call touch .gitignore
	echo /private >> .gitignore
	echo /tmp >> .gitignore
	call git add --force private/.htaccess
	call git add --force tmp/.htaccess
	cd %VAR_emplacement%/%VAR_nomDossier%/web/sites/default
	call touch dev.settings.local.php

	REM Cette commande permet de supprimer la ligne ou est inscrit settings.php dans le fichier .gitignore, etant donné que l'on souhaite le versionner !
	echo --- AVANT LA COMMANDE
	cd %VAR_emplacement%/%VAR_nomDossier%
	call sed -i '11d' .gitignore
	
	cd %VAR_emplacement%/%VAR_nomDossier%
	call git add .
	call git commit -m "Initialisation du projet"
	call git push

echo -------------------------- Fermeture du script
	cd %VAR_emplacement%/%VAR_nomDossier%
	start http://localhost/%VAR_nomDossier%/web
	set VAR_version=
	set VAR_mysql=
	set VAR_emplacement=
	set VAR_nomDossier=
	set VAR_nomBdd=
	set VAR_userBdd=
	set VAR_mdpBdd=
	set VAR_idDrupal=
	set VAR_mdpDrupal=
	set VAR_slogan=
	set VAR_gitID=

echo ============================= Fin de l'installation du site drupal %VAR_version% : %VAR_nomDossier%
pause
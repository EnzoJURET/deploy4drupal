REM -------------------------------------------------------
REM Fonctionnalités : Déploiement d'un site drupal existant
REM Versions compatibles : 8.x et 9.x
REM -------------------------------------------------------

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
echo --------------------------------------------------------------
echo.
echo    ______   ________  _______  _____       ___   ____  ____  
echo   ^|_   _ `.^|_   __  ^|^|_   __ \^|_   _^|    .'   `.^|_  _^|^|_  _^| 
echo     ^| ^| `. \ ^| ^|_ \_^|  ^| ^|__) ^| ^| ^|     /  .-.  \ \ \  / /   
echo     ^| ^|  ^| ^| ^|  _^| _   ^|  ___/  ^| ^|   _ ^| ^|   ^| ^|  \ \/ /    
echo    _^| ^|_.' /_^| ^|__/ ^| _^| ^|_    _^| ^|__/ ^|\  `-'  /  _^|  ^|_    
echo   ^|______.'^|________^|^|_____^|  ^|________^| `.___.'  ^|______^| 
echo.                                                                 
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

REM ------------------------- Chemin vers le répertoire où l'on souhaite installer drupal
	goto emplacementSaisi
	:emplacementTest1
		echo.
		echo Veuillez saisir une valeur !
	:emplacementSaisi
		set VAR_emplacement=
		set /p VAR_emplacement= Ou souhaitez vous installer le drupal existant ? Ex: C:/wamp64/www : 
		if "%VAR_emplacement%"=="" (goto emplacementTest1) else (goto emplacementOk)
	:emplacementOk
	echo.

REM ------------------------- Lien du répertoire distant GitLab
	goto gitlabSaisi
	:gitlabTest1
		echo.
		echo Veuillez saisir une valeur !
	:gitlabSaisi
		set VAR_gitlab=
		set /p VAR_gitlab= Veuillez indiquer le lien du repertoire distant git : 
		if "%VAR_gitlab%"=="" (goto gitlabTest1) else (goto gitlabOk)
	:gitlabOk
	echo.

REM ------------------------- Nom du repertoire drupal
	goto nomDossierSaisi
	:nomDossierTest1
		echo.
		echo Veuillez saisir une valeur !
	:nomDossierSaisi
		set VAR_nomDossier=
		set /p VAR_nomDossier= Quel est le nom que vous souhaitez donner au dossier drupal : 
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

REM ------------------------- Chemin vers le script SQL
	goto cheminScriptSaisi
	:cheminScriptTest1
		echo.
		echo Veuillez saisir une valeur !
	:cheminScriptSaisi
		set Var_scriptSQL=
		set /p Var_scriptSQL= Chemin vers le fichier de script sql a importer : 
		if "%Var_scriptSQL%"=="" (goto cheminScriptTest1) else (goto cheminScriptOk)
	:cheminScriptOk
	echo.


echo ------------------------ Initialisation de la base de donnees
	call chmod -R 777 bdd.sql
	call sed -i -e "s/mabdd/%VAR_nomBdd%/g" bdd.sql
	call %VAR_mysql%\mysql.exe -u %VAR_userBdd% < bdd.sql
	call sed -i -e "s/%VAR_nomBdd%/mabdd/g" bdd.sql
	call mysql -u root  %VAR_nomBdd% < %Var_scriptSQL%


echo ----------------------- Installation du site %%d en local
	cd %VAR_emplacement%
	call git clone %VAR_gitlab%	%VAR_nomDossier%


cd %VAR_emplacement%/%VAR_nomDossier%/web/sites/default/
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
call composer install
call cp .env.example .env
call drush cr

start http://localhost/%VAR_nomDossier%/web

echo ----------------------- Fermeture du script
set VAR_mysql=
set VAR_emplacement=
set VAR_nomDossier=
set VAR_nomBdd=
set VAR_userBdd=
set VAR_mdpBdd=

echo ============================= Fin de l'installation du projet %VAR_nomDossier%
pause
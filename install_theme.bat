@echo off
cls


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

REM -------------------------- Mise en place des pré-requis d'installation du thème sarthe_theme
	cd %VAR_emplacement%/%VAR_nomDossier%
	REM ------------------------------------------ Importation du thème Bootstrap Barrio
		call composer require drupal/bootstrap_barrio
		call drush theme:enable bootstrap_barrio
		call drush config-set system.theme default bootstrap_barrio -y
		call drush theme:uninstall bartik
		call composer require drupal/bootstrap_library
		call drush en bootstrap_library -y
	REM ------------------------------------------ Importation de la librairie bootstrap
		cd %VAR_emplacement%/%VAR_nomDossier%/web
		call mkdir libraries
		cd %VAR_emplacement%/%VAR_nomDossier%/web/libraries
		call git clone https://github.com/twbs/bootstrap.git b1
		cd %VAR_emplacement%/%VAR_nomDossier%/web/libraries/b1
		call mv dist/ bootstrap
		cd mv %VAR_emplacement%/%VAR_nomDossier%/web/libraries/b1/bootstrap %VAR_emplacement%/%VAR_nomDossier%/web/libraries/
		cd %VAR_emplacement%/%VAR_nomDossier%/web/libraries/
		REM call rm -rf b1/
		call drush cr

cd %VAR_emplacement%/%VAR_nomDossier%
REM ------------------------------------------ Importation des modules nécessaire au bon fonctionnement du thème
		call composer require drupal/blazy
		call drush en blazy -y
		call drush en blazy_ui -y
		call composer require drupal/ds
		call drush en ds -y
		call drush en ds_extras -y
		call drush en ds_switch_view_mode -y
		call composer require drupal/fontawesome
		call drush en fontawesome -y
		call composer require drupal/slick
		call drush en slick -y
		call drush en slick_ui -y
		call composer require drupal/slick_views
		call drush en slick_views -y
		call composer require drupal/superfish
		call drush en superfish -y
		call composer require drupal/views_slideshow
		call drush en views_slideshow -y
		call drush en views_slideshow_cycle -y
		call composer require drupal/we_megamenu
		call drush en we_megamenu -y
		call drush en layout_builder -y
REM ---------------------------------------- Installation des bibliothèques nécessaires au bon fonctionnement
	cd /web/libraries
	call git clone https://github.com/dinbror/blazy.git
	call git clone https://github.com/kenwheeler/slick.git

REM ---------------------------------------- Fin du script
	cd %VAR_emplacement%/%VAR_nomDossier%
	call drush cr
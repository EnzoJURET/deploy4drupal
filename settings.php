<?php

$databases = [];

$settings['hash_salt'] = 'TGEcsEobs7YzM_lOhYrDKSxJ6tbGPBLRe-APeqOPEzvqijOplKH3lj6NklBeq1TFk-6SVRA3sA';

$settings['update_free_access'] = FALSE;

$settings['container_yamls'][] = $app_root . '/' . $site_path . '/services.yml';

$settings['file_scan_ignore_directories'] = [
  'node_modules',
  'bower_components',
];

$settings['entity_update_batch_size'] = 50;

$settings['entity_update_backup'] = TRUE;

$settings['migrate_node_migrate_type_classic'] = FALSE;

$settings['config_sync_directory'] = '../config/sync';
if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {include $app_root . '/' . $site_path . '/settings.local.php';}

$settings['file_temp_path'] = '../files/tmp'; 
$settings['file_private_path'] = '../files/private'; 

$databases['default']['default'] = array (
  'database' => '',
  'username' => '',
  'password' => '',
  'prefix' => '',
  'host' => '',
  'port' => '3306',
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
);

if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {
	include $app_root . '/' . $site_path . '/settings.local.php';
}
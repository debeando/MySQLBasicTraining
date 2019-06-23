<?php

// $dbuser='employees';
// $dbpass='employees';

$cfg['DefaultLang'] = 'en-utf-8';
$cfg['Lang'] = 'en-utf-8';
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

// $cfg['Servers'][0]['auth_type'] = 'config';
// $cfg['Servers'][0]['host'] = 'localhost';
$cfg['Servers'][0]['user'] = 'employees';
$cfg['Servers'][0]['password'] = 'employees';
$cfg['Servers'][0]['AllowNoPassword'] = true;
$cfg['Servers'][1]['pmadb'] = 'phpmyadmin';
$cfg['Servers'][1]['controluser'] = 'pma';
$cfg['Servers'][1]['controlpass'] = 'pmapass';
$cfg['Servers'][1]['bookmarktable'] = 'pma_bookmark';
$cfg['Servers'][1]['relation'] = 'pma_relation';
$cfg['Servers'][1]['userconfig'] = 'pma_userconfig';
$cfg['Servers'][1]['table_info'] = 'pma_table_info';
$cfg['Servers'][1]['column_info'] = 'pma_column_info';
$cfg['Servers'][1]['history'] = 'pma_history';
$cfg['Servers'][1]['recent'] = 'pma_recent';
$cfg['Servers'][1]['table_uiprefs'] = 'pma_table_uiprefs';
$cfg['Servers'][1]['tracking'] = 'pma_tracking';
$cfg['Servers'][1]['table_coords'] = 'pma_table_coords';
$cfg['Servers'][1]['pdf_pages'] = 'pma_pdf_pages';
$cfg['Servers'][1]['designer_coords'] = 'pma_designer_coords';

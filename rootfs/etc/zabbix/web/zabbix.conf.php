<?php
// Zabbix GUI configuration file
global $DB;
$DB["TYPE"]          = 'MYSQL';
$DB["SERVER"]   = '{{DB_HOST}}';
$DB["PORT"]          = '{{DB_PORT}}';
$DB["DATABASE"]   = 'zabbix';
$DB["USER"]    = '{{DB_USER}}';
$DB["PASSWORD"]   = '{{DB_PASS}}';
// SCHEMA is relevant only for IBM_DB2 database
$DB["SCHEMA"]   = '';
$ZBX_SERVER          = '{{ZABBIX_SERVER}}';
$ZBX_SERVER_PORT  = '{{ZABBIX_PORT}}';
$ZBX_SERVER_NAME  = '';
$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
?>
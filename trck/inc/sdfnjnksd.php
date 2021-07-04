<?
//error_reporting(E_ALL);
$server = 'localhost';
$dbuser = 'trckcxyz_crang';
$dbpass = '@molecula12';
$dbname = 'trckcxyz_manager';

$x = mysql_connect($server,$dbuser,$dbpass) or die(mysql_error());
mysql_select_db($dbname,$x);
mysql_query ('SET NAMES UTF8') or die(mysql_error());
?>
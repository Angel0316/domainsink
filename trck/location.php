<?php
// This code demonstrates how to lookup the country, region, city,
// postal code, latitude, and longitude by IP Address.
// It is designed to work with GeoIP/GeoLite City
// Note that you must download the New Format of GeoIP City (GEO-133).
// The old format (GEO-132) will not work.
include("inc/geoipcity.inc");
include("inc/geoipregionvars.php");
// uncomment for Shared Memory support
// geoip_load_shared_mem("/usr/local/share/GeoIP/GeoIPCity.dat");
// $gi = geoip_open("/usr/local/share/GeoIP/GeoIPCity.dat",GEOIP_SHARED_MEMORY);
$gi = geoip_open("inc/GeoIPCity.dat", GEOIP_STANDARD);
$giisp = geoip_open("inc/GeoIPISP.dat", GEOIP_STANDARD);


// get the ip

$ip = getenv('HTTP_CLIENT_IP')?:
getenv('HTTP_X_FORWARDED_FOR')?:
getenv('HTTP_X_FORWARDED')?:
getenv('HTTP_FORWARDED_FOR')?:
getenv('HTTP_FORWARDED')?:
getenv('REMOTE_ADDR');

$record = geoip_record_by_addr($gi, $ip);
$country = $record->country_code;
$region = $record->region;
//$region = $GEOIP_REGION_NAME[$record->country_code][$record->region];
$cityname = $record->city;
// print $record->postal_code . "\n";
// print $record->latitude . "\n";
// print $record->longitude . "\n";
// print $record->metro_code . "\n";
// print $record->area_code . "\n";
// print $record->continent_code . "\n";
$isp = geoip_org_by_addr($giisp, $ip);
geoip_close($gi);
geoip_close($giisp);
?>
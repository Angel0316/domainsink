<?php
$url="http://stackoverflow.com/";
$xml = simplexml_load_file('http://data.alexa.com/data?cli=10&dat=snbamz&url='.$url);
$rank=isset($xml->SD[1]->POPULARITY)?$xml->SD[1]->POPULARITY->attributes()->TEXT:0;
$web=(string)$xml->SD[0]->attributes()->HOST;
echo $web." has Alexa Rank ".$rank;
?>
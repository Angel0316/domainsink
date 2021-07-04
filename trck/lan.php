<?php
$a = $_GET['a'];
$landerid = $_GET['e'];
$trackingid = $_GET['t']; // get tracking id
$creativeid = $_GET['w']; // get creative id
$cid = $_GET['cid']; // get internal campaign id
$clk = $_GET['clk']; // get click id
$ext = $_GET['ext']; // get ext track
$cityname = $_GET['loc']; // get location
$siteid = $_GET['b'];
$placementid = $_GET['c'];
$nicheid = $_GET['f'];
$offerid = $_GET['i'];
$sourceid = $_GET['h'];
$browser = $_GET['browser'];
$trackcookie = $_COOKIE['r_c'];
$honeycookie = $_COOKIE['b_c'];
$fb = $_COOKIE['fb_c'];		$ref = $_SERVER['HTTP_REFERER'];		$parseurl = parse_url($ref);		$ref = $parseurl[ "host" ];
	if ( isset($honeycookie) || !isset($trackcookie)) {
	$gourl = "https://www.domainsink.com/trck/go.php?e=".$landerid."&cid=".$cid."&c=".$creativeid."&clk=".$clk."&t=".$trackingid."&ext=101010"; 
	}
	else if ( $ref == "facebook.com" || $ref == "l.facebook.com" || $ref== "hotoffer.space" || $ref == "www.facebook.com" || $ref == "m.facebook.com") {		$dbConnection = new PDO('mysql:dbname=trckcxyz_manager;host=localhost;charset=utf8', 'trckcxyz_crang', '@molecula12');		$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);		$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);		$stmt = $dbConnection->prepare("SELECT sale FROM c".$cid." WHERE id = :clickid");		$stmt->bindValue(':clickid', $clk);		$stmt->execute();		$stmt->setFetchMode(PDO::FETCH_ASSOC);		while ($row = $stmt->fetch()) {		$sale = $row['sale'];		}		$sale = $sale + 1;		$stmt = $dbConnection->prepare("UPDATE c".$cid." SET nicheid = :ref, sale= :sale WHERE id = :clickid");		$stmt->bindValue(':clickid', $clk);		$stmt->bindValue(':ref', $siteid);		$stmt->bindValue(':sale', $sale);		$stmt->execute();
	$gourl = "https://www.domainsink.com/trck/go.php?e=".$landerid."&cid=".$cid."&c=".$creativeid."&clk=".$clk."&t=".$trackingid."&ext=101011&ref=".$ref;
	}	else if ( $cid == "343" || $cid == "387" || $cid == "388") {	$gourl = "https://www.domainsink.com/trck/o.php?e=".$landerid."&cid=".$cid."&c=".$creativeid."&clk=".$clk."&t=".$trackingid."&ext=101011&ref=".$ref;	}
	else {
	$gourl = "https://www.domainsink.com/trck/go.php?e=".$landerid."&cid=".$cid."&c=".$creativeid."&clk=".$clk."&t=".$trackingid."&ext=101011";
	}
	if ( preg_match("/{/", $a) || preg_match("/%/", $a) ) {	$gourl = "http://www.asiandate.com/"; } // Multi
$log = "https://www.domainsink.com/trck/continue.php?e=".$landerid."&cid=".$cid."&c=".$creativeid."&clk=".$clk."&t=".$trackingid."&ext=".$_COOKIE['w_']."-".$_COOKIE['h_']; 
$in = "l/0.php";
include ($in);
?>
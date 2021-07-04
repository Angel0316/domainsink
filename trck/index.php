<?php
$dbConnection = new PDO('mysql:dbname=trckcxyz_manager;host=localhost;charset=utf8', 'trckcxyz_crang', '@molecula12');
$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

include('inc/mobile_detect.php');
include("inc/browser.php");
include("inc/getos.php");
include("inc/oscode.php");
include("inc/browsercode.php");
include("inc/codedevice.php");
include('location.php');

// detect os version

if ($user_os == "Android") {
$getheader = strstr($_SERVER['HTTP_USER_AGENT'], 'Android');

$extract = preg_match('/Android (\d+(?:\.\d+)+)[;)]/', $_SERVER['HTTP_USER_AGENT'], $matches);

$osversion = $matches[1];
}
else {
$osversion = preg_replace("/(.*) OS ([0-9]*)_(.*)/","$2", $_SERVER['HTTP_USER_AGENT']);
}


// vars
$utm = $_GET['utm_campaign']; // utm for easyads
$utmcontent = $_GET['utm_content']; // utm for easyads
$a = $_GET['a']; // banner
$b = $_GET['b']; // site
$c = $_GET['c']; // placement
$d = $_GET['d']; // external campaign id
$e = $_GET['e']; // lander
$f = $_GET['f']; // niche / category
$g = $_GET['g']; // keyword
$h = $_GET['h']; // source
$i = $_GET['i']; // offer
$reg = $_GET['reg']; // location
$j = $country; // country external
if ( $j == "") {
$j = $country; // country internal
}
$k = $_GET['k']; // os external
if ( $k == "") {
$k = $user_os; // os internal
}
$l = $_GET['l']; // os version
if ( $l == "") {
$l = $osversion; // os internal
}
$m = $_GET['m']; // browser external
if ( $m == "") {
$m = $browser; // browser internal
}
$n = $_GET['n']; // isp external
$o = $_GET['o']; // environment
$p = $_GET['p']; // phone brand/device id/ android ios id
$r = $_GET['r']; // phone model
$s = $_GET['s']; // banner size
$t = $device; // device type
$x = $_GET['x']; // bid
$y = $cityname; // city
if ( $reg == "") {
$z = $region; // region internal
} else { $z = $reg; } // region external
$v = $isp; // isp internal
$w = $_GET['w']; // creative
$ext = $_GET['ext']; // external track id
$cid = $_GET['cid']; // internal campaign id
$bid = $_GET['bid']; // bid id
$langid = locale_accept_from_http($_SERVER['HTTP_ACCEPT_LANGUAGE']); // detect browser language

if ($cid =="") {
$cid ="253";

}




// output lander for the reviewers
	
if (preg_match("/{/", $a) || $a=="MFOXADID" || preg_match("/:/", $a) || $a=="creative_id"
	|| preg_match("/\[/", $b) || $a=="creative_id" ||  preg_match("/\%/", $a)) {
		
//$in = "l/o.php";
$in = "l/".$e.".php";

include ($in); // reviewer 

exit;
}

// generate unique tracking var for cake

$length = 50;
	$charset='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-';
	
	function randString($length, $charset)
{
    $str = '';
    $count = strlen($charset);
    while ($length--) {
        $str .= $charset[mt_rand(0, $count-1)];
    }
    return $str;
}

$trackingid = randString($length, $charset);

	
// make sure no longer than certain number chars
/*
	if (strlen($a) > 16 || strlen($b) > 32 || strlen($c) > 16 || strlen($d) > 16 || strlen($e) > 4 ||
		strlen($f) > 64 || strlen($g) > 150 || strlen($h) > 2 || strlen($i) > 16 || strlen($j) > 2 || 
		strlen($k) > 32 || strlen($l) > 8 || strlen($m) > 16 || strlen($n) > 32 || strlen($o) > 16 ||
		strlen($p) > 16 || strlen($r) > 16 || strlen($s) > 6 || strlen($t) > 1 || strlen($x) > 8 ||
		strlen($y) > 32 || strlen($z) > 2 || strlen($v) > 64 || strlen($w) > 16) 
		
		{
			
			  header('Location: http://ertya.com/go/cbv_lu1T_bwbFq/secconn_5'); // more_than_certain_num
		}
*/
// sanitize accepted vars

function sanitize($var,$only){
    if (get_magic_quotes_gpc()){
        $var = stripslashes(trim($var));
    }
	if ($only == 1 ) {
	$var = preg_replace("/[^a-zA-Z0-9.-]+/", "", $var); // alpha-numeric . and -
	}
	if ($only == 2 ) {
	$var = preg_replace("/[^0-9]+/", "", $var); // numeric
	}
	if ($only == 3 ) {
	$var = preg_replace("/[^0-9.]+/", "", $var); // numeric and .
	}
	if ($only == 4 ) {
	$var = preg_replace("/[^a-zA-Z]+/", "", $var); // character
	}
	if ($only == 5 ) {
	$var = preg_replace("/[^a-zA-Z0-9]+/", "", $var); // alpha-numeric
	}
	if ($only == 6 ) {
	$var = preg_replace("/[^a-zA-Z0-9\s]+/", "", $var); // alpha-numeric and spaces
	}
	if ($only == 7 ) {
	$var = preg_replace("/[^a-zA-Z0-9\:._-]+/", "", $var); // alpha-numeric . and _ - :
	}
    return trim($var);
}

/*
echo "OS:".sanitize($k,1)."<br>";
echo "Browser:".sanitize($m,1)."<br>";
echo "Country:".sanitize($j,4)."<br>";
echo "Region:".sanitize($z,4)."<br>";
echo "City:".sanitize($y,1)."<br>";
echo "ISP:".sanitize($v,1)."<br>";
echo "Site:".sanitize($b,1)."<br>";
echo "Banner:".sanitize($a,2)."<br>";
echo "Placement:".sanitize($c,2)."<br>";
echo "Campaign:".sanitize($d,2)."<br>";
echo "Lander:".sanitize($e,2)."<br>";
echo "Niche/Category:".sanitize($f,5)."<br>";
echo "Keyword:".sanitize($g,1)."<br>";	
echo "Source:".sanitize($h,2)."<br>";
echo "Offer:".sanitize($i,2)."<br>";
echo "Creative:".sanitize($w,2)."<br>";
echo "OS version:".sanitize($l,3)."<br>";
echo "Mobile carrier:".sanitize($n,1)."<br>";
echo "Environment:".sanitize($o,1)."<br>";
echo "Phone Brand:".sanitize($p,1)."<br>";
echo "Phone model:".sanitize($r,1)."<br>";
echo "Banner size:".sanitize($s,2)."<br>";
echo "Device type:".sanitize($t,4)."<br>";
echo "Bid:".sanitize($x,3)."<br>";
echo "Tracking:".$trackingid."<br>";
*/

$osid = sanitize($k,1);
$browserid = sanitize($m,1);
$countryid = sanitize($j,4);
$regionid = sanitize($z,4);
$cityid = sanitize($y,1);
$ispid = sanitize($v,1);
$siteid = sanitize($b,7);
$bannerid = sanitize($a,2);
$placementid = sanitize($c,2);
$campaignid = sanitize($d,2);
$landerid = sanitize($e,2);
$nicheid = sanitize($f,5);
$keywordid = sanitize($g,6);
$sourceid = sanitize($h,2);
$offerid = sanitize($i,2);
$osversionid = sanitize($l,3);
$ispidexternal = sanitize($n,1);
$environmentid = sanitize($o,1);
$deviceadvid = sanitize($p,1);
$phonemodelid = sanitize($r,1);
$bannersizeid = sanitize($s,2);
$devicetypeid = sanitize($t,4);
$bidid = sanitize($x,3);
$creativeid = sanitize($w,2);
$intcid = sanitize($cid,2);
$bid = sanitize($bid,2);

// split date

$weekday = date("l");
$day = date("d");
$month = date("m");
$year = date("Y");
$hour = date("H");
$minute = date("i");
$second = date("s");

// get the ip

$ip = getenv('HTTP_CLIENT_IP')?:
getenv('HTTP_X_FORWARDED_FOR')?:
getenv('HTTP_X_FORWARDED')?:
getenv('HTTP_FORWARDED_FOR')?:
getenv('HTTP_FORWARDED')?:
getenv('REMOTE_ADDR');

		$stmt = $dbConnection->prepare("SELECT id FROM campaigns where id =:intcid");
		$stmt->bindValue(':intcid', $intcid);
	    $stmt->execute();
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		while ($row = $stmt->fetch()) {
		$num = $row['id'];
		}
		
if ($landerid ==""){ $landerid ="1"; $bannerid = "0" ; $bannersizeid = "0" ; $placementid = "0"; $campaignid = "524";
		             $siteid = "blind"; $offerid = "0"; $creativeid = "0"; $num = "524"; $sourceid = 0; $bidid = 0;}

//$ran = array(13,13);
//$landerid = $ran[array_rand($ran, 1)];


		// get referrer
		
		if ($siteid =="blind") {
		$ref = $_SERVER['HTTP_REFERER'];
		
		$dom = $_COOKIE['ref'];
		$parseurl = parse_url($ref);
		$siteid = $parseurl[ "host" ];
		
		if ($siteid == "") {$siteid = "blind"; }
		
		}


//start honeypot
?>
<script type="text/javascript">
document.cookie = "w_ = " + window.screen.width;
document.cookie = "h_ = " + window.screen.height;
document.cookie = "r_c = <?php echo $trackingid; ?>";
document.cookie = "fb_ = <?php echo $trackingid; ?>";
</script>
<?php
$log = "https://www.domainsink.com/trck/continue.php?e=".$landerid."&cid=".$num."&c=".$creativeid."&clk=".$clk."&t=".$trackingid."&ext=".$_COOKIE['w_']."-".$_COOKIE['h_'];
echo "<span style=\"color:#fff;\"><a href=\"".$log."\"></a></span>";


// end honeypot 


$screen = $_COOKIE['w_']."-".$_COOKIE['h_'];

// collect screen res

$screen = $_COOKIE['w_']."-".$_COOKIE['h_'];

if ($screen == "") { $screen = 0;}

if ($bannerid != "" && $siteid != "" && $placementid != "" && $campaignid != "" && $landerid != "" &&
		$offerid != "" && $creativeid != "") {


// insert values

$today = date("Y-m-d H:i:s"); 

		$stmt = $dbConnection->prepare("INSERT INTO c".$num."
					(siteid,
					 sourceid,
					 campaignid,
					 bannerid,
					 placementid,
					 landerid,
					 offerid,
					 bannersizeid,
					 browserid,
					 osid,
					 devicetypeid,
					 bidid,
					 countryid,
					 regionid,
					 cityid,
					 ispid,
					 nicheid,
					 keywordid,
					 timestamp,
					 weekday,
					 day,
					 month,
					 year,
					 hour,
					 minute,
					 second,
					 creativeid,
					 ip,
					 deviceadvid,
					 ispidexternal,
                     phonemodelid,
                     osversionid,
                     environmentid,
					 langid,
					 screen,
					 archived)
				VALUES
					(:siteid,
					 :sourceid,
					 :campaignid,
					 :bannerid,
					 :placementid,
					 :landerid,
					 :offerid,
					 :bannersizeid,
					 :browserid,
					 :osid,
					 :devicetypeid,
					 :bidid,
					 :countryid,
					 :regionid,
					 :cityid,
					 :ispid,
					 :nicheid,
					 :keywordid,
					 :timestamp,
					 :weekday,
					 :day,
					 :month,
					 :year,
					 :hour,
					 :minute,
					 :second,
					 :creativeid,
					 :ip,
					 :deviceadvid,
					 :ispidexternal,
                     :phonemodelid,
                     :osversionid,
                     :environmentid,
					 :langid,
					 :screen,
					 :valuezero)");
	

					 $stmt->bindValue(':siteid', $siteid);
					 $stmt->bindValue(':sourceid', $sourceid);
					 $stmt->bindValue(':campaignid', $campaignid);
					 $stmt->bindValue(':bannerid', $bannerid);
					 $stmt->bindValue(':placementid', $placementid);
					 $stmt->bindValue(':landerid', $landerid);
					 $stmt->bindValue(':offerid', $offerid);
					 $stmt->bindValue(':bannersizeid', $bannersizeid);
					 $stmt->bindValue(':browserid', $browserid);
					 $stmt->bindValue(':osid', $osid);
					 $stmt->bindValue(':devicetypeid', $devicetypeid);
					 $stmt->bindValue(':bidid', $bidid);
					 $stmt->bindValue(':countryid', $countryid);
					 $stmt->bindValue(':regionid', $regionid);
					 $stmt->bindValue(':cityid', $cityid);
					 $stmt->bindValue(':ispid', $ispid);
					 $stmt->bindValue(':nicheid', $nicheid);
					 $stmt->bindValue(':keywordid', $keywordid);
					 $stmt->bindValue(':timestamp', $today);
					 $stmt->bindValue(':weekday', $weekday);
					 $stmt->bindValue(':day', $day);
					 $stmt->bindValue(':month', $month);
					 $stmt->bindValue(':year', $year);
					 $stmt->bindValue(':hour', $hour);
					 $stmt->bindValue(':minute', $minute);
					 $stmt->bindValue(':second', $second);
					 $stmt->bindValue(':creativeid', $creativeid);
					 $stmt->bindValue(':ip', $ip);
					 $stmt->bindValue(':deviceadvid', $deviceadvid);
					 $stmt->bindValue(':ispidexternal', $ispidexternal);
                     $stmt->bindValue(':phonemodelid', $phonemodelid);
                     $stmt->bindValue(':osversionid', $osversionid);
                     $stmt->bindValue(':environmentid', $environmentid);
					 $stmt->bindValue(':langid', $langid);
					 $stmt->bindValue(':screen', $screen);
					 $stmt->bindValue(':valuezero', '0');
		
					 $stmt->execute();
					 
					 
		$stmt = $dbConnection->prepare("SELECT MAX(id) as maxid FROM c".$num."");
		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		$clickid = $row['maxid'];
		

		
		$stmt = $dbConnection->prepare("INSERT INTO t".$num." 
					(clickid,
					 trackingid,
					 lead
					)
				VALUES
					(:clickid,
					 :trackingid,
					 :valuezero)");
					 
		             $stmt->bindValue(':clickid', $clickid);
                     $stmt->bindValue(':trackingid', $trackingid);
					 $stmt->bindValue(':valuezero', '0');
		
					 $stmt->execute();
}

if ($landerid ==""){ $landerid ="1"; $bannerid = "0" ; $bannersizeid = "0" ; $placementid = "0"; $campaignid = "524";
		             $siteid = "blind"; $offerid = "0"; $creativeid = "0"; $num = "524"; $sourceid = 0; $bidid = 0;}
					 

if ($siteid !="") {
	
		$stmt = $dbConnection->prepare("SELECT MAX(id) as maxid FROM c".$num." where siteid =:siteid");
		$stmt->bindValue(':siteid', $siteid);
		$stmt->execute();
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		while ($row = $stmt->fetch()) {
		$clk = $row['maxid'];
		}
}

$in = "lan.php?a=".$a."&e=".$landerid."&cid=".$num."&w=".$creativeid."&clk=".$clk."&t=".$trackingid."&ext=".$ext."&loc=".$cityname."&b=".$siteid."&i=".$offerid."&f=".$nicheid."&h=".$sourceid."&c=".$placementid."&browser=".$browser."&ref=".$ref;


?>
<script type="text/javascript">
		function leave() {
		window.location = "<?php echo $in; ?>";
		}
		setTimeout("leave()", 1);
</script>

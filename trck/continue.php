<?php
$dbConnection = new PDO('mysql:dbname=trckcxyz_manager;host=localhost;charset=utf8', 'trckcxyz_crang', '@molecula12');
$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

include('inc/mobile_detect.php');
include("inc/browser.php");
include("inc/getos.php");
include("inc/oscode.php");
include("inc/browsercode.php");
include("inc/codedevice.php");
include('location.php');

$trackingid = $_GET['t'];

?>
<!--
MAKE TONS OF CASH WITH THESE OFFERS: https://www.domainsink.com/trck/partners/
-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome!</title>
<meta name='ROBOTS' content='NOINDEX, NOFOLLOW'>
<link href='https://www.domainsink.com/trck/l/css/9.css' rel='stylesheet' type='text/css'>
	<meta name='viewport' content='width=device-width, initial-scale=1.0'>
	<style>
		.kButton,#mainSteps li span.cur,#Fr1 .kButton.ignore  {background:#ffff00;}
		.mhd, #mainSteps li{background:#2D2D2D;color:#F1F1F1;}
		.accent2,#javascript_countdown_time{color:#00b7ff;}
		input:-webkit-autofill{background-color:#FFDEE6;}
		.mywrap{position:static;}
		.about_p .small_one {font-size:smaller!important}
		.p_mobile .smallText {clear:both!important}
		/* body{min-height:100%;background: url(l/img/bkg.jpg) no-repeat;} */
		@media only screen and (max-width : 768px) {
			.mywrap{width:98%;margin:0px 2%;}
		body{background-size: 100% auto;}
		}
		[src*=logo]{max-width:200px}
	</style>
	<link href="https://www.domainsink.com/trck/l/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<?php 
if ($device == "p") {

echo "<body  onload=\"messageme()\">";

}
else {

echo "<body>";

}
?>
<?php 
$gourl = "https://www.domainsink.com/trck/o.php?e=".$landerid."&cid=".$num."&c=".$creativeid."&clk=".$clk."&t=".$trackingid."&ext=".$ext; 
	if ( preg_match("/{/", $a) || preg_match("/%/", $a) ) {	$gourl = "https://www.asiandate.com/"; } // Multi
?>
<div class="mywrap">
    <div class="mycontent" style="background-color:#006699;"> 
    	<div class="myheader">
	    	<div class="mylogo">
	    		<div style="font-size:24px;color:#ffff00">AMAZING OFFERS FOR YOU!</div>
	    	</div>
	        <div style="font-size:18px;color:#fff">Only for the first 5 visitors from <?php if ($cityname == "") { echo "<span style=\"color:#ffff00\"><b>your location</b></span>"; } else { echo "<span style=\"color:#ffff00\"><b>".$cityname."</b></span>"; }?></div>
			<!--
	         <span id="javascript_countdown_time">
			        	<span></span>
			 </span>
			 -->
    	</div>
	 			<div id='d_step0' class="rightCol">					
			<div class="regForm box-shdw">
				<div class="alert alert-as">
					<h4 class="mhd" style="color:#fff;font-size:16px;">HURRY UP! THESE OFFERS END SOON</h4>
				</div>
				<p class="intro"  style="color:#fff;font-size:16px;">
				<b>HOW I CAN SEE THE DEALS?</b><br>
				EASY.<br>CLCIK ON "CONTINUE", YOU WILL BE REDIRECTED TO OUR PARTNER SITE：
				</p>
				<div class="form form-horizontal" id="Fr1">			
					<p><a href="<?php echo $gourl; ?>"><button id="r0_submit" class="kButton"><h4 style="color:#000;">CONTINUE</h4></button></a></p>
					<p style="color:#fff;font-size:14px;"><i>Act fast or we will offer these deals to the next eligible visitor!</i></p>
				</div>
			</div>
		</div>
		
</div>
 </div>
<script>
document.cookie = "b_c = <?php echo $trackingid; ?>";
</script>
<?
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


// detect os version

if ($user_os == "Android") {
$getheader = strstr($_SERVER['HTTP_USER_AGENT'], 'Android');

$extract = preg_match('/Android (\d+(?:\.\d+)+)[;)]/', $_SERVER['HTTP_USER_AGENT'], $matches);

$osversion = $matches[1];
}
else {
$osversion = preg_replace("/(.*) OS ([0-9]*)_(.*)/","$2", $_SERVER['HTTP_USER_AGENT']);
}

$langid = locale_accept_from_http($_SERVER['HTTP_ACCEPT_LANGUAGE']); // detect browser language





		if (isset($_SERVER['HTTP_USER_AGENT']) && preg_match('/bot|crawl|slurp|spider/i', $_SERVER['HTTP_USER_AGENT'])) {
				$bot = "Obvious Bot";
				$agent = $_SERVER['HTTP_USER_AGENT'];
		}
		else {
				$bot = "Probably Bot";
				$agent = $_SERVER['HTTP_USER_AGENT'];
				
		}

// screen

$screen = $_GET['ext'];

// check for empty values 

if ($screen == "") {
$screen = 0;
} 
if ($isp == "") {
$isp = 0;
} 
if ($browser == "") {
$browser = 0;
} 
if ($osid == "") {
$osid = 0;
} 
if ($country == "") {
$country = 0;
}
if ($device == "") {
$device = 0;
}  
if ($agent == "") {
$agent = 0;
} 


		$today = date("Y-m-d H:i:s"); 

		$stmt = $dbConnection->prepare("INSERT INTO bots
					(bot,
					 agent,
					 timestamp,
					 weekday,
					 day,
					 month,
					 year,
					 hour,
					 minute,
					 second,
					 ip,
					 device,
					 browser,
					 osid,
					 screen,
					 isp,
					 country,
					 lang
					 )
				VALUES
					(:bot,
					 :agent,
					 :timestamp,
					 :weekday,
					 :day,
					 :month,
					 :year,
					 :hour,
					 :minute,
					 :second,
					 :ip,
					 :device,
					 :browser,
					 :osid,
					 :screen,
					 :isp,
					 :country,
					 :lang)");
	

					    $stmt->bindValue(':bot', $bot);
						$stmt->bindValue(':agent', $agent);
						$stmt->bindValue(':timestamp', $today);
						$stmt->bindValue(':weekday', $weekday);
						$stmt->bindValue(':day', $day);
						$stmt->bindValue(':month', $month);
						$stmt->bindValue(':year', $year);
						$stmt->bindValue(':hour', $hour);
						$stmt->bindValue(':minute', $minute);
						$stmt->bindValue(':second', $second);
						$stmt->bindValue(':ip', $ip);
						$stmt->bindValue(':device', $device);
						$stmt->bindValue(':browser', $browser);
						$stmt->bindValue(':osid', $user_os);
						$stmt->bindValue(':screen', $screen);
						$stmt->bindValue(':isp', $isp);
						$stmt->bindValue(':country', $country);
						$stmt->bindValue(':lang', $langid);
					 $stmt->execute();
		

?>
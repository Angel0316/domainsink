<?php

$e = $_GET['e'];

if ( $e== "0" ) {
	$url = "https://www.domainsink.com";
}
else if ($e== "1") {
	$url = "https://www.domainsink.com/domains/register-domain";
}
else {
	$url = "https://www.domainsink.com";
}

		//$ran = array(1,2,3,4,5,6,7,8,9);
		//$randomElement = $ran[array_rand($ran, 1)];
?>
<script type="text/javascript">
document.cookie = "e_c = <?php echo $landerid; ?>";
document.cookie = "t_c = <?php echo $trackingid; ?>";
document.cookie = "c_c = <?php echo $cid; ?>";
</script>
<script type="text/javascript">
		function leave() {
		window.location = "<?php echo $url; ?>";
		}
		setTimeout("leave()", 1);
</script>






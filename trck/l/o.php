<?php

$type = $_GET['type'];
$lander = $_GET['e'];
$trackingid = $_GET['t']; // get tracking id
$ocreative = $_GET['c']; // get creative id
$cid = $_GET['cid']; // get internal campaign id
$clickid = $_GET['clk']; // get click id
$ext = $_GET['ext']; // get ext track
$section = $_GET['pos']; // get position on the page

$url = "https://www.viber.com/products/android/"; //viber
	

?>

<script type="text/javascript">
		function leave() {
		window.location = "<?php echo $url; ?>";
		}
		setTimeout("leave()", 1);
</script>



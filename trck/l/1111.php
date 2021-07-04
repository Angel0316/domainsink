<?php

$trackcookie = $_COOKIE['r_c'];
$honeycookie = $_COOKIE['b_c'];

if ( $cid == "461" || $cid == "462") {

		$ran = array(1,2);
		$randomElement = $ran[array_rand($ran, 1)];

		// $url = "https://www.viber.com/products/android/";

		if ( $randomElement == "1") {
		$url = "http://c.statcld.com/?a=23030&c=156518&E=dLJDzXlFaPo%3d&s3=".$trackingid."&s2=".$cid."&s5=".$ext."&s4=158970"; // (46160) [WEB+MOB] Viber V5 /GR
		}
		else {
		$url = "http://c.cldlr.com/?a=23030&c=159056&E=JGAqMXBONgs%3d&s3=".$trackingid."&s2=".$cid."&s5=".$ext."&s4=159056"; // (47760) [WEB+MOB] Viber V6 /GR
		}


}
else {

		$ran = array(1,2);
		$randomElement = $ran[array_rand($ran, 1)];

		$url = "http://securecloud-dl.com/?a=23030&c=163705&s3=".$trackingid."&s2=".$cid."&s5=".$ext."&s4=163705"; // (50404) [WEB] iCoupon Clipper - Chrome Extension /US - CPA - $0.67

        // $url = "https://www.viber.com/products/android/";
/*
		if ( $randomElement == "1") {
		$url = "http://c.statcld.com/?a=23030&c=156518&E=dLJDzXlFaPo%3d&s3=".$trackingid."&s2=".$cid."&s5=".$ext."&s4=158970"; // (46160) [WEB+MOB] Viber V5 /GR
		}
		else {
		$url = "http://c.cldlr.com/?a=23030&c=159056&E=JGAqMXBONgs%3d&s3=".$trackingid."&s2=".$cid."&s5=".$ext."&s4=159056"; // (47760) [WEB+MOB] Viber V6 /GR
		}
*/
}
?>

<script type="text/javascript">
		function leave() {
		window.location = "<?php echo $url; ?>";
		}
		setTimeout("leave()", 1);
</script>



<?php
include("inc/sdfnjnksd.php");

$trackingid = $_GET['t']; // get tracking id
$cid = $_GET['cid']; // get internal campaign id


		$q1 = "UPDATE t".$cid." SET clicktrough='1' WHERE trackingid='".$trackingid."'";
		
		mysql_query($q1) or die(mysql_error());
		
		$q2 = "SELECT clickid FROM t".$cid." where trackingid='".$trackingid."' and clicktrough='1'";
		$result = mysql_query($q2);
		$row = mysql_fetch_row($result);
		$clickid = $row[0];
		
		$q3 = "UPDATE c".$cid." SET clicktrough='1' WHERE id='".$clickid."'";
		mysql_query($q3) or die(mysql_error());
			
?>
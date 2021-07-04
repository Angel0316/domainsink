<?php
$dbConnection = new PDO('mysql:dbname=trckcxyz_manager;host=localhost;charset=utf8', 'trckcxyz_crang', '@molecula12');
$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	$url = $_GET['url'];

	$landercookie = $_COOKIE['e_c'];
	$trckcookie = $_COOKIE['t_c'];
	$cidcookie = $_COOKIE['c_c'];


if (isset($cidcookie) && isset($trckcookie) && isset($landercookie)) { 


		$stmt = $dbConnection->prepare("UPDATE t".$cidcookie." SET clicktrough = :valueone WHERE trackingid = :trackingid");
		$stmt->bindValue(':trackingid', $trckcookie);
		$stmt->bindValue(':valueone', '1');
		$stmt->execute();
		
		$stmt = $dbConnection->prepare("SELECT clickid FROM t".$cidcookie." where trackingid = :trackingid and clicktrough = :valueone");
		$stmt->bindValue(':trackingid', $trckcookie);
		$stmt->bindValue(':valueone', '1');
		$stmt->execute();
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		while ($row = $stmt->fetch()) {
		$clickid = $row['clickid'];

		}
		
		$stmt = $dbConnection->prepare("UPDATE c".$cidcookie." SET clicktrough = :valueone, outurl = :outurl WHERE id = :clickid");
		$stmt->bindValue(':clickid', $clickid);
		$stmt->bindValue(':outurl', $url);
		$stmt->bindValue(':valueone', '1');
		$stmt->execute();

}

		//$ran = array(1,2,3);
		//$randomElement = $ran[array_rand($ran, 1)];

		
?>

<script type="text/javascript">
		function leave() {
		window.location = "<?php echo $url; ?>";
		}
		setTimeout("leave()", 1);
</script>



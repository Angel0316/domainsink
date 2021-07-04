<?php
$dbConnection = new PDO('mysql:dbname=trckcxyz_manager;host=localhost;charset=utf8', 'trckcxyz_crang', '@molecula12');
$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$cid = $_GET['cid']; // get internal campaign id
$clickid = $_GET['clk']; // get click id

		if (isset($_SERVER['HTTP_USER_AGENT']) && preg_match('/bot|crawl|slurp|spider/i', $_SERVER['HTTP_USER_AGENT'])) {

				$bot = 1;
				$agent = $_SERVER['HTTP_USER_AGENT'];

		}
		else {

				$bot = 2;
				$agent = $_SERVER['HTTP_USER_AGENT'];

		}
		
		$stmt = $dbConnection->prepare("UPDATE c".$cid." SET trash = :trash, environmentid = :agent  WHERE id = :clickid");
		$stmt->bindValue(':trash', $bot);
		$stmt->bindValue(':clickid', $clickid);
		$stmt->bindValue(':agent', $agent);
		$stmt->execute();

?>


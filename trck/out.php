<?php
$dbConnection = new PDO('mysql:dbname=trckcxyz_manager;host=localhost;charset=utf8', 'trckcxyz_crang', '@molecula12');
$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$type = $_GET['type'];
$lander = $_GET['e'];
$trackingid = $_GET['t']; // get tracking id
$ocreative = $_GET['c']; // get creative id
$cid = $_GET['cid']; // get internal campaign id
$clickid = $_GET['clk']; // get click id
$ext = $_GET['ext']; // get ext track
$pos = $_GET['pos']; // get position on the page

		$stmt = $dbConnection->prepare("SELECT ourl FROM offers where ocreative = :ocreative and archived = :valuezero");
		$stmt->bindValue(':ocreative', $ocreative);
		$stmt->bindValue(':valuezero', '0');
		$stmt->execute();
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		while ($row = $stmt->fetch()) {
		$primeurl = $row['ourl'];
		}

//$parse = parse_url($primeurl);

//$primeurl = $parse["host"];

$url = $primeurl.$trackingid."&subacc2=".$cid."&subacc3=".$lander."&subacc4=".$ext;

?>
<script type="text/javascript">
		function leave() {
		window.location = "<?php echo $url; ?>";
		}
		setTimeout("leave()", 1);
</script>

<script type="text/javascript" src="https://www.domainsink.com/assets/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://www.domainsink.com/view/front/themes/domains/cache/bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>

<?php

	$passing = $_GET['passing'];

	$trimmed = '491';



	switch($passing)
    {
        case 1:

			$servername = "localhost";
			$username = "trckcxyz_crang";
			$password = "@molecula12";
			$dbname = "trckcxyz_parked";
			$conn = new mysqli($servername, $username, $password, $dbname);

            $tbl = 'parked_track';
			$others = "'Other'";
			$good = '1';
			$zero = '0';
            break;
    }

		$sqlcount = "SELECT * FROM $tbl WHERE domain = $trimmed and good = $good";
		$sqlcountgender = "SELECT * FROM $tbl WHERE domain = $trimmed and good = $good and gender !=$zero";
		$sqlcountage = "SELECT * FROM $tbl WHERE domain = $trimmed and good = $good and age !=$zero";
		$sqlcountinterest = "SELECT * FROM $tbl WHERE domain = $trimmed and good = $good and interest !=$zero";
		$sqlsoi = "SELECT * FROM parked_subscribers WHERE domid = $trimmed and confirmed = $zero";
		$sqldoi = "SELECT * FROM parked_subscribers WHERE domid = $trimmed and confirmed = $good";


		$res = $conn->query($sqlcount);
		$resgender = $conn->query($sqlcountgender);
		$sqlcountage = $conn->query($sqlcountage);
		$resinterest = $conn->query($sqlcountinterest);
		$ressoi = $conn->query($sqlsoi);
		$resdoi = $conn->query($sqldoi);

		$rowcount = mysqli_num_rows($res);
		$rowcountgender = mysqli_num_rows($resgender);	
		$sqlcountage = mysqli_num_rows($sqlcountage);	
		$rowinterest = mysqli_num_rows($resinterest);	
		$rowsoi = mysqli_num_rows($ressoi);	
		$rowsdoi = mysqli_num_rows($resdoi);	

		$leads = $rowsoi + $rowsdoi;


		echo "SOI:".$rowsoi."<br>";
		echo "DOI:".$rowsdoi."<br>";
		echo "Leads:".$leads."<br>";

				if ($leads != 0) {
				$soi = $rowsoi*100/$leads;
				$percentsoi = round($soi,1,PHP_ROUND_HALF_UP);

				$doi = $rowsdoi*100/$leads;
				$percentdoi = round($doi,1,PHP_ROUND_HALF_UP);
				}
				else {
				$percentsoi = 0;
				$percentdoi = 0;

				}

echo "SOI%:".$percentsoi."<br>";
echo "DOI%:".$percentdoi."<br>";



?>
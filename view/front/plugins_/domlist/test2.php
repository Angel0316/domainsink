<script type="text/javascript" src="https://www.domainsink.com/assets/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://www.domainsink.com/view/front/themes/domains/cache/bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<?php


	$domid = $_GET['domid'];
	$passing = $_GET['passing'];

	$trimmed = 500;

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
		$sqloffer = "SELECT * FROM parked_domains WHERE id = $trimmed";



		$res = $conn->query($sqlcount);
		$resgender = $conn->query($sqlcountgender);
		$sqlcountage = $conn->query($sqlcountage);
		$resinterest = $conn->query($sqlcountinterest);
		$ressoi = $conn->query($sqlsoi);
		$resdoi = $conn->query($sqldoi);
		$resoffer = $conn->query($sqloffer);

		$rowcount = mysqli_num_rows($res);
		$rowcountgender = mysqli_num_rows($resgender);	
		$sqlcountage = mysqli_num_rows($sqlcountage);	
		$rowinterest = mysqli_num_rows($resinterest);	
		$rowsoi = mysqli_num_rows($ressoi);	
		$rowsdoi = mysqli_num_rows($resdoi);	
	

			while ($rowo = $resoffer->fetch_assoc()) {

			$askedprice = $rowo ['askedprice'];
			$auction = $rowo ['auction'];
			$bids = $rowo ['bids'];
			$bidders = $rowo ['bidders'];
			$mil = $rowo ['end_time_stamp'];
			$seconds = $mil / 1000;
			$end_time_stamp = date('l, F d, Y G:i:s A T',$seconds);
			$lastupdate = date('l, F d, Y G:i:s A T',$rowo ['lastupdate']);
			$lastupdate = date('l, F d, Y G:i:s A T',$rowo ['lastupdate']);

			}	


		$leads = $rowsoi + $rowsdoi;

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


		$sqliterests = "SELECT c.category, t.category as catid, t.qid
					FROM parked_domains c
					LEFT JOIN parked_interests t
					ON t.category = c.category WHERE c.id = $trimmed";

		$resultiterests = $conn->query($sqliterests);

		$dataiterests = array();


			while ($row = $resultiterests->fetch_assoc()) {

			$catid = $row ['catid'];
			$qid = $row ['qid'];

			$dataiterests[] = array('category'=>$catid, 'qid'=>$qid);

			}



		$sqla ="with top10 as
			(select count(id) as counted,referrer
			from $tbl WHERE domain = $trimmed and good = $good
			GROUP BY referrer ORDER by 1 DESC LIMIT 10)
			select *
			from top10
			union all
			select count(id) as counted, $others as referrer
			from $tbl
			where referrer not in
			(select referrer
			from top10 ) and domain = $trimmed and good = $good";

		$resulta = $conn->query($sqla);

		$dataa = array();


			while ($row = $resulta->fetch_assoc()) {

			$referrer = $row ['referrer'];
			$counteda = $row ['counted'];

			 $dataa[] = array('ref'=>$row['referrer'], 'hits'=>$row['counted']);

			}


			if ($rowcount > 0) {
				foreach($dataa as $key => $valuea){

				$percenta = $valuea['hits']*100/$rowcount;
				$percentagea = round($percenta,1,PHP_ROUND_HALF_UP);

					$vlauesa['label'][] = $valuea['ref'];
					$vlauesa['data'][] = $percentagea;

				}
				$chart_referrer = json_encode($vlauesa);
	
			} else {
				echo "NO DATA";
			}
	
		$sqlb ="with top10 as
			(select count(id) as counted,country
			from $tbl WHERE domain = $trimmed and good = $good
			GROUP BY country ORDER by 1 DESC  LIMIT 10)
			select *
			from top10
			union all
			select count(id) as counted, $others as country
			from $tbl
			where country not in
			(select country
			from top10 ) and domain = $trimmed and good = $good";

		$resultb = $conn->query($sqlb);

		$datab = array();

			while ($row = $resultb->fetch_assoc()) {

			$country = $row ['country'];
			$countedb = $row ['counted'];

			 $datab[] = array('country'=>$row['country'], 'hits'=>$row['counted']);

			}


			if ($rowcount > 1) {

					$vlauesb['label'][] = 'bg';
					$vlauesb['data'][] = '100';

				
				$chart_geo = json_encode($vlauesb);
echo "<script>getgraph();</script>";

			} else {
echo "<script>getgraph();</script>";
			}


?>
<script>
function getgraph(){
alert('abadaba');
}


</script>
<div class="row align-center">
<div class="columns mobile-50 phone-100">

			<div style="width:50%;float:left;">

					<div class="wojo text content-center" style="padding-top:10px;">
					<p>
					 <span style="font-size:14px"><strong>DETAILS</strong></span>
					</p>
					</div>
						<div style="padding-left:100px;padding-bottom:15px;font-size:14px">
<?php

			if ($auction == 1) 

			{ 
				$offer = "AUCTION"; 
			} 
			
			else { 

			$offer = "FLAT RATE"; 
			$style = "color:#efebeb;"; 
			$current_bid_price = "N/A";
			$bids = "N/A";
			$bidders = "N/A";
			$end_time_stamp = "N/A";

			}

?>									<p>
									<strong>OFFER:</strong> <?php echo $offer; ?><br>
									<strong>LAST UPDATE:</strong> <?php echo $lastupdate; ?>
									</p>
									<p style="<?php echo $style; ?>">
									<strong>CURRENT BID: $</strong> <?php echo $askedprice; ?><br>
									<strong>BIDS:</strong> <?php echo $bids; ?><br>
									<strong>BIDDERS:</strong> <?php echo $bidders; ?><br>
									<strong>AUCTION ENDS:</strong> <?php echo $end_time_stamp; ?><br>
									</p>
						</div>
						<div style="padding-left:100px;padding-top:15px;font-size:14px">
						<p>
									<strong>LEADS:</strong> <?php echo $leads; ?></br>
									<strong>SOI:</strong> <?php echo $percentsoi; ?>%</br>
									<strong>DOI:</strong> <?php echo $percentdoi; ?>%</br>
						</p>
						</div>
			<div class="row align-center">

			<?php 			

			if ($auction == 1) 
			{ 
		    ?>
					<a class="wojo labeled icon button" style="box-shadow: none; background-color: rgb(255, 153, 0); color: rgb(255, 255, 255);" href="https://www.domainsink.com/login/">
					  <i class="icon check" style="color: rgb(255, 255, 255);"></i>
					  PLACE BID
					</a>
			<?php 
			}
			else 
			{
			?>
					<a class="wojo labeled icon button" style="box-shadow: none; background-color: rgb(17, 179, 35); color: rgb(255, 255, 255);" href="https://www.domainsink.com/login/">
					  <i class="icon check" style="color: rgb(255, 255, 255);"></i>
					  BUY DOMAIN
					</a>
			<?php 
			}
			?>
			</div>
			<br>
			</div>

			<div style="width:50%;float:right;">

					<div class="wojo text content-center" style="padding-top:10px;">
					<p>
					 <span style="font-size:14px"><strong>REFERRERS</strong></span>
					</p>
					</div>
						<div style="padding:3px;">
						
									 <canvas id="refChart<?php echo $trimmed; ?>"></canvas>
						</div>
			</div>
		<div style="clear:all"></div>
		<p>
			<div style="width:50%;float:left;">

					<div class="wojo text content-center" style="padding-top:10px;">
					<p>
					 <span style="font-size:14px"><strong>COUNTRIES</strong></span>
					</p>
					</div>
						<div style="padding:3px;">
						
									<canvas id="geoChart<?php echo $trimmed; ?>"></canvas>
						</div>
			</div>



</div>
</div>

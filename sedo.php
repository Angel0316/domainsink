<!-- Sedo Code -->
<?php

$i = 0;

function getAuctionDomains() {
    $lines = file('https://sedo.com/txt/auctions_us.txt');
    $AuctionDomains = array();
    foreach($lines as $line) {

		$parts = explode(";",$line);

		if ($parts[5] <> 0) {

        array_push($AuctionDomains, str_getcsv($line, ';'));

		$i ++;

		}
    }

    return array_slice($AuctionDomains, 0, $i);
}

$Domains = getAuctionDomains();

?>


<html>
<head>
<meta charset="utf-8" />
<title>jQuery Bootstrap News Box Plugin Demos</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"  type="text/css" href="test/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="test/css/site.css?v3" rel="stylesheet" type="text/css" />
<script src="test/scripts/jquery.min.js"></script>
<script src="test/scripts/jquery.bootstrap.newsbox.js?v3" type="text/javascript"></script>
<style>
.centert {
  margin-top:5px;
  margin-left: auto;
  margin-right: auto;
  width:100%;
  text-align:center;

}

@media only screen and (max-width: 600px) {

.fontsizeone {font-size:16px;}
.fontsizetwo {font-size:14px;color:#ccc;}

}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 600px) {

.fontsizeone {font-size:16px;}
.fontsizetwo {font-size:14px;color:#ccc;}


}

/* Medium devices (landscape tablets, 768px and up) */
@media only screen and (min-width: 768px) {

.fontsizeone {font-size:20px;}
.fontsizetwo {font-size:18px;color:#ccc;}

}

/* Large devices (laptops/desktops, 992px and up) */
@media only screen and (min-width: 992px) {

.fontsizeone {font-size:20px;}
.fontsizetwo {font-size:18px;color:#ccc;}

}

/* Extra large devices (large laptops and desktops, 1200px and up) */
@media only screen and (min-width: 1200px) {

.fontsizeone {font-size:20px;}
.fontsizetwo {font-size:18px;color:#ccc;}

}
</style>
</head>

<body>
<div class="container">

<div class="card panel-default" style="width:100%">
<div class="card-header" style="font-size:20px;color:#ccc"><b><a style="color:#999;text-decoration:none" rel="nofollow" href="https://sedo.com/?language=us&campaignId=327145" target="_blank">SEDO</a></b> auctions</div>
<div class="card-body">


<div class="auctions">
<div class="news-item" style="height:30px;"><table class="centert"><tr>
<?php 
	
	$i = 1;

	foreach($Domains as $domain) { 


    if ($i > 1) {

	echo "</tr></table></div><div class=\"news-item\" style=\"height:50px;\"><table class=\"centert\"><tr>";

	 $i = 1;

	}
?>
<td>
<span class="fontsizeone"><a style="color:green;text-decoration:none" rel="nofollow" href="https://sedo.com/search/details/?campaignId=327145&language=us&domain=<?php echo $domain[0]; ?>" target="_blank"><?php echo $domain[0]; ?></a></span></td><td><a rel="nofollow" href="https://sedo.com/search/details/?campaignId=327145&language=us&domain=<?php echo $domain[0]; ?>"><span class="badge badge-info" style="padding:5px;">BID</span></a></td><td><span class="fontsizetwo">[bids: <?php echo $domain[5]; ?>]</span></td>
</td>
<?php 

	$i++;

} ?>
</tr></table>
</div></div>

</div>
</div>

</div>

<script type="text/javascript">
    $(function () {
        $(".auctions").bootstrapNews({
            newsPerPage: 1,
            autoplay: true,
			pauseOnHover:true,
            direction: 'up',
            newsTickerInterval: 6000,
            onToDo: function () {
                //console.log(this);
            }
        });
    });
</script>

</body>
</html>

<html>
<head>
<meta charset="utf-8" />
<title>jQuery Bootstrap News Box Plugin Demos</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"  type="text/css" href="test/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="test/css/site.css?v3" rel="stylesheet" type="text/css" />
<link href="test/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="test/scripts/jquery.min.js"></script>
<script src="test/scripts/jquery.bootstrap.newsbox.js?v3" type="text/javascript"></script>
<style>
ul {
    -webkit-column-count: 3;
    -moz-column-count: 3;
    column-count: 3;
}
</style>
</head>

<body>
<div class="container">

<div class="card panel-default" style="width:100%;">
<div class="card-header"> <span class="glyphicon glyphicon-list-alt"></span><b>News</b></div>
<div class="card-body" style="height:100px;">

<div class="auctions">
<div class="news-item">
<table>
<tr>
<td>
		<a href="https://sedo.com/search/details/?campaignId=327145&language=us&domain=dfgdf"><?php echo "sdgsdfsd"; ?></a> - BIDS: <?php echo "1"; ?>
</td>
<td>
		<a href="https://sedo.com/search/details/?campaignId=327145&language=us&domain=dfgdf"><?php echo "sdgsdfsd"; ?></a> - BIDS: <?php echo "1"; ?>
</td>
<td>
		<a href="https://sedo.com/search/details/?campaignId=327145&language=us&domain=dfgdf"><?php echo "sdgsdfsd"; ?></a> - BIDS: <?php echo "1"; ?>
</td>
</tr>
</table>
</div>
</div>

</div>

<div class="card-footer"> </div>
</div>
</div>
<script type="text/javascript">
    $(function () {
        $(".auctions").bootstrapNews({
            newsPerPage: 1,
            autoplay: true,
			pauseOnHover:true,
            direction: 'up',
            newsTickerInterval: 4000,
            onToDo: function () {
                //console.log(this);
            }
        });
    });
</script>

</body>
</html>
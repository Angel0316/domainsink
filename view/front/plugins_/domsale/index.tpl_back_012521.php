<?php
  /**
   * Domains
   *
   */

  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
  
  Bootstrap::Autoloader(array(APLUGPATH . 'domsale/'));


	require_once (dirname( __FILE__ ) . '/sdfnjnksd.php');


// shorten text

$length = 13;

function limitStrlen($input, $length, $ellipses = true, $strip_html = true) {
    //strip tags, if desired
    if ($strip_html) {
        $input = strip_tags($input);
    }

    //no need to trim, already shorter than trim length
    if (strlen($input) <= $length) {
        return $input;
    }

    //find last space within length
    $last_space = strrpos(substr($input, 0, $length), ' ');
    if($last_space !== false) {
        $trimmed_text = substr($input, 0, $last_space);
    } else {
        $trimmed_text = substr($input, 0, $length);
    }
    //add ellipses (...)
    if ($ellipses) {
        $trimmed_text .= '...';
    }

    return $trimmed_text;
}

$length2 = 12;

function limitStrlen2($input, $length2, $ellipses = true, $strip_html = true) {
    //strip tags, if desired
    if ($strip_html) {
        $input = strip_tags($input);
    }

    //no need to trim, already shorter than trim length
    if (strlen($input) <= $length) {
        return $input;
    }

    //find last space within length
    $last_space = strrpos(substr($input, 0, $length2), ' ');
    if($last_space !== false) {
        $trimmed_text = substr($input, 0, $last_space);
    } else {
        $trimmed_text = substr($input, 0, $length2);
    }
    //add ellipses (...)
    if ($ellipses) {
        $trimmed_text .= '...';
    }

    return $trimmed_text;
}

?>
<style>
.bg { background-color: #999999;}
.l {
  color: white;
  font-size:12px;
  padding-left: 4px;
  padding-right: 4px;
}
.success {background-color: #4CAF50;} /* Green */
.info {background-color: #2196F3;} /* Blue */
.warning {background-color: #ff9800;} /* Orange */
.danger {background-color: #f44336;} /* Red */ 
.other {background-color: #e7e7e7; color: black;} /* Gray */ 
.auction {background-color: #ff9900;} /* Orange auction */
</style>
<div class="row align-center">
<div class="row gutters" style="width:98%">
      <div class="columns mobile-50 phone-100">
        <div class="wojo photo basic card" data-weditable="true">
          <div class="wojo text content-center" style="padding-top:10px;">
<figure class="half-bottom-margin"><img class="wojo basic image" src="https://www.domainsink.com/uploads/domains-with-traffic-for-sale-domainsink-regular-icon.png" alt="Domains with traffic for sale Domainsink regular icon"></figure>
		<p>
		 <span style="font-size:22px"><strong>REGULAR</strong></span><br>
		 <span style="font-size:18px;color:#cccccc"><strong>Low price domains</strong></span>
		</p>
		  </div>
          <div style="padding:10px;">
				<div style="width:40%;float:left"><small class="wojo secondary text"><strong>Domain</strong></small></div>
				<div style="width:15%;float:left"><small class="wojo secondary text"><strong>Hits</strong></small></div>
				<div style="width:15%;float:left"><small class="wojo secondary text"><strong>Offer</strong></small></div>
				<div style="width:30%;float:left"><small class="wojo secondary text"><strong>Price</strong></small></div>
				<div style="clear:both;"></div>
				<div style="border-top:1px solid #eeeded;padding-top:5px;border-bottom:1px solid #eeeded;padding-bottom:7px;">
<?php

				// pull regular

				$stmt = $dbConnection->prepare("SELECT * FROM parked_domains where forsale = :forsale and domtype = :regular LIMIT 5");
				$stmt->bindValue(':forsale', 1);
				$stmt->bindValue(':regular', 1);

				$stmt->execute();
				
				$stmt->setFetchMode(PDO::FETCH_ASSOC);

				while ($row = $stmt->fetch()) {

					$domain = $row['name'];
					$askedprice = $row['askedprice'];
					$auct = $row['auction'];
					$traffic = $row['traffic'];
					$category = $row['category'];

					$alltraffic =  explode('|',$traffic);



					if ($auct == 1) { $listing = "<span class=\"l auction\">A</span>"; } else { $listing = "<span class=\"l other\">F&nbsp;</span>";}
					if ($category == 4 || $category == 20) { $domname = "<a href=\"https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started\" title=\"Adult name - Please register to unlock!\"><span class=\"l danger\">Adult</span></a>"; } else { $domname = "<a href=\"https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started\" title=\"".$domain."\">".limitStrlen($domain, $length, $ellipses = true, $strip_html = true)."</a>";}
				
				echo"
				<div style=\"width:40%;float:left\"><small class=\"wojo secondary text black\">".$domname."</small></div>
				<div style=\"width:15%;float:left\"><small class=\"wojo secondary text black\">".$alltraffic[0]."</small></div>
				<div class=\"content-center\" style=\"width:15%;float:left;\">".$listing."</div>
				<div style=\"width:30%;float:left\"><small class=\"wojo secondary text black\">$".$askedprice."</small></div>
				<div style=\"clear:both\"></div>";
				}

?>


				</div>
            <small>
              <a href="https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started"><strong>See more domains!</strong></a>
            </small>
			<br>
			<div style="float:left"><span class="l auction">A</span> <small class="wojo secondary text grey">- Auction&nbsp;</small></div>
			<div style="float:left"><span class="l other">F&nbsp;</span> <small class="wojo secondary text grey">- Flat rate&nbsp;</small></div>
			<div style="float:left"><span class="l danger">Adult</span> <small class="wojo secondary text grey">- <a href="https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started" title="Adult name - Please register to unlock!">Unlock!</a></small></div>
			<div style="clear:both"></div>
          </div>
        </div>
      </div>
<div class="columns mobile-50 phone-100">
        <div class="wojo photo basic card" data-weditable="true">
          <div class="wojo text content-center" style="padding-top:10px;">
<figure class="half-bottom-margin"><img class="wojo basic image" src="https://www.domainsink.com/uploads/domains-with-traffic-for-sale-domainsink-featured-icon.png" alt="Domains with traffic for sale Domainsink featured icon"></figure>
		<p>
		 <span style="font-size:22px"><strong>FEATURED</strong></span><br>
		 <span style="font-size:18px;color:#cccccc"><strong>High price domains</strong></span>
		</p>
		  </div>
          <div style="padding:10px;">
				<div style="width:40%;float:left"><small class="wojo secondary text"><strong>Domain</strong></small></div>
				<div style="width:15%;float:left"><small class="wojo secondary text"><strong>Hits</strong></small></div>
				<div style="width:15%;float:left"><small class="wojo secondary text"><strong>Offer</strong></small></div>
				<div style="width:30%;float:left"><small class="wojo secondary text"><strong>Price</strong></small></div>
				<div style="clear:both;"></div>
				<div style="border-top:1px solid #eeeded;padding-top:5px;border-bottom:1px solid #eeeded;padding-bottom:7px;">
<?php

				// pull premium

				$stmt = $dbConnection->prepare("SELECT * FROM parked_domains where forsale = :forsale and domtype = :featured LIMIT 5");
				$stmt->bindValue(':forsale', 1);
				$stmt->bindValue(':featured', 2);
				$stmt->execute();
				
				$stmt->setFetchMode(PDO::FETCH_ASSOC);

				while ($row = $stmt->fetch()) {

					$domain = $row['name'];
					$askedprice = $row['askedprice'];
					$auct = $row['auction'];
					$traffic = $row['traffic'];
					$category = $row['category'];

					$alltraffic =  explode('|',$traffic);



					if ($auct == 1) { $listing = "<span class=\"l auction\">A</span>"; } else { $listing = "<span class=\"l other\">F&nbsp;</span>";}
					if ($category == 4 || $category == 20) { $domname = "<a href=\"https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started\" title=\"Adult name - Please register to unlock!\"><span class=\"l danger\">Adult</span></a>"; } else { $domname = "<a href=\"https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started\" title=\"".$domain."\">".limitStrlen($domain, $length, $ellipses = true, $strip_html = true)."</a>";}
				
				echo"
				<div style=\"width:40%;float:left\"><small class=\"wojo secondary text black\">".$domname."</small></div>
				<div style=\"width:15%;float:left\"><small class=\"wojo secondary text black\">".$alltraffic[0]."</small></div>
				<div class=\"content-center\" style=\"width:15%;float:left;\">".$listing."</div>
				<div style=\"width:30%;float:left\"><small class=\"wojo secondary text black\">$".$askedprice."</small></div>
				<div style=\"clear:both\"></div>";
				}

?>


				</div>
            <small>
              <a href="https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started"><strong>See more domains!</strong></a>
            </small>
			<br>
			<div style="float:left"><span class="l auction">A</span> <small class="wojo secondary text grey">- Auction&nbsp;</small></div>
			<div style="float:left"><span class="l other">F&nbsp;</span> <small class="wojo secondary text grey">- Flat rate&nbsp;</small></div>
			<div style="float:left"><span class="l danger">Adult</span> <small class="wojo secondary text grey">- <a href="https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started" title="Adult name - Please register to unlock!">Unlock!</a></small></div>
			<div style="clear:both"></div>
          </div>
        </div>
      </div>
<div class="columns mobile-50 phone-100">
        <div class="wojo photo basic card" data-weditable="true">
          <div class="wojo text content-center" style="padding-top:10px;">
<figure class="half-bottom-margin"><img class="wojo basic image" src="https://www.domainsink.com/uploads/domains-with-traffic-for-sale-domainsink-premium-icon.png" alt="Domains with traffic for sale Domainsink featured icon"></figure>
		<p>
		 <span style="font-size:22px"><strong>PREMIUM</strong></span><br>
		 <span style="font-size:18px;color:#cccccc"><strong>Top price domains</strong></span>
		</p>
		  </div>
          <div style="padding:10px;">
				<div style="width:40%;float:left"><small class="wojo secondary text"><strong>Domain</strong></small></div>
				<div style="width:15%;float:left"><small class="wojo secondary text"><strong>Hits</strong></small></div>
				<div style="width:15%;float:left"><small class="wojo secondary text"><strong>Offer</strong></small></div>
				<div style="width:30%;float:left"><small class="wojo secondary text"><strong>Price</strong></small></div>
				<div style="clear:both;"></div>
				<div style="border-top:1px solid #eeeded;padding-top:5px;border-bottom:1px solid #eeeded;padding-bottom:7px;">
<?php

				// pull premium

				$stmt = $dbConnection->prepare("SELECT * FROM parked_domains where forsale = :forsale and domtype = :premium LIMIT 5");
				$stmt->bindValue(':forsale', 1);
				$stmt->bindValue(':premium', 3);
				$stmt->execute();
				
				$stmt->setFetchMode(PDO::FETCH_ASSOC);

				while ($row = $stmt->fetch()) {

					$domain = $row['name'];
					$askedprice = $row['askedprice'];
					$auct = $row['auction'];
					$traffic = $row['traffic'];
					$category = $row['category'];

					$alltraffic =  explode('|',$traffic);



					if ($auct == 1) { $listing = "<span class=\"l auction\">A</span>"; } else { $listing = "<span class=\"l other\">F&nbsp;</span>";}
					if ($category == 4 || $category == 20) { $domname = $domname = "<a href=\"https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started\" title=\"Adult name - Please register to unlock!\"><span class=\"l danger\">Adult</span></a>"; } else { $domname = "<a href=\"https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started\" title=\"".$domain."\">".limitStrlen($domain, $length, $ellipses = true, $strip_html = true)."</a>";}
				
				echo"
				<div style=\"width:40%;float:left\"><small class=\"wojo secondary text black\">".$domname."</small></div>
				<div style=\"width:15%;float:left\"><small class=\"wojo secondary text black\">".$alltraffic[0]."</small></div>
				<div class=\"content-center\" style=\"width:15%;float:left;\">".$listing."</div>
				<div style=\"width:30%;float:left\"><small class=\"wojo secondary text black\">$".$askedprice."</small></div>
				<div style=\"clear:both\"></div>";
				}

?>


				</div>
            <small>
              <a href="https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started"><strong>See more domains!</strong></a>
            </small>
			<br>
			<div style="float:left"><span class="l auction">A</span> <small class="wojo secondary text grey">- Auction&nbsp;</small></div>
			<div style="float:left"><span class="l other">F&nbsp;</span> <small class="wojo secondary text grey">- Flat rate&nbsp;</small></div>
			<div style="float:left"><span class="l danger">Adult</span> <small class="wojo secondary text grey">- <a href="https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started" title="Adult name - Please register to unlock!">Unlock!</a></small></div>
			<div style="clear:both"></div>
          </div>
        </div>
      </div>
<div class="columns mobile-50 phone-100">
        <div class="wojo photo basic card" data-weditable="true">
          <div class="wojo text content-center" style="padding-top:10px;">
<figure class="half-bottom-margin"><img class="wojo basic image" src="https://www.domainsink.com/uploads/domains-with-traffic-for-sale-domainsink-sold-icon.png" alt="Domains with traffic for sale Domainsink sold icon"></figure>
		<p>
		 <span style="font-size:22px"><strong>SOLD</strong></span><br>
		 <span style="font-size:18px;color:#cccccc"><strong>Recently sold domains</strong></span>
		</p>
		  </div>
          <div style="padding:10px;">
				<div style="width:40%;float:left"><small class="wojo secondary text"><strong>Domain</strong></small></div>
				<div style="width:15%;float:left"><small class="wojo secondary text"><strong>Hits</strong></small></div>
				<div style="width:15%;float:left"><small class="wojo secondary text"><strong>Offer</strong></small></div>
				<div style="width:30%;float:left"><small class="wojo secondary text"><strong>Price</strong></small></div>
				<div style="clear:both;"></div>
				<div style="border-top:1px solid #eeeded;padding-top:5px;border-bottom:1px solid #eeeded;padding-bottom:7px;">
<?php

				// pull sold

				$stmt = $dbConnection->prepare("SELECT * FROM parked_sold ORDER BY id DESC LIMIT 5");
				$stmt->execute();
				
				$stmt->setFetchMode(PDO::FETCH_ASSOC);

				while ($row = $stmt->fetch()) {

					$domain = $row['name'];
					$askedprice = $row['askedprice'];
					$auct = $row['auction'];
					$traffic = $row['traffic'];
					$category = $row['category'];

					$alltraffic =  explode('|',$traffic);



					if ($auct == 1) { $listing = "<span class=\"l auction\">A</span>"; } else { $listing = "<span class=\"l other\">F&nbsp;</span>";}
					if ($category == 4 || $category == 20) { $domname = "<span class=\"l danger\">Adult</span>"; } else { $domname = "<a href=\"#\" title=\"".$domain."\">".limitStrlen($domain, $length, $ellipses = true, $strip_html = true)."</a>";}
				
				echo"
				<div style=\"width:40%;float:left\"><small class=\"wojo secondary text black\">".$domname."</small></div>
				<div style=\"width:15%;float:left\"><small class=\"wojo secondary text black\">".$alltraffic[0]."</small></div>
				<div class=\"content-center\" style=\"width:15%;float:left;\">".$listing."</div>
				<div style=\"width:30%;float:left\"><small class=\"wojo secondary text black\">$".$askedprice."</small></div>
				<div style=\"clear:both\"></div>";
				}

?>


				</div>
            <small>
              <a href="https://www.domainsink.com/trck/go.php?url=https://www.domainsink.com/get-started"><strong>Find your domain!</strong></a>
            </small>
			<br>
			<div style="float:left"><span class="l auction">A</span> <small class="wojo secondary text grey">- Auction&nbsp;</small></div>
			<div style="float:left"><span class="l other">F&nbsp;</span> <small class="wojo secondary text grey">- Flat rate&nbsp;</small></div>
			<div style="float:left"><span class="l danger">Adult</span> <small class="wojo secondary text grey">- Hidden</small></div>
			<div style="clear:both"></div>
          </div>
        </div>
      </div>
 </div>
</div>
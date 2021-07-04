<?php
  /**
   * Index
   *
   * @package Wojo Framework
   * @author wojoscripts.com
   * @copyright 2016
   * @version $Id: index.tpl.php, v1.00 2016-05-05 10:12:05 gewa Exp $
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');

// generate unique tracking var for cake

$length = 50;
	$charset='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-';
	
	function randString($length, $charset)
{
    $str = '';
    $count = strlen($charset);
    while ($length--) {
        $str .= $charset[mt_rand(0, $count-1)];
    }
    return $str;
}

$trackingid = randString($length, $charset);

	if (!isset( $_COOKIE[ 't_' ] )) {
		setcookie( 't_', $trackingid, time() +2592000, '/', 'www.domainsink.com' );
	}

// get the ip

$ip = getenv('HTTP_CLIENT_IP')?:
getenv('HTTP_X_FORWARDED_FOR')?:
getenv('HTTP_X_FORWARDED')?:
getenv('HTTP_FORWARDED_FOR')?:
getenv('HTTP_FORWARDED')?:
getenv('REMOTE_ADDR');

$dbConnection = new PDO('mysql:dbname=trckcxyz_parked;host=localhost;charset=utf8', 'trckcxyz_crang', '@molecula12');
$dbConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$stmt = $dbConnection->prepare("INSERT INTO parked_visitors  
					(
					 ip,
					 trackingid
					)
				VALUES
					(:ip,
					 :trackingid
					)");
					 
		             $stmt->bindValue(':ip', $ip);
                     $stmt->bindValue(':trackingid', $trackingid);	
					 $stmt->execute();

?>
<main<?php echo Content::pageBg();?>>
  <!-- Validate page access-->
  <?php if(Content::validatePage()):?>
  <!-- Run page-->
  <?php echo Content::parseContentData($this->data->{'body' . Lang::$lang});?>
  <!-- Parse javascript -->
  <?php if ($this->data->jscode):?>
    <?php echo Validator::cleanOut(json_decode($this->data->jscode));?>
  <?php endif;?>
  <?php endif;?>
</main>
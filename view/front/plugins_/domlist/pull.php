<?php
  /**
   * Domain list pull Data
   *
   */
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
	/* special ajax here */


// DB table to use

$table = 'parked_domains';
 
// Table's primary key
$primaryKey = 'id';
 
// Array of database columns which should be read and sent back to DataTables.
// The `db` parameter represents the column name in the database, while the `dt`
// parameter represents the DataTables column identifier. In this case simple
// indexes
		function traffic($d)
		{
			$alltraffic =  explode('|',$d);
			return $alltraffic[0];
		}
		function offer($d)
		{
			if ($d == 1) { $listing = "<span class=\"l auction\">A</span>"; } else { $listing = "<span class=\"l other\">F&nbsp;</span>";}
			return $listing;
		}
		function yn($d)
		{
			if ($d == 1) { $yn = "Y"; } else { $yn = "-";}
			return $yn;
		}
		function registrar($d)
		{
			/*			if ($d == 1) { $registrar = "<div class=\"dynadot\"></div>"; }			else if ($d == 2) { $registrar = "<img src=\"https://www.domainsink.com/uploads/dynadot.png\" alt=\"Buy at Dynadot!\">"; }			else if ($d == 3) { $registrar = "<img src=\"https://www.domainsink.com/uploads/namesilo.png\" alt=\"Buy at NameSilo!\">"; }			else if ($d == 4) { $registrar = "<img src=\"https://www.domainsink.com/uploads/namesilo.png\" alt=\"Buy at NameSilo!\">"; }			else { $registrar = "<img src=\"https://www.domainsink.com/uploads/dynadot.png\" alt=\"Buy at Godaddy!\">";}			*/			$registrar = "<img src=\"https://www.domainsink.com/uploads/dan.png\" alt=\"Buy at Dan.com!\">";
			return $registrar;
		}

		function shopping($d)
		{
			if (isset($d)) {$shopping = "<i data-type=\"icon\" class=\"icon money\" style=\"color:#99cc66\"></i>"; }

			return $shopping;
		}

		function domtype($d)
		{
			if ($d == 1) { $type = "<span class=\"l regular\">RE</span>"; }
			else if ($d == 2) {$type = "<span class=\"l featured\">FE</span>";  }
			else if ($d == 3) { $type = "<span class=\"l premium\">PR</span>"; } 
			else { $type = "<span class=\"l other\">UN</span>";}

			return $type;
		}



		function shorten($d) {

		    $length = 20;
			$ellipses = true;
			$strip_html = true;

			//strip tags, if desired
			if ($strip_html) {
				$d = strip_tags($d);
			}

			//no need to trim, already shorter than trim length
			if (strlen($d) <= $length) {
				return $d;
			}

			//find last space within length
			$last_space = strrpos(substr($d, 0, $length), ' ');
			if($last_space !== false) {
				$trimmed_text = substr($d, 0, $last_space);
			} else {
				$trimmed_text = substr($d, 0, $length);
			}
			//add ellipses (...)
			if ($ellipses) {
				$trimmed_text .= '...';
			}

			return $trimmed_text;
		}

			function number_abbr($d)
			{
				$abbrevs = [12 => 'T', 9 => 'B', 6 => 'M', 3 => 'K', 0 => ''];

				foreach ($abbrevs as $exponent => $abbrev) {
					if (abs($d) >= pow(10, $exponent)) {
						$display = $d / pow(10, $exponent);
						$decimals = ($exponent >= 3 && round($display) < 100) ? 1 : 0;
						$number = number_format($display, $decimals)." ".$abbrev;
						break;
					}
					else { $number = 0;}
				}
					
				return $number;
			}

$columns = array(
    array(
        'db' => '`d`.`id`',
        'dt' => 'DT_RowId',
		'field' 	=> 'id',
        'formatter' => function( $d, $row ) {
            // Technically a DOM id cannot start with an integer, so we prefix
            // a string. This can also be useful if you have multiple tables
            // to ensure that the id is unique with a different prefix
            return 'row_'.$d;
        }
    ),
    array(
        'db'        => '`d`.`name`',
        'dt'        => 'name',
		'field' 	=> 'name',
        'formatter' => function( $d, $row ) {
            return shorten($d);
        }
    ),
	array(
        'db'        => '`d`.`hits`',
        'dt'        => 'hits',
		'field' 	=> 'hits',
        'formatter' => function( $d, $row ) {
            return $d;
        }
    ),
    array(
        'db'        => '`d`.`auction`',
        'dt'        => 'auction',
		'field' 	=> 'auction',
        'formatter' => function( $d, $row ) {
            return offer($d);
        }
    ),
    array( 'db' => '`d`.`askedprice`',
			'dt' => 'askedprice',
			'field' 	=> 'askedprice',
			'formatter' => function( $d, $row ) {
            return '$'.$d;
        } ),
    array( 'db' => '`t`.`name`', 'dt' => 'catname', 'field' => 'catname', 'as' => 'catname' ),
    array( 'db' => '`d`.`domtype`',
			'dt' => 'domtype',
			'field' 	=> 'domtype',
			'formatter' => function( $d, $row ) {
            return domtype($d);
        } ),
    array( 'db' => '`d`.`da`', 'dt' => 'da', 'field' 	=> 'da' ),
    array( 'db' => '`d`.`pa`', 'dt' => 'pa', 'field' 	=> 'pa' ),
    array( 'db' => '`d`.`juice`',
			'dt' => 'juice',
			'field' 	=> 'juice',
			'formatter' => function( $d, $row ) {
            return number_abbr($d);
        } ),
    array( 'db' => '`d`.`juiceandnojuice`',
			'dt' => 'juiceandnojuice',
			'field' 	=> 'juiceandnojuice',
			'formatter' => function( $d, $row ) {
            return number_abbr($d);
        } ),
    array( 'db' => '`d`.`alexa`',
			'dt' => 'alexa',
			'field' 	=> 'alexa',
			'formatter' => function( $d, $row ) {
            return number_abbr($d);
        } ),
    array(
        'db'        => '`d`.`dmoz`',
        'dt'        => 'dmoz',
		'field' 	=> 'dmoz',
        'formatter' => function( $d, $row ) {
            return yn($d);
        }
    ),
    array( 'db' => '`d`.`google`',
			'dt' => 'google',
			'field' 	=> 'google',
			'formatter' => function( $d, $row ) {
            return number_abbr($d);
        } ),
    array( 'db' => '`d`.`fb`',
			'dt' => 'fb',
			'field' 	=> 'fb',
			'formatter' => function( $d, $row ) {
            return number_abbr($d);
        } ),
    array( 'db' => '`d`.`archiveorg`',
			'dt' => 'archiveorg',
			'field' 	=> 'archiveorg',
			'formatter' => function( $d, $row ) {
            return number_abbr($d);
        } ),
    array( 'db' => '`d`.`registrar`',
			'dt' => 'registrar',
			'field' 	=> 'registrar',
			'formatter' => function( $d, $row ) {
            return registrar($d);
        } ),


);
 
// SQL server connection information
$sql_details = array(
    'user' => 'trckcxyz_crang',
    'pass' => '@molecula12',
    'db'   => 'trckcxyz_parked',
    'host' => 'localhost'
);
 
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * If you just want to use the basic configuration for DataTables with PHP
 * server-side, there is no need to edit below this line.
 */
 

require(dirname( __FILE__ ) . '/ssp.class.php' );
 
$joinQuery = "FROM `{$table}` AS `d` LEFT JOIN `parked_category` AS `t` ON (`t`.`id` = `d`.`category`)";
$extraCondition = "`forsale`= 1";

echo json_encode(
       SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $joinQuery, $extraCondition)
     );

} else {

die('Direct access to this location is not allowed.');

}
  
?>
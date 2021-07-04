<?php

$domain = $_GET['url'];


function getPagesIndexedGoogle($domain)
		{
			if ($domain) {
				$curl = curl_init();
				curl_setopt_array($curl, array(
					CURLOPT_HEADER => 0,
					CURLOPT_RETURNTRANSFER => 1,
					CURLOPT_URL => "https://www.google.com/search?q=site:".$domain."&amp;gws_rd=ssl",
					CURLOPT_SSL_VERIFYPEER=> false,
					CURLOPT_USERAGENT => 'Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko'
				));
				$result_string = curl_exec($curl);
				curl_close($curl);
				if (strpos($result_string, "did not match any documents") !== false) {
					return 0;
				} else {
				   preg_match("/about ([0-9,]{0,12})/i", $result_string, $matches);
						if (!$matches[1]) { preg_match("/([0-9,]{0,12}) result/i", $result_string, $matches); }

					$indexed = str_replace( ',', '', $matches[1]);

					return $indexed;
				}
			}
		}


		$google = getPagesIndexedGoogle($domain);
echo $google;

?>
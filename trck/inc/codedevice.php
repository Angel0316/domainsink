<?php

// code device
		
		$detect = new Mobile_Detect();
		if ($detect->isMobile()) {
			// any mobile platform
			$device = "p"; // phone
		}
		elseif($detect->isTablet()){
			// any tablet
			$device = "t"; // tablet
		}
		else {
		
		// desktop
		$device = "d"; // desktop
			
		}

?>
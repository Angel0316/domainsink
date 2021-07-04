<?php

$to      = 'momchilan@gmail.com';
					$subject = 'Shared content';
					$message = 'fb';
					$headers = 'From: Share <user@trckb.club>' . "\r\n" . 'Reply-To: user@trckb.club' . "\r\n" . 'X-Mailer: PHP/' . phpversion();
					mail($to, $subject, $message, $headers, '-fuser@trckb.club');
?>

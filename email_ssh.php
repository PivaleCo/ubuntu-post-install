<?php

$from_user = $GLOBALS['argv'][1];
$admin_user = $GLOBALS['argv'][2];

$user = exec('echo $USER');
$host = `cat /etc/hostname`;

$to      = $admin_user;
$subject = 'New SSH key for ' . $user . '@' . $host;
$message = `cat ~/.ssh/id_rsa.pub`;
$headers = $from_user . "\r\n";
$headers .= 'To: ' . $to . "\r\n";

mail($to, $subject, $message, $headers);

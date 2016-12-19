<?php
require_once 'hostel_api.php';

$cartaAPI = new HostelApi($_REQUEST['request']);
echo $cartaAPI->processAPI();
?>

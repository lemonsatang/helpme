<?php 

	include 'database.php';

	$id = $_POST['id'];
    $seq = $_POST['seq'];

	$link->query("DELETE FROM geonjuck_d WHERE id = '".$id."' and seq = '".$seq."'" );
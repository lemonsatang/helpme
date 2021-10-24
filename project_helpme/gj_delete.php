<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM geonjuck_m WHERE id = '".$id."'");
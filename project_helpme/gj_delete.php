<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM gj_m WHERE id = '".$id."'");
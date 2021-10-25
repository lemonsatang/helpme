<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM kj_m WHERE id = '".$id."'");
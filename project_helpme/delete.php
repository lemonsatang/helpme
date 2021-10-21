<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM crt_dft WHERE id = '".$id."'");
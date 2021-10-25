<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM crt_dft_d WHERE id = '".$id."'");
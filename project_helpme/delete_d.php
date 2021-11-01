<?php 

	include 'database.php';

	$id = $_POST['ID'];
	$seq = $_POST['SEQ'];

	$tsql = "DELETE FROM crt_dft_d WHERE ID = '".$id."' and SEQ = '".$seq."'";
	$getResults = sqlsrv_query($link, $tsql);
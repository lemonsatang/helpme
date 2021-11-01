<?php 

	include 'database.php';

	$pdcod = $_POST['PDCOD'];

	$tsql = "DELETE FROM kj_d WHERE PDCOD = '".$pdcod."'";
	$getResults = sqlsrv_query($link, $tsql);
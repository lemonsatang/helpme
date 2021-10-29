<?php 

include 'database.php';

	$keyword = $_POST['KEYWORD'];

	$tsql = "SELECT * FROM kj_d where ID = '".$id."'";
	$getResults = sqlsrv_query($link, $tsql);

	if ($getResults == FALSE)
    die(FormatErrors(sqlsrv_errors()));

	$resultArray = array();

	while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
		$resultArray[] = $row;
	}

	echo json_encode($resultArray);
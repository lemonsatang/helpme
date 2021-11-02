<?php 

include 'database.php';

	$id = $_POST['ID'];

	$tsql = "SELECT ROW_NUMBER() OVER(ORDER BY pdcod) AS NUM  ,* FROM crt_dft_d where ID = '".$id."'";
	$getResults = sqlsrv_query($link, $tsql);

	if ($getResults == FALSE)
    die(FormatErrors(sqlsrv_errors()));

	$resultArray = array();

	while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
		$resultArray[] = $row;
	}

	echo json_encode($resultArray);

?>
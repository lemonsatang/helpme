<?php 

include 'database.php';

	$keyword = $_POST['KEYWORD'];

	$query = $link->query("SELECT * FROM crt_dft WHERE (COMP LIKE '%".$keyword."%' or C_CODE LIKE '%".$keyword."%') ORDER BY ID DESC");
	
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}

	echo json_encode($result);
<?php 

include 'database.php';

	$keyword = $_POST['KEYWORD'];

	$query = $link->query("SELECT * FROM kj_m WHERE (COMP LIKE '%".$keyword."%' or C_CODE LIKE '%".$keyword."%') ORDER BY ID DESC");

	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}

	echo json_encode($result);
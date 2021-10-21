<?php 

include 'database.php';

	$query = $link->query("SELECT * FROM crt_dft ORDER BY ID DESC" );
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}

	echo json_encode($result);
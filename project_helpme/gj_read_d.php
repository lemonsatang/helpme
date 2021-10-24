<?php 

include 'database.php';

    $id = $_POST['ID'];

	$query = $link->query("SELECT * FROM geonjuck_d where ID = '".$id."' ORDER BY ID DESC" );
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}

	echo json_encode($result);
<?php 

include 'database.php';

    $pdcod = $_POST['PDCOD'];

	$query = $link->query("SELECT * FROM crt_dft_d where PDCOD = '".$pdcod."'");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}

	echo json_encode($result);
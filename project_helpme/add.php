<?php 

	include 'database.php';

	$comp = $_POST['COMP'];
	$c_code = $_POST['C_CODE'];
	$j_bunho = $_POST['J_BUNHO'];
	$phone = $_POST['PHONE'];
	$fax = $_POST['FAX'];
	$usrnm = $_POST['USRNM'];
	$i_jogun = $_POST['I_JOGUN'];
	$j_jogun = $_POST['J_JOGUN'];
	$gunsoo = $_POST['GUNSOO'];
	$sryang = $_POST['SRYANG'];
	$jryang = $_POST['JRYANG'];
	$bigo = $_POST['BIGO'];
	$cdate = date("Y-m-d", time());
	$cuser = $_POST['CUSER'];
	$temp = $_POST['TEMP'];

	$query = "SELECT ISNULL(MAX(ID), 0)+1 as ID FROM crt_dft";
	$getResults = sqlsrv_query($link, $query);
	
	$result = array();

	while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
		$result[] = $row;
	}

	echo json_encode($result[0]['ID']);
	$ID = $result[0]['ID'];

	$tsql = "INSERT INTO crt_dft (ID,COMP,C_CODE,J_BUNHO,PHONE,FAX,USRNM,I_JOGUN,J_JOGUN,GUNSOO,SRYANG,JRYANG,BIGO,CDATE,CUSER,TEMP)
	VALUES ('".$ID."','".$comp."','".$c_code."','".$j_bunho."','".$phone."','".$fax."','".$usrnm."','".$i_jogun."','".$j_jogun."','".$gunsoo."','".$sryang."','".$jryang."','".$bigo."','".$cdate."','".$cuser."','".$temp."')";

	$getResult = sqlsrv_query($link, $tsql);

?>
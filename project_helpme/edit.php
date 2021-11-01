<?php 

	include 'database.php';

	$id = $_POST['ID'];
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
	$mdate = date("Y-m-d", time());
	$muser = $_POST['MUSER'];
	$temp = $_POST['TEMP'];

	$tsql = "UPDATE crt_dft 
	SET COMP = '".$comp."'
	, C_CODE = '".$c_code."'
	, J_BUNHO = '".$j_bunho."'
	, PHONE = '".$phone."'
	, FAX = '".$fax."'
	, USRNM = '".$usrnm."'
	, I_JOGUN = '".$i_jogun."'
	, J_JOGUN = '".$j_jogun."'
	, GUNSOO = '".$gunsoo."'
	, SRYANG = '".$sryang."'
	, JRYANG = '".$jryang."'
	, BIGO = '".$bigo."'
	, mdate = '".$mdate."' 
	, muser = '".$muser."' 
	, temp = '".$temp."' 
	WHERE ID = '".$id."'";

	$getResults = sqlsrv_query($link, $tsql);

?>
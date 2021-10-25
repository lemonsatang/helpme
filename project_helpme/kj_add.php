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

	$link->query("INSERT INTO kj_m(COMP,C_CODE,J_BUNHO,PHONE,FAX,USRNM,I_JOGUN,J_JOGUN,GUNSOO,SRYANG,JRYANG,BIGO,CDATE,CUSER,TEMP)
	VALUES('".$comp."','".$c_code."','".$j_bunho."','".$phone."','".$fax."','".$usrnm."','".$i_jogun."','".$j_jogun."','".$gunsoo."','".$sryang."','".$jryang."','".$bigo."','".$cdate."','".$cuser."','".$temp."')");
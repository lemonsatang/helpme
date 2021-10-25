<?php 

	include 'database.php';

	$pdcod = $_POST['PDCOD'];
	$seq = $_POST['SEQ'];
	$comp = $_POST['COMP'];
	$c_code = $_POST['C_CODE'];
	$pdnm = $_POST['PDNM'];
	$maker = $_POST['MAKER'];
	$jaejil = $_POST['JAEJIL'];
	$size = $_POST['SIZE'];
	$choolgo = $_POST['CHOOLGO'];
	$sryang = $_POST['SRYANG'];
	$unit = $_POST['UNIT'];
	$u_jryang = $_POST['U_JRYANG'];
	$jryang = $_POST['JRYANG'];
	$bigo = $_POST['BIGO'];
	$cdate = date("Y-m-d", time());
	$cuser = $_POST['CUSER'];

	$link->query("INSERT INTO crt_dft_d(PDCOD,SEQ,COMP,C_CODE,PDNM,MAKER,JAEJIL,SIZE,CHOOLGO,SRYANG,UNIT,U_JRYANG,JRYANG,BIGO,CUSER)
	VALUES('".$pdcod."','".$seq."','".$comp."','".$c_code."','".$pdnm."','".$maker."','".$jaejil."','".$size."','".$choolgo."','".$sryang."','".$unit."','".$u_jryang."','".$jryang."','".$bigo."','".$cdate."','".$cuser."')");
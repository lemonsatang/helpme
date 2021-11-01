<?php 

	include 'database.php';

	$pdcod = $_POST['PDCOD'];
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
	$mdate = date("Y-m-d", time());
	$muser = $_POST['MUSER'];

	$tsql = "UPDATE crt_dft_d
					SET COMP = '".$comp."'
					, C_CODE = '".$c_code."'
					, PDNM = '".$pdnm."'
					, MAKER = '".$maker."'
					, JAEJIL = '".$jaejil."'
					, SIZE = '".$size."'
					, CHOOLGO = '".$choolgo."'
					, SRYANG = '".$sryang."'
					, UNIT = '".$unit."'
					, U_JRYANG = '".$u_jryang."'
					, JRYANG = '".$jryang."'
					, BIGO = '".$bigo."'
					, mdate = '".$mdate."' 
					, muser = '".$muser."' 
					WHERE PDCOD = '".$pdcod."'
					";

	$getResults = sqlsrv_query($link, $tsql);

?>
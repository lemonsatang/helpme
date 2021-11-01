<?php 

	include 'database.php';

	$id = $_POST['ID'];
    $pdcod = $_POST['PDCOD'];
	$pdnm = $_POST['PDNM'];
	$maker = $_POST['MAKER'];
	$jaejil = $_POST['JAEJIL'];
	$size = $_POST['SIZE'];
	$choolgo = $_POST['CHOOLGO'];
	$sryang = $_POST['SRYANG'];
	$unit = $_POST['UNIT'];
	$u_jryang = $_POST['U_JRYANG'];
	$jryang = $_POST['JRYANG'];
    $danga = $_POST['DANGA'];
    $udanga = $_POST['UDANGA'];
    $gonggup = $_POST['GONGGUP'];
    $booga = $_POST['BOOGA'];
    $hapgye = $_POST['HAPGYE'];
	$bigo = $_POST['BIGO'];
	$mdate = date("Y-m-d", time());
	$muser = $_POST['CUSER'];

	$tsql = "UPDATE kj_d
					SET PDNM = '".$pdnm."'
					, MAKER = '".$maker."'
					, JAEJIL = '".$jaejil."'
					, SIZE = '".$size."'
					, CHOOLGO = '".$choolgo."'
					, SRYANG = '".$sryang."'
					, UNIT = '".$unit."'
					, U_JRYANG = '".$u_jryang."'
					, JRYANG = '".$jryang."'
					, DANGA = '".$danga."'
					, UDANGA = '".$udanga."'
					, GONGGUP = '".$gonggup."'
					, BOOGA = '".$booga."'
					, HAPGYE = '".$hapgye."'
					, BIGO = '".$bigo."'
					, mdate = '".$mdate."' 
					, muser = '".$muser."' 
					WHERE PDCOD = '".$pdcod."'
					";

	$getResults = sqlsrv_query($link, $tsql);

?>
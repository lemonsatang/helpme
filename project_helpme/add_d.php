<?php 

	include 'database.php';

	$id = $_POST['ID'];
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

	$query = $link->query("SELECT IFNULL(MAX(SEQ), 0)+1 as SEQ FROM crt_dft_d WHERE ID='".$id."'");

	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}
	echo json_encode($result[0]['SEQ']);
	$seq = $result[0]['SEQ'];

	$link->query("INSERT INTO crt_dft_d(ID,SEQ,COMP,C_CODE,PDNM,MAKER,JAEJIL,SIZE,CHOOLGO,SRYANG,UNIT,U_JRYANG,JRYANG,BIGO,CDATE,CUSER)
					VALUES('".$id."','".$seq."','".$comp."','".$c_code."','".$pdnm."','".$maker."','".$jaejil."','".$size."','".$choolgo."','".$sryang."','".$unit."','".$u_jryang."','".$jryang."','".$bigo."','".$cdate."','".$cuser."')");


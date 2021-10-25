<?php 

	include 'database.php';

	$id = $_POST['ID'];
	$j_bunho = $_POST['J_BUNHO'];
	$kj_ilja = $_POST['KJ_ILJA'];
	$c_code = $_POST['C_CODE'];
	$comp = $_POST['COMP'];
	$projno = $_POST['PROJNO'];
	$soosin = $_POST['SOOSIN'];
	$chamjo = $_POST['CHAMJO'];
	$phone = $_POST['PHONE'];
	$fax = $_POST['FAX'];
	$usrnm = $_POST['USRNM'];
	$i_jogun = $_POST['I_JOGUN'];
	$j_jogun = $_POST['J_JOGUN'];
	$nabgi = $_POST['NABGI'];
	$yoohyo = $_POST['YOOHYO'];
	$gunsoo = $_POST['GUNSOO'];
	$sryang = $_POST['SRYANG'];
	$jryang = $_POST['JRYANG'];
	$gonhggup = $_POST['GONGGUP'];
	$booga = $_POST['BOOGA'];
	$hapgye = $_POST['HAPGYE'];
	$bigo = $_POST['BIGO'];
	$mdate = date("Y-m-d", time());
	$muser = $_POST['MUSER'];
	$temp = $_POST['TEMP'];

	$link->query("UPDATE kj_m 
					SET , J_BUNHO = '".$j_bunho."'
					, COMP = '".$comp."'
					, KJ_ILJA = '".$kj_ilja."'
					, COMP = '".$comp."'
					, PROJNO = '".$projno."'
					, SOOSIN = '".$soosin."'
					, CHAMJO = '".$chamjo."'
					, PHONE = '".$phone."'
					, FAX = '".$fax."'
					, USRNM = '".$usrnm."'
					, I_JOGUN = '".$i_jogun."'
					, J_JOGUN = '".$j_jogun."'
					, NABGI = '".$nabgi."'
					, YOOHYO = '".$yoohyo."'
					, GUNSOO = '".$gunsoo."'
					, SRYANG = '".$sryang."'
					, JRYANG = '".$jryang."'
					, GONGGUP = '".$gonhggup."'
					, BOOGA = '".$booga."'
					, HAPGYE = '".$hapgye."'
					, BIGO = '".$bigo."'
					, mdate = '".$mdate."' 
					, muser = '".$muser."' 
					, temp = '".$temp."' 
					WHERE ID = '".$id."'
					ORDER BY ID DESC");

?>
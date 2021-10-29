<?php 

	include 'database.php';

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
	$cdate = CONVERT([varchar](20),getdate(),(120));
	$cuser = $_POST['CUSER'];
	$temp = $_POST['TEMP'];

	$tsql = "INSERT INTO kj_m(J_BUNHO
							, KJ_ILJA
							, C_CODE
							, COMP
							, PROJNO
							, SOOSIN
							, CHAMJO
							, PHONE
							, FAX
							, USRNM 
							, I_JOGUN
							, J_JOGUN
							, NABGI
							, YOOHYO
							, GUNSOO
							, SRYANG
							, JRYANG
							, GONGGUP
							, BOOGA
							, HAPGYE
							, BIGO
							, CDATE
							, CUSER
							, TEMP)
					VALUES('".$j_bunho."'
						, '".$kj_ilja."'
						, '".$c_code."'
						, '".$comp."'
						, '".$projno."'
						, '".$soosin."'
						, '".$chamjo."'
						, '".$phone."'
						, '".$fax."'
						, '".$usrnm."'
						, '".$i_jogun."'
						, '".$j_jogun."'
						, '".$nabgi."'
						, '".$yoohyo."'
						, '".$gunsoo."'
						, '".$sryang."'
						, '".$jryang."'
						, '".$gonggup."'
						, '".$booga."'
						, '".$hapgye."'
						, '".$bigo."'
						, '".$cdate."'
						, '".$cuser."'
						, '".$temp."')";

	$getResults = sqlsrv_query($link, $tsql);
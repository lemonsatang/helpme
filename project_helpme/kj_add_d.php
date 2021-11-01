<?php 

	include 'database.php';

	$id = $_POST['ID'];
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
	$cdate = date("Y-m-d", time());
	$cuser = $_POST['CUSER'];

	$query = "SELECT ISNULL(MAX(SEQ), 0)+1 as SEQ , ISNULL(MAX(PDCOD), 0)+1 as PDCOD FROM kj_d WHERE ID='".$id."'";
	$getResults = sqlsrv_query($link, $query);

	$result = array();

	while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
		$result[] = $row;
	}

	echo json_encode($result[0]['SEQ']);
	$seq = $result[0]['SEQ'];

	echo json_encode($result[0]['PDCOD']);
	$pdcod = $result[0]['PDCOD'];

	$tsql = "INSERT INTO kj_d (PDCOD
                                , ID
                                , SEQ
                                , PDNM
                                , MAKER
                                , JAEJIL
                                , SIZE
                                , CHOOLGO
                                , SRYANG
                                , UNIT
                                , U_JRYANG
                                , JRYANG
                                , DANGA
                                , UDANGA
                                , GONGGUP
                                , BOOGA
                                , HAPGYE
                                , BIGO
                                , CDATE
                                , CUSER)
					    VALUES ('".$pdcod."'
                            , '".$id."'
                            , '".$seq."'
                            , '".$pdnm."'
                            , '".$maker."'
                            , '".$jaejil."'
                            , '".$size."'
                            , '".$choolgo."'
                            , '".$sryang."'
                            , '".$unit."'
                            , '".$u_jryang."'
                            , '".$jryang."'
                            , '".$danga."'
                            , '".$udanga."'
                            , '".$gonggup."'
                            , '".$booga."'
                            , '".$hapgye."'
                            , '".$bigo."'
                            , '".$cdate."'
                            , '".$cuser."')";

    $getResult = sqlsrv_query($link, $tsql);

?>
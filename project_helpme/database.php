<?php 

	$serverName = "112.216.189.178, 12501";
	$connectionInfo = array(
		"CharacterSet" => "UTF-8",
		"Database" => "NK_FLUTTER", // 데이터베이스명
		"UID" => "pineit", // 유저 아이디
		"PWD" => "pineit0401", // 유저 비번
	);

	$link = sqlsrv_connect($serverName, $connectionInfo); 

?>
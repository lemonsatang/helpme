<?php 

	$serverName = "112.216.189.178, 12501";
	$connectionInfo = array(
		"CharacterSet" => "UTF-8",
		"Database" => "NK_FLUTTER", // 데이터베이스명
		"UID" => "pineit", // 유저 아이디
		"PWD" => "pineit0401", // 유저 비번
	);

	$link = sqlsrv_connect($serverName, $connectionInfo); 

	// $hostname = 'localhost';
	// $username = 'root';
	// $pass = '';
	// $dbname = 'helpme';

	// $link = new mysqli($hostname,$username,$pass,$dbname);
	// MySQL 접속

	// if ($link) {
	// 	echo "연결 성공!" . PHP_EOL;
	// } else {
	// 	echo "망함 ㅠㅠ" . PHP_EOL;
	// 	die( print_r( sqlsrv_errors(), true));
	// }

?>
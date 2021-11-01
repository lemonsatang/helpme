<?php 

	include 'database.php';

	$id = $_POST['id'];

	$query = "DELETE FROM crt_dft WHERE id = '".$id."'";
	$getResults = sqlsrv_query($link, $query);

?>
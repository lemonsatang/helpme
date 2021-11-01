<?php 

	include 'database.php';

	$id = $_POST['id'];

	$query = "DELETE FROM kj_m WHERE id = '".$id."'";
	$getResults = sqlsrv_query($link, $query);

?>
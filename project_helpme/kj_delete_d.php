<?php 

	include 'database.php';

    $pdcod = $_POST['PDCOD'];

	$link->query("DELETE FROM kj_d WHERE PDCOD = '".$pdcod."'");
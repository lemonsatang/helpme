<?php 

	include 'database.php';

	$id = $_POST['ID'];
	$seq = $_POST['SEQ'];

	$link->query("DELETE FROM crt_dft_d WHERE ID = '".$id."' and SEQ = '".$seq."'");
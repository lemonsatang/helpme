<?php 

	include 'database.php';

	$id = $_POST['id'];
    $seq = $_POST['seq'];

	$link->query("DELETE FROM kj_d WHERE id = '".$id."' and seq = '".$seq."'" );
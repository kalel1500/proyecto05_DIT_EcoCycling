<?php

	$ip='localhost';
	$user='root';
	$password='';
	$bd_name='bd_proyecto_5';

	$database = new mysqli($ip, $user, $password, $bd_name);
	$database->query("SET NAMES 'utf8'");
	
	if($database->connect_errno) {
		die("No se pudo conectar a la base de datos");
	}

	try {
		$conn = new PDO("mysql:host=$ip;dbname=$bd_name;", $user, $password);
	} catch (PDOException $e) {
		die('Connection Failed: ' . $e->getMessage());
	}

	session_start();

?>
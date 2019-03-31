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

	$link = mysqli_connect($ip, $user, $password, $bd_name) or die();
	$acentos = $link->query("SET NAMES 'utf8'");

	define('IP', 'localhost');
	define('USER', 'root');
	define('PASSWORD', '');
	define('DB', 'bd_proyecto_5');

	global $con;
  	$con = new mysqli(IP,USER,PASSWORD,DB);

	if (!$link) {
		echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
		echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
		echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
		exit;
	}

	try {
		$conn = new PDO("mysql:host=$ip;dbname=$bd_name;", $user, $password);
	} catch (PDOException $e) {
		die('Connection Failed: ' . $e->getMessage());
	}

	session_start();

?>
<?php
	error_reporting(0);

	session_start();

	$_SESSION['ecoccycling_user_id'] = 5;

	/*-----------------------------------------------------------------------------------------------------*/
	/*-----------------------------------------------------------------------------------------------------*/
	
	include "funciones.proc.php";
	
	$query = "SELECT * FROM `tbl_usuario` WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecoccycling_user_id]";
	
	datos_json($query);
?>
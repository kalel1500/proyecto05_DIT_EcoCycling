<?php
	error_reporting(0);

	session_start();

	include "funciones.proc.php";
	
	$query = "SELECT * FROM `tbl_usuario` WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id]";
	
	datos_json($query);
?>
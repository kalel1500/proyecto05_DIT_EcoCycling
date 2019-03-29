<?php
	error_reporting(0);

	session_start();

	include "funciones.proc.php";

	$query = "SELECT * FROM `tbl_foto` WHERE `tbl_foto`.`nivel_id` <= (SELECT nivel_id FROM `tbl_nivel` WHERE `tbl_nivel`.`nivel_numero` = (SELECT `tbl_nivel`.`nivel_numero` FROM `tbl_usuario` INNER JOIN `tbl_nivel` ON `tbl_usuario`.`nivel_id` = `tbl_nivel`.`nivel_id` WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id]))";
	
	datos_json($query);
?>
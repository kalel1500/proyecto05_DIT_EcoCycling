<?php
	session_start();

	/*---- conexion ----*/
	$ip='localhost';
	$user='root';
	$password='';
	$bd_name='bd_proyecto_5';

	$database = new mysqli($ip, $user, $password, $bd_name);
	$database->query("SET NAMES 'utf8'");
	
	if($database->connect_errno) {
		die("No se pudo conectar a la base de datos");
	}
	/*---- fin conexion ----*/
	
	$usuario = $_REQUEST['inp_usuario'];
	$nombre = $_REQUEST['inp_nombre'];
	$apellido = $_REQUEST['inp_apellido'];
	$correo = $_REQUEST['inp_correo'];
	$sexo = $_REQUEST['inp_sexo'];
	$foto = $_REQUEST['inp_foto'];
	$pass = $_REQUEST['inp_new_pas'];
	$existePass = $_REQUEST['existePass'];
	
	
	if ($existePass == "si") {
		$password = password_hash($pass, PASSWORD_BCRYPT);
		$query = "UPDATE `tbl_usuario` SET `usuario_usuario` = '$usuario', `usuario_nombre` = '$nombre', `usuario_apellido` = '$apellido', `usuario_email` = '$correo', `usuario_contrasena` = '$password', `usuario_sexo` = '$sexo', `foto_id` = '$foto' WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id]";
	} else {
		$query = "UPDATE `tbl_usuario` SET `usuario_usuario` = '$usuario', `usuario_nombre` = '$nombre', `usuario_apellido` = '$apellido', `usuario_email` = '$correo', `usuario_sexo` = '$sexo', `foto_id` = '$foto' WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id]";
	}

	$database->query($query)
	
	
?>
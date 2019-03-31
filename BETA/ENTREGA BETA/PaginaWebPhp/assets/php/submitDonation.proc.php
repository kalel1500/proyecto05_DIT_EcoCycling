<?php
	require "conexion.php";
	//session_start();
	$pay = $_POST['donation'];
	$org = $_POST['org'];
	$id = $_SESSION['ecocycling_user_id'];

	$sql = "SELECT `usuario_fondosTotales` FROM `tbl_usuario` WHERE `tbl_usuario`.`usuario_id` = $id";
	$result = $con->query($sql);
	$row = $result->fetch_assoc();
	$dineroActual = round($row['usuario_fondosTotales']);
	
	if ($pay > $dineroActual) {
		$msg_error = "No puedes donar mas dinero del que dispones.";
		header("Location: ../../donations.php?msg_error=$msg_error&nom_org=$org");
	} else {
		$sql = "UPDATE tbl_entidad SET entidad_dineroActual = (entidad_dineroActual+$pay) WHERE entidad_nombre = '$org'";
		$data = $con -> query($sql);
		$sql = "UPDATE tbl_usuario SET usuario_fondosTotales = (usuario_fondosTotales-$pay) WHERE usuario_id = $id";
		$data = $con -> query($sql);
		header("Location: ../../donations.php");
	}
?>

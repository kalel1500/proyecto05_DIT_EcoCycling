<?php
	//session_start();

	include "conexion.php";


	/*query 1-------------------------------*/
	$km = $_REQUEST['inp_aumentar'];
	$fechaInicio = time()-random_int(1800, 3600);
	$fechaIFin = time();
	$query = "INSERT INTO `tbl_historial` (`historial_fechaInicio`, `historial_fechaFin`, `historial_kilometros`, `usuario_id`, `bicicleta_id`) VALUES ('$fechaInicio', '$fechaIFin', $km, $_SESSION[ecocycling_user_id], 1);";
	$database->query($query);


	/*query 2-------------------------------*/
	$sql ="SELECT SUM(`tbl_historial`.`historial_kilometros`) AS 'kilometros_totales' FROM `tbl_usuario` INNER JOIN `tbl_historial` ON `tbl_usuario`.`usuario_id` = `tbl_historial`.`usuario_id` WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id] GROUP BY `tbl_usuario`.`usuario_id`";
	$consulta=mysqli_query($link, $sql);
	$array = mysqli_fetch_array($consulta);
	$kilometros_totales = $array['kilometros_totales'];


	/*query 3-------------------------------*/
	$query = "SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_kilometros` <= $kilometros_totales ORDER BY `nivel_numero` DESC LIMIT 1";
	$consulta=mysqli_query($link, $query);
	$array = mysqli_fetch_array($consulta);
	$nivel_id = $array['nivel_id'];


	/*query 4-------------------------------*/
	$hoy = date("Y-m-d");

	$fechaLast = new DateTime("$hoy 23:59:50");
	$fechaLast->modify('last day of this month');
	$ultimoDia = strtotime($fechaLast->format('Y-m-d H:i:s'));

	$fechaFirst = new DateTime("$hoy 00:00:00");
	$fechaFirst->modify('first day of this month');
	$primerDia = strtotime($fechaFirst->format('Y-m-d H:i:s'));

	$sql2 ="SELECT `tbl_usuario`.`usuario_fondosMensuales`, `tbl_usuario`.`usuario_fondosTotales`, SUM(`tbl_historial`.`historial_kilometros`) AS 'kilometros_mensuales' FROM `tbl_usuario` INNER JOIN `tbl_historial` ON `tbl_usuario`.`usuario_id` = `tbl_historial`.`usuario_id` WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id] AND `tbl_historial`.`historial_fechaFin` >= $primerDia AND `tbl_historial`.`historial_fechaFin` <= $ultimoDia GROUP BY `tbl_usuario`.`usuario_id`";

	$consulta2=mysqli_query($link, $sql2);
	$array2 = mysqli_fetch_array($consulta2);
	$kilometros_mensuales = $array2['kilometros_mensuales'];
	$fTotales = $array2['usuario_fondosTotales'];
	$fMensuales = $array2['usuario_fondosMensuales'];

	/*echo "<br>";
	echo "<br>";
	echo "Ultimo dia del mes: $ultimoDia";
	echo "<br>";
	echo "Primer dia del mes: $primerDia";
	echo "<br>";*/

	/*--------------------version 1---------------------------------------*/
	/*$fondos = 0;
	if ($kilometros_mensuales >= 15) {
		$fondos += 1;
	}
	if ($kilometros_mensuales >= 30) {
		$fondos += 1;
	}
	if ($kilometros_mensuales >= 45) {
		$fondos += 1;
	}
	if ($kilometros_mensuales >= 60) {
		$fondos += 1;
	}
	if ($kilometros_mensuales >= 75) {
		$fondos += 1;
	}*/
	/*--------------------version 2---------------------------------------*/
	/*$puntos = 0;
	if ($kilometros_mensuales <= 100) {
		$puntos = intval($kilometros_mensuales/20);
		$fondos_actuales = intval($kilometros_mensuales/20);
	} else {
		$fondos_actuales = 5;
	}*/
	/*--------------------version 3---------------------------------------*/
	$puntos = intval($kilometros_mensuales/20);
	if ($kilometros_mensuales > 100) {
		$puntos = 5;
		//echo "llega";
	}

	$fondosMensuales = $puntos;

	/*echo "<br>";
	echo "$puntos";
	echo "<br>";
	echo "$fondosMensuales";
	echo "<br>";
	echo "Kilometros mensuales: $kilometros_mensuales";
	echo "<br>";*/
	
	$query = "UPDATE `tbl_usuario` SET `usuario_fondosMensuales` = $fondosMensuales, `nivel_id` = $nivel_id WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id];";
	$database->query($query);

	header("Location: ../../home.php");
	
	
?>
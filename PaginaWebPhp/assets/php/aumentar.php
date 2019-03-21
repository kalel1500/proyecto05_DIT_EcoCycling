<?php
	//session_start();

	include "conexion.php";


	/*query 1-------------------------------*/
	$km = $_REQUEST['inp_aumentar'];
	$fechaInicio = time();
	$fechaIFin = time()+random_int(1800, 21600);
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
	$fecha = new DateTime();
	$fecha->modify('last day of this month');
	$ultimoDia = strtotime($fecha->format('Y-m-d H:i:s'));
	$fecha->modify('first day of this month');
	$primerDia = strtotime($fecha->format('Y-m-d H:i:s'));

	$sql2 ="SELECT SUM(`tbl_historial`.`historial_kilometros`) AS 'kilometros_mensuales' FROM `tbl_usuario` INNER JOIN `tbl_historial` ON `tbl_usuario`.`usuario_id` = `tbl_historial`.`usuario_id` WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id] AND `tbl_historial`.`historial_fechaFin` >= $primerDia AND `tbl_historial`.`historial_fechaFin` <= $ultimoDia GROUP BY `tbl_usuario`.`usuario_id`";

	$consulta2=mysqli_query($link, $sql2);
	$array2 = mysqli_fetch_array($consulta2);
	$kilometros_mensuales = $array2['kilometros_mensuales'];


	$fondos = 0;
	if ($kilometros_mensuales >= 50) {
		$fondos += 1;
	}
	if ($kilometros_mensuales >= 100) {
		$fondos += 1;
	}
	if ($kilometros_mensuales >= 150) {
		$fondos += 1;
	}
	if ($kilometros_mensuales >= 200) {
		$fondos += 1;
	}
	if ($kilometros_mensuales >= 250) {
		$fondos += 1;
	}
	$query = "UPDATE `tbl_usuario` SET `usuario_fondos` = $fondos, `nivel_id` = $nivel_id WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id];";
	$database->query($query);

	//echo "$query";
	header("Location: ../../home.php");
	
	
?>
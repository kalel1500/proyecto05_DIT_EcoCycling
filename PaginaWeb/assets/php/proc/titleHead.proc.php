<?php

	if (!isset($_SESSION['user_id'])) {
		if (isset($_REQUEST['mostrar'])) {
			$mostrar=$_REQUEST['mostrar'];
			switch ($mostrar) {
				case 'login':
					echo "<title>Inicia sesion</title>";
					break;
				case 'singup':
					echo "<title>Registrate</title>";
					break;
				default:
					echo "<title>EcoCycling</title>";
					break;
			}
		} else {
			echo "<title>Inicia sesion</title>";
		}

	} else {

		if (isset($_REQUEST['mostrar'])) {
			$mostrar=$_REQUEST['mostrar'];
			switch ($mostrar) {
				case 'datos':
					echo "<title>Mis datos</title>";
					break;
				case 'tops':
					echo "<title>Tops</title>";
					break;
				default:
					echo "<title>EcoCycling</title>";
					break;
			}
		} else {
			echo "<title>Mis datos</title>";
		}
	}
		
?>
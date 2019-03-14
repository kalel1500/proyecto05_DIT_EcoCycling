<?php

	if (!isset($_SESSION['user_id'])) {
		
		if (isset($_REQUEST['mostrar'])) {
			switch ($_REQUEST['mostrar']) {
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
			switch ($_REQUEST['mostrar']) {
				case 'datos':
					echo "<title>Mis datos</title>";
					break;
				case 'tops':
					echo "<title>Tops</title>";
					break;
				case 'perfil':
					echo "<title>Perfil</title>";
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
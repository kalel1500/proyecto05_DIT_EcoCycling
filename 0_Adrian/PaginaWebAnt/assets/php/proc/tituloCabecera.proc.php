<?php
	
	if (!isset($_SESSION['user_id'])) {

		if (isset($_REQUEST['mostrar'])) {
			switch ($_REQUEST['mostrar']) {
				case 'login':
					echo "<h1 class='cabecera'>Inicia sesion</h1>";
					break;
				case 'singup':
					echo "<h1 class='cabecera'>Registrate</h1>";
					break;
				default:
					echo "<h1 class='cabecera'>EcoCycling</h1>";
					break;
			}
		} else {
			echo "<h1 class='cabecera'>Inicia sesion</h1>";
		}

	} else {

		if (isset($_REQUEST['mostrar'])) {
			switch ($_REQUEST['mostrar']) {
				case 'datos':
					echo "<h1 class='cabecera'>Mis datos</h1>";
					break;
				case 'tops':
					echo "<h1 class='cabecera'>Tops</h1>";
					break;
				case 'perfil':
					echo "<h1 class='cabecera'>Perfil</h1>";
					break;
				default:
					echo "<h1 class='cabecera'>EcoCycling</h1>";
					break;
			}
		} else {
			echo "<h1 class='cabecera'>Mis datos</h1>";
		}
		
	}

?>
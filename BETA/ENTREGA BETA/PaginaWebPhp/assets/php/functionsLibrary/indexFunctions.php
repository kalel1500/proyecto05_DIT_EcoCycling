<?php

function login_CheckData ($send_identifier,$send_pwd) {
		$exit = true;

		if ($send_identifier == "" || strlen($send_identifier) < 2 || $send_pwd == "" || strlen($send_pwd) < 2) {
			$exit = false;
		}
		return $exit;
	}

	function login_ReturnError() {
		session_start();
		$_SESSION['error'] = true;
		header("Location: ../../index.html");
	}

	function login_CheckDatabase($send_identifier,$send_pwd,$database) {
			global $con;

			$data = $con ->prepare('SELECT usuario_contrasena,usuario_id,usuario_usuario FROM tbl_usuario WHERE usuario_email = ? OR usuario_usuario = ?');
			$data->bind_param('ss', $send_identifier,$send_identifier);
			$data->execute();
			$data->store_result();
			if ($data->num_rows == 1) {
				$data->bind_result($result,$id,$user);
				while ($row = $data->fetch()) {
						if (password_verify($send_pwd,$result)) {
							session_start();
							$_SESSION['ecocycling_user_id'] = $id;
							$_SESSION['ecocycling_user_user'] = $user;

							/* ----- si cambia de mes los fondos mensuales pasan a los fondos totales ------------------*/
							$data2 = $con ->prepare("SELECT `usuario_ultimaConexion`,`usuario_fondosTotales`,`usuario_fondosMensuales` FROM `tbl_usuario` WHERE `tbl_usuario`.`usuario_id` = $id");
							$data2->execute();
							$data2->bind_result($ultimaConexion,$fondosTotales,$fondosMensuales);
							$data2->fetch();
							
							$mesActual = date('m',time());
							$mesUltimaConexion = date('m',$ultimaConexion);
							
							if ($mesActual > $mesUltimaConexion) {

								$fondosTotales += $fondosMensuales;
								$fondosMensuales = 0;

								$query = "UPDATE `tbl_usuario` SET `usuario_fondosMensuales` = $fondosMensuales, `usuario_fondosTotales` = $fondosTotales  WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id];";
								$database->query($query);
							}
							/* FIN ---- si cambia de mes los fondos mensuales pasan a los fondos totales -------------*/

							/* --- Actualizamos la ultima conexion ---------------------------------------------------*/
							$fechaActual = time();
							$query2 = "UPDATE `tbl_usuario` SET `usuario_ultimaConexion` = '$fechaActual'  WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id];";
							$database->query($query2);
							/* --- FIN Actualizamos la ultima conexion -----------------------------------------------*/

							header("Location: ../../home.php");
						} else {
							 session_start();
							$_SESSION['error'] = true;
							header("Location: ../../index.html");
						}
				}
			} else {
				session_start();
				$_SESSION['error'] = true;
				header("Location: ../../index.html");
			}
			//printf($data->num_rows);

			$sql = "SELECT usuario_id FROM tbl_usuario WHERE (usuario_usuario='{$send_identifier}' OR usuario_email='{$send_identifier}') AND usuario_contrasena = '{$send_pwd}';";


			//$response = $data->fetch(PDO::FETCH_ASSOC);
		 
	}
?>

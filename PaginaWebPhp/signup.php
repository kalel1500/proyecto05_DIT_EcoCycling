<?php
	/*session_start();*/
	include "assets/php/conexion.php";
	$msg = '';
	$pass = true;
	if (isset($_POST['email'])) {
		$email = $_POST['email'];
		$password = $_POST['password'];
		if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
			//$msg .= 'El correo ES valido';
			//SELECT nombre, email FROM tbl_usuarios WHERE nombre=usu2 or email=usu1@mail.com
			if (!empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['repeatedPassword'])) {
				if ($_POST['password'] == $_POST['repeatedPassword']) {
					
					$records = $conn->prepare('SELECT usuario_usuario FROM tbl_usuario WHERE usuario_usuario=:usuario');
					$records->bindParam(':usuario', $_POST['username']);
					$records->execute();
					$resultsUsu = $records->fetch(PDO::FETCH_ASSOC);

					$records = $conn->prepare('SELECT usuario_email FROM tbl_usuario WHERE usuario_email=:email');
					$records->bindParam(':email', $_POST['email']);
					$records->execute();
					$resultsMail = $records->fetch(PDO::FETCH_ASSOC);

					if (count($resultsUsu['usuario_usuario']) > 0) {
						$msg .= "El usuario exsiste.";
						$pass = false;
					}
					if (count($resultsMail['usuario_email']) > 0) {
						$msg .= "El correo ya exsiste.";
						$pass = false;
					}

					if ($pass) {
						$sql = "INSERT INTO `tbl_usuario` (`usuario_usuario`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_contrasena`, `usuario_ultimaConexion`, `usuario_ultimoReset`, `usuario_fondosTotales`, `usuario_fondosMensuales`, `grupo_id`, `nivel_id`, `foto_id`) VALUES (:usuario, NULL, NULL, :email, :password, NULL, NULL, 0, 0, (SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = 'Usuario'), (SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_numero` = 1), (SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = '1_foto01'))";
						$stmt = $conn->prepare($sql);
						$stmt->bindParam(':usuario', $_POST['username']);
						$stmt->bindParam(':email', $_POST['email']);
						$password = password_hash($_POST['password'], PASSWORD_BCRYPT);
						$stmt->bindParam(':password', $password);
						if ($stmt->execute()) {

							/*-----------------------historial-------------------*/
							$km = 0;
							$fechaInicio = time();
							$fechaIFin = time()+1;
							$usu = $_POST['username'];
							$query = "INSERT INTO `tbl_historial` (`historial_fechaInicio`, `historial_fechaFin`, `historial_kilometros`, `usuario_id`, `bicicleta_id`) VALUES ('$fechaInicio', '$fechaIFin', $km, (SELECT `usuario_id` FROM `tbl_usuario` WHERE `usuario_usuario` = '$usu'), 1);";
							$database->query($query);
							echo $query;
							/*-----------------------fin historial-------------------*/

							$msg .= "El usuario se ha creado correctamente";
							header("Location: index.html");
						} else {
							$msg .= "Lo sentimos, ha debido de haber algun error al crear la cuenta.";
						}
					}
				} else {
					$msg .= "Las contraseñas no coinciden";
				}
			} else {
				$msg .= "Rellena los campos obligatorios";
			}
		} else {
			$msg .= "El correo NO es valido";
		}
	}
?>

<!DOCTYPE html>
<html lang="es">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>EcoCycling</title>
		<link rel="stylesheet" href="assets/archivosSignup/assets/css/bootstrap.css">
		<link rel="stylesheet" href="assets/archivosSignup/assets/css/styles.css">
	</head>

	<body>
		<div class="container text-center" style="margin-top: 20px; margin-bottom: 20px;">
			<h1 class="font-weight-light" style="color: white;">Únete hoy, practica el #<span class="green-text">Eco</span>Cycling</h1>
		</div>

		<section class="container">
			<div class="row justify-content-center align-self-center">
				<div class="col-sm-10 col-md-4">

					<?php if (!empty($msg)) { ?>
						<div class="alert alert-danger">
							<?php echo $msg; ?>
						</div>
					<?php } ?>

					<div class="contenedor-registro" style="background-color: white;">
						<form action="signup.php" class="main-form needs-validation" method="POST" novalidate>
							<div class="form-group">
								<label for="username">Usuario *</label>
								<input type="text" name="username" id="username" class="form-control">
							</div>
							<div class="form-group">
								<label for="email">Correo electrónico *</label>
								<input type="text" name="email" id="email" class="form-control">
							</div>
							<div class="form-group">
								<label for="password">Contraseña *</label>
								<input type="password" name="password" id="password" class="form-control">
							</div>
							<div class="form-group">
								<label for="password">Repetir Contraseña *</label>
								<input type="password" name="repeatedPassword" id="repeatedPassword" class="form-control">
							</div>
							<button type="submit" class="btn btn-success btn-md btn-block">Submit</button>
							<br>
							<a href="index.html">Volver</a>
						</form>
					</div>
				</div>
			</div>
		</section>
	</body>

	<script src="assets/archivosSignup/assets/js/jquery-3.3.1.js"></script>
	<script src="assets/archivosSignup/assets/js/bootstrap.bundle.js"></script>
	<script src="assets/archivosSignup/assets/js/bootstrap.js"></script>

</html>
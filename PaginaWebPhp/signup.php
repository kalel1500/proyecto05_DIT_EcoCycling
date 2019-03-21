<?php
	/*session_start();*/
	$msg = '';
	$pass = true;
	if (isset($_POST['email'])) {
		$email = $_POST['email'];
		$password = $_POST['password'];
		if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
			//$msg .= 'El correo ES valido';
			//SELECT nombre, email FROM tbl_usuarios WHERE nombre=usu2 or email=usu1@mail.com
			if (!empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['confirm_password'])) {
				if ($_POST['password'] == $_POST['confirm_password']) {
					
					$records = $conn->prepare('SELECT usuario_usuario FROM tbl_usuario WHERE usuario_usuario=:usuario');
					$records->bindParam(':usuario', $_POST['usuario']);
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
						$sql = "INSERT INTO `tbl_usuario` (`usuario_usuario`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_contrasena`, `usuario_ultimaConexion`, `usuario_ultimoReset`, `usuario_fondos`, `grupo_id`, `nivel_id`, `foto_id`) VALUES (:usuario, :nombre, :apellido, :email, :password, NULL, NULL, 0, (SELECT `grupo_id` FROM `tbl_grupo` WHERE `grupo_nombre` = 'Usuario'), (SELECT `nivel_id` FROM `tbl_nivel` WHERE `nivel_numero` = 1), (SELECT `foto_id` FROM `tbl_foto` WHERE `foto_nombre` = '1_foto01'))";
						$stmt = $conn->prepare($sql);
						$stmt->bindParam(':usuario', $_POST['usuario']);
						$stmt->bindParam(':nombre', $_POST['nombre']);
						$stmt->bindParam(':apellido', $_POST['apellido']);
						$stmt->bindParam(':email', $_POST['email']);
						$password = password_hash($_POST['password'], PASSWORD_BCRYPT);
						$stmt->bindParam(':password', $password);
						if ($stmt->execute()) {
							$msg .= "El usuario se ha creado correctamente";
							header("Location: index.php");
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

<div class="signup-form">
	<form action="signup.php" method="post">
		<h2>Registrate</h2>
		<p class="hint-text">Crea tu cuenta. Es gratis y solo tardas un minuto.</p>
		<?php if (!empty($msg)) { ?>
			<div class="alert alert-danger">
				<?php echo $msg; ?>
			</div>
		<?php } ?>
		<div class="form-group">
			<div class="row">
				<div class="col-xs-6"><input type="text" class="form-control" name="nombre" placeholder="Nombre"></div>
				<div class="col-xs-6"><input type="text" class="form-control" name="apellido" placeholder="Apellido"></div>
			</div>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="usuario" placeholder="Usuario para login" required="required">
			<label class="label-campo-obligatorio">Campo obligatorio*</label>
		</div>
		<div class="form-group">
			<input type="email" class="form-control" name="email" placeholder="Email" required="required">
			<label class="label-campo-obligatorio">Campo obligatorio*</label>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="password" placeholder="Contraseña" required="required">
			<label class="label-campo-obligatorio">Campo obligatorio*</label>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="confirm_password" placeholder="Confirmar contraseña" required="required">
			<label class="label-campo-obligatorio">Campo obligatorio*</label>
		</div>
		<div class="form-group">
			<label class="checkbox-inline"><input type="checkbox" required="required"> Acepto los <a href="#">Terminos de Uso</a> &amp; <a href="#">la Politica de Privacidad</a></label>
			<label class="label-campo-obligatorio">Campo obligatorio*</label>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-success btn-lg btn-block">Registrar Ahora</button>
		</div>
	</form>
	<div class="text-center">Ya tienes una cuenta? <a href="index.php?mostrar=login">Inicia Sesion</a></div>
</div>
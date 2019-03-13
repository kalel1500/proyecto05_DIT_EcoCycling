<?php	
	session_start();
	
	if (isset($_SESSION['user_id'])) {
		$records = $conn->prepare('SELECT * FROM `tbl_usuario` INNER JOIN `tbl_grupo` ON `tbl_usuario`.`grupo_id` = `tbl_grupo`.`grupo_id` INNER JOIN `tbl_nivel` ON `tbl_usuario`.`nivel_id` = `tbl_nivel`.`nivel_id` INNER JOIN `tbl_foto` ON `tbl_usuario`.`foto_id` = `tbl_foto`.`foto_id` WHERE `tbl_usuario`.`usuario_id` = :id');
		$records->bindParam(':id', $_SESSION['user_id']);
		$records->execute();
		$results = $records->fetch(PDO::FETCH_ASSOC);
		$usuario = null;
		if (count($results) > 0) {
			$usuario = $results;
			$_SESSION['usuario_usuario'] = $results['usuario_usuario'];
			$_SESSION['usuario_nombre'] = $results['usuario_nombre'];
			$_SESSION['usuario_apellido'] = $results['usuario_apellido'];
			$_SESSION['usuario_email'] = $results['usuario_email'];
			$_SESSION['usuario_contrasena'] = $results['usuario_contrasena'];
			$_SESSION['usuario_ultimaConexion'] = $results['usuario_ultimaConexion'];
			$_SESSION['usuario_ultimoReset'] = $results['usuario_ultimoReset'];
			$_SESSION['usuario_fondos'] = $results['usuario_fondos'];
			$_SESSION['grupo_id'] = $results['grupo_id'];
			$_SESSION['nivel_id'] = $results['nivel_id'];
			$_SESSION['foto_id'] = $results['foto_id'];

			$_SESSION['grupo_nombre'] = $results['grupo_nombre'];
			$_SESSION['foto_ruta'] = $results['foto_ruta'];
			$_SESSION['foto_nombre'] = $results['foto_nombre'];
			$_SESSION['foto_extension'] = $results['foto_extension'];
			$_SESSION['nivel_nombre'] = $results['nivel_nombre'];
			$_SESSION['nivel_numero'] = $results['nivel_numero'];
			$_SESSION['nivel_fotoRuta'] = $results['nivel_fotoRuta'];
			$_SESSION['nivel_fotoNombre'] = $results['nivel_fotoNombre'];
			$_SESSION['nivel_fotoExtension'] = $results['nivel_fotoExtension'];
		}
	}
?>
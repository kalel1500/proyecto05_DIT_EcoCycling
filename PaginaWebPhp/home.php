
<?php include "assets/php/header.php" ?>

<?php
	/*query 1-------------------------------*/
	$sql ="SELECT *, SUM(`tbl_historial`.`historial_kilometros`) AS 'kilometros_totales' FROM `tbl_usuario` INNER JOIN `tbl_historial` ON `tbl_usuario`.`usuario_id` = `tbl_historial`.`usuario_id` INNER JOIN `tbl_nivel` ON `tbl_usuario`.`nivel_id` = `tbl_nivel`.`nivel_id` INNER JOIN `tbl_foto` ON `tbl_usuario`.`foto_id` = `tbl_foto`.`foto_id`  WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id] GROUP BY `tbl_usuario`.`usuario_id`";
	$consulta=mysqli_query($link, $sql);
	$array = mysqli_fetch_array($consulta);
	
	/*query 2-------------------------------*/
	$hoy = date("Y-m-d");

	$fechaLast = new DateTime("$hoy 23:59:50");
	$fechaLast->modify('last day of this month');
	$ultimoDia = strtotime($fechaLast->format('Y-m-d H:i:s'));

	$fechaFirst = new DateTime("$hoy 00:00:00");
	$fechaFirst->modify('first day of this month');
	$primerDia = strtotime($fechaFirst->format('Y-m-d H:i:s'));
	
	$sql2 ="SELECT SUM(`tbl_historial`.`historial_kilometros`) AS 'kilometros_mensuales' FROM `tbl_usuario` INNER JOIN `tbl_historial` ON `tbl_usuario`.`usuario_id` = `tbl_historial`.`usuario_id` WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id] AND `tbl_historial`.`historial_fechaFin` >= $primerDia AND `tbl_historial`.`historial_fechaFin` <= $ultimoDia GROUP BY `tbl_usuario`.`usuario_id`";
	$consulta2=mysqli_query($link, $sql2);
	$array2 = mysqli_fetch_array($consulta2);

	/*query 3-------------------------------*/
	$nivelSiguiente = $array['nivel_numero']+1;
	$sql3 = "SELECT * FROM `tbl_nivel` WHERE `nivel_numero` = $nivelSiguiente";
	$consulta3=mysqli_query($link, $sql3);
	$array3 = mysqli_fetch_array($consulta3);
?>

<section>
	<article class="container">
		<div class="row">
			<?php if(mysqli_num_rows($consulta)>0) { ?>
				<h1>Inicio</h1>
					
								
				<div class="col-md-12 info-container">	
					<div class="row">
						<div class="div-left-home">
							<?php echo "<img class='test' src=\"".$array['foto_ruta'].$array['foto_nombre'].$array['foto_extension']."\" style=\"width: 100px;\">"; ?>	
						</div>

						<div class="div-left-home">
							<h2><?php echo $array['usuario_nombre'] ." ".$array['usuario_apellido']; ?></h2>
							Nivel: <?php echo $array['nivel_numero']; ?>
						</div>

						<div class="div-right-home">
							<?php 
								$precio = 10 - round($array['usuario_fondosMensuales'], 0, PHP_ROUND_HALF_DOWN);
							?>
							Precio mes: <?php echo $precio; ?> €
						</div>
					</div>

					<br><br><br>

					<div class="row">
						<div class="col-md-3">Kilometros mensuales:</div>
						<div class="col-md-3"><?php echo round($array2['kilometros_mensuales'], 0, PHP_ROUND_HALF_DOWN); ?> km</div>
					</div>

					<div class="row">
						<div class="col-md-3">Fondos disponibles:</div>
						<div class="col-md-3"><?php echo round($array['usuario_fondosTotales'], 0, PHP_ROUND_HALF_DOWN); ?> EcoPoints</div>
					</div>

					<div class="row">
						<div class="col-md-3">Fondos generados este mes:</div>
						<div class="col-md-3"><?php echo round($array['usuario_fondosMensuales'], 0, PHP_ROUND_HALF_DOWN); ?> EcoPoints</div>
					</div>
					
					<div class="row">
						<div class="col-md-12" style="text-align: center;">
							Kilometros totales: <?php echo round($array['kilometros_totales'], 0, PHP_ROUND_HALF_DOWN); ?> km
						</div>
					</div>

					<?php include "assets/php/barra_progreso.php" ?>

					<div>
						<div class="div-left-home">
							<p>Nivel actual</p>
							<?php echo "<img class='rotar' src=\"".$array['nivel_fotoRuta'].$array['nivel_fotoNombre'].$array['nivel_fotoExtension']."\" style=\"width: 100px;\">"; ?>
						</div>
						
						<div class="div-right-home">
							<p>Siguiente nivel</p>
							<?php echo "<img class='rotar' src=\"".$array3['nivel_fotoRuta'].$array3['nivel_fotoNombre'].$array3['nivel_fotoExtension']."\" style=\"width: 100px;\">"; ?>
							<?php echo "$msg"; ?>
						</div>
					</div>


					<div class="row">
						<form class="form-horizontal col-sm-5 center-block" action="assets/php/aumentar.php" method="POST">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="inp_aumentar" id="label_aumentar">Aumentar en (km):</label>
								<div class="col-sm-8">
									<input class="form-control" type="number" id="inp_aumentar" name="inp_aumentar" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="formGroup"></label>
								<div class="col-sm-8">
									<button type="button" class="btn btn-info btn-lg" id="modidy-buttonA"><span class="glyphicon glyphicon-pencil"></span> Aumentar kilometros</button>
									<button type="submit" class="btn btn-success btn-lg" id="save-buttonA" style="display: none;"><span class="glyphicon glyphicon-floppy-saved"></span> Guardar</button>
									<button type="button" class="btn btn-danger btn-lg" data-dismiss="modal" id="cancel-buttonA" style="display: none;"><span class="glyphicon glyphicon-remove-circle"></span> Cancelar</button>
								</div>
							</div>
						</form>
					</div>

				</div>
			<?php } else { ?>
				<div class="row">
						<form class="form-horizontal col-sm-5 center-block" action="assets/php/aumentar.php" method="POST">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="inp_aumentar" id="label_aumentar">Aumentar en (km):</label>
								<div class="col-sm-8">
									<input class="form-control" type="number" id="inp_aumentar" name="inp_aumentar" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label" for="formGroup"></label>
								<div class="col-sm-8">
									<button type="button" class="btn btn-info btn-lg" id="modidy-buttonA"><span class="glyphicon glyphicon-pencil"></span> Aumentar kilometros</button>
									<button type="submit" class="btn btn-success btn-lg" id="save-buttonA" style="display: none;"><span class="glyphicon glyphicon-floppy-saved"></span> Guardar</button>
									<button type="button" class="btn btn-danger btn-lg" data-dismiss="modal" id="cancel-buttonA" style="display: none;"><span class="glyphicon glyphicon-remove-circle"></span> Cancelar</button>
								</div>
							</div>
						</form>
					</div>
			<?php }	?>
		</div>
	</article>			
</section>

<?php include "assets/php/footer.php" ?>

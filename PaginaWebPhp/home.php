
<?php include "assets/php/header.php" ?>

<?php
	$sql ="SELECT *, SUM(`tbl_historial`.`historial_kilometros`) AS 'kilometros_totales' FROM `tbl_usuario` INNER JOIN `tbl_historial` ON `tbl_usuario`.`usuario_id` = `tbl_historial`.`usuario_id` INNER JOIN `tbl_nivel` ON `tbl_usuario`.`nivel_id` = `tbl_nivel`.`nivel_id` INNER JOIN `tbl_foto` ON `tbl_usuario`.`foto_id` = `tbl_foto`.`foto_id`  WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id] GROUP BY `tbl_usuario`.`usuario_id`";

	$fecha = new DateTime();
	$fecha->modify('last day of this month');
	$ultimoDia = strtotime($fecha->format('Y-m-d H:i:s'));
	$fecha->modify('first day of this month');
	$primerDia = strtotime($fecha->format('Y-m-d H:i:s'));

	$sql2 ="SELECT SUM(`tbl_historial`.`historial_kilometros`) AS 'kilometros_mensuales' FROM `tbl_usuario` INNER JOIN `tbl_historial` ON `tbl_usuario`.`usuario_id` = `tbl_historial`.`usuario_id` WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id] AND `tbl_historial`.`historial_fechaFin` >= $primerDia AND `tbl_historial`.`historial_fechaFin` <= $ultimoDia GROUP BY `tbl_usuario`.`usuario_id`";

	$consulta=mysqli_query($link, $sql);
	$consulta2=mysqli_query($link, $sql2);
?>

<section>
	<article class="container">
		<div class="row">
			<?php
				if(mysqli_num_rows($consulta)>0) {
					$array = mysqli_fetch_array($consulta);
					$array2 = mysqli_fetch_array($consulta2);
					?>
					<h1><?php echo $array['usuario_usuario']; ?></h1>
								
					<div class="col-md-12 info-container">
						<?php include "assets/php/barra_progreso.php" ?>
						<div class="row">
							<div class="col-md-3">Numero nivel:</div>
							<div class="col-md-3"><?php echo $array['nivel_numero']; ?></div>
						</div>
						<div class="row">
							<div class="col-md-3">Nombre nivel:</div>
							<div class="col-md-3"><?php echo $array['nivel_nombre']; ?></div>
						</div>
						<div class="row">
							<div class="col-md-3">Foto nivel:</div>
							<div class="col-md-3"><?php echo "<img src=\"".$array['nivel_fotoRuta'].$array['nivel_fotoNombre'].$array['nivel_fotoExtension']."\" style=\"width: 100px;\">"; ?></div>
						</div>
						<div class="row">
							<div class="col-md-3">Foto usuario:</div>
							<div class="col-md-3"><?php echo "<img src=\"".$array['foto_ruta'].$array['foto_nombre'].$array['foto_extension']."\" style=\"width: 100px;\">"; ?></div>
						</div>
						<div class="row">
							<div class="col-md-3">Kilometros mensuales:</div>
							<div class="col-md-3"><?php echo round($array2['kilometros_mensuales'], 0, PHP_ROUND_HALF_DOWN); ?> km</div>
						</div>
						<div class="row">
							<div class="col-md-3">Kilometros totales:</div>
							<div class="col-md-3"><?php echo round($array['kilometros_totales'], 0, PHP_ROUND_HALF_DOWN); ?> km</div>
						</div>
						<div class="row">
							<div class="col-md-3">Fondos disponibles este mes:</div>
							<div class="col-md-3"><?php echo $array['usuario_fondos']; ?> EcoPoints</div>
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
					<?php
				}
					
				?>

			
		</div>
	</article>			
</section>

<?php include "assets/php/footer.php" ?>

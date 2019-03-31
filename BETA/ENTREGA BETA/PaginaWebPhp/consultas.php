
<?php include "assets/php/header.php" ?>

<section>
	<article class="container">
		<div class="row">
			
			<h1>Inicio</h1>
			<div class="col-md-12 info-container">	
				<?php
					$fecha = new DateTime();
					$fecha->modify('last day of this month');
					$ultimoDia = strtotime($fecha->format('Y-m-d H:i:s'));
					$fecha->modify('first day of this month');
					$primerDia = strtotime($fecha->format('Y-m-d H:i:s'));

					$sql2 ="SELECT *, SUM(`tbl_historial`.`historial_kilometros`) AS 'kilometros_mensuales' FROM `tbl_usuario` INNER JOIN `tbl_historial` ON `tbl_usuario`.`usuario_id` = `tbl_historial`.`usuario_id` WHERE `tbl_historial`.`historial_fechaFin` >= $primerDia AND `tbl_historial`.`historial_fechaFin` <= $ultimoDia GROUP BY `tbl_usuario`.`usuario_id`";

					$consulta2=mysqli_query($link, $sql2);
//echo $sql2;
					while ($array2 = mysqli_fetch_array($consulta2)) {
						$kilometros_mensuales = $array2['kilometros_mensuales'];
						$fondos = $array2['usuario_fondosMensuales'];
						$id = $array2['usuario_id'];

						echo "<br>kilometros mensuales: ".$kilometros_mensuales."|| id: ".$id;
					}




					/*SELECT from_unixtime(`historial_fechaInicio`,'%Y-%m-%d %H:%i:%s') AS inicio,from_unixtime(`historial_fechaFin`,'%Y-%m-%d %H:%i:%s') AS fin,`usuario_id` FROM tbl_historial*/

					/*SELECT UNIX_TIMESTAMP('2019-03-01 22:23:00')*/
				?>
			</div>
			
		</div>
	</article>			
</section>

<?php include "assets/php/footer.php" ?>

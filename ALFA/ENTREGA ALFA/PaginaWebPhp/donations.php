
<?php include "assets/php/header.php" ?>
<?php
	require "assets/php/conexion.php";

	$sql = "SELECT * FROM tbl_entidad";
	$data = $database->query($sql);
	$money = $database->query("SELECT usuario_fondosTotales FROM tbl_usuario WHERE usuario_id={$_SESSION['ecocycling_user_id']};");
	while ($row = $money->fetch_assoc()) {
		$points = round($row['usuario_fondosTotales']);
	} ?>



<section>
<article class="container">
<div class="row">
	<h1>Donaciones</h1>
	<div class="col-md-12 info-container">

				<?php	while ($row = $data->fetch_assoc()) { $photo = str_replace(" ","",$row['entidad_nombre']); ?>
				<div class="row" style="border:1px solid #28a745;border-radius:5px;">
						<div class="col-sm-6 col-md-6">
								<div class="thumbnail">
										<img src="assets/img/<?=$photo?>.jpg" alt="...">
											<div class="caption text-center">
												<h3><?=$row['entidad_nombre']?></h3>
												<p>Dinero enviado: <?=$row['entidad_dineroActual']?> €</p>
												<p></p>
												<p><a href="#" class="btn btn-primary" role="button">Ir a web</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
											</div>
								</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="thumbnail">

										<div class="caption text-center" style="padding-bottom: 5px;">
											<h3>Donar a <?=$row['entidad_nombre']?></h3>
											<br><br><p><?=$row['entidad_descripcion']?></p><br>
											<p>Cartera: <?=$points?> ECOPoints</p>
											Donar: <input type="text" name="donation" id="donation" size="4"/> ECOPoints<br><br><br><br>
											<p><a href="#" class="btn btn-success" role="button">Realizar donación</a></p>
										</div>
										<form id="form-<?=$photo?>" action="index.html" method="post">

										</form>
							</div>
						</div>
						</div>
					<?php }
				 ?>

	<!--  -->

	</div>
</div>
</article>
</section>
<script type="text/javascript">

</script>

<?php include "assets/php/footer.php" ?>

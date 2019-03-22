
<?php include "assets/php/header.php" ?>
<?php
	require "assets/php/conexion.php";

	$sql = "SELECT * FROM tbl_entidad";
	$data = $database->query($sql); ?>



<section>
<article class="container">
<div class="row">
	<h1>Donaciones</h1>
	<div class="col-md-12 info-container">

				<?php	while ($row = $data->fetch_assoc()) { $photo = str_replace(" ","",$row['entidad_nombre']); ?>
				<div class="row">
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
							s
						</div>
						</div>
					<?php }
				 ?>

	<!--  -->

	</div>
</div>
</article>
</section>

<?php include "assets/php/footer.php" ?>

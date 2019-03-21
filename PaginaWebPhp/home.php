
<?php include "assets/php/header.php" ?>

<section>
	<article class="container">
		<div class="row">
			<h1><?php echo $_SESSION['ecocycling_user_user']; ?></h1>
			<div class="col-md-12 info-container">
				<?php
					"SELECT *, SUM(`historial_kilometros`.`tbl_historial`) AS 'kilometros_totales' FROM `tbl_usuario` INNER JOIN `tbl_historial` ON `tbl_usuario`.`usuario_id` = `tbl_historial`.`usuario_id` WHERE `tbl_usuario`.`usuario_id` = $_SESSION[ecocycling_user_id] GROUP BY `tbl_usuario`.`usuario_id`"
				?>

			</div>
		</div>
	</article>			
</section>

<?php include "assets/php/footer.php" ?>

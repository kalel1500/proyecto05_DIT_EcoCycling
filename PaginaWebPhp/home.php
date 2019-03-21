
<?php include "assets/php/header.php" ?>

<section>
	<article class="container">
		<div class="row">
			<h1><?php echo $_SESSION['ecocycling_user_user']; ?></h1>
			<div class="col-md-12 info-container">
				<?php
					"SELECT * FROM `tbl_usuario`"
				?>

			</div>
		</div>
	</article>			
</section>

<?php include "assets/php/footer.php" ?>

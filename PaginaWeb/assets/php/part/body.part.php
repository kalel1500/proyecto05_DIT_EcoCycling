<header>
	<div class="cabecera">
		<img class="imgCabecera" src="assets/images/cabecera2.jpg">
	</div>
						
	<div class="centrarTitulo">
		<?php //include "assets/php/proc/tituloCabezera.proc.php"; ?>
	</div>
</header>
					
<?php //include "assets/php/proc/navegador.proc.php"; ?>

<section>
	<?php
		if (!isset($_REQUEST['mostrar'])) {
			include "assets/php/pagina1.php";
		} else {
			$mostrar = $_REQUEST['mostrar'];
			switch ($mostrar) {
				case 'datos':
					include "assets/php/datos.php";
					break;
				case 'pagina2':
					include "assets/php/pagina2.php";
					break;
				case 'pagina3':
					include "assets/php/pagina3.php";
					break;
				default:
					echo "Error";
					break;
			}
		}
	?>
</section>
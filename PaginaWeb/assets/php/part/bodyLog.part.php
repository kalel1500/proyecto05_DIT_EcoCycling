<header>
	<div class="cabecera">
		<img class="imgCabecera" src="assets/images/cabecera2.jpg">
	</div>
						
	<div class="centrarTitulo">
		<?php include "assets/php/proc/tituloCabecera.proc.php"; ?>
	</div>
</header>

<section>
	<?php
		if (!isset($_REQUEST['mostrar'])) {
			include "assets/php/page/datos.php";
		} else {
			switch ($_REQUEST['mostrar']) {
				case 'datos':
					include "assets/php/page/datos.php";
					break;
				case 'tops':
					include "assets/php/page/tops.php";
					break;
				case 'perfil':
					include "assets/php/page/perfil.php";
					break;
				case 'logout':
					include "assets/php/proc/logout.proc.php";
					break;
				default:
					echo "Error";
					break;
			}
		}
	?>
</section>
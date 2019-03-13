<?php
	if (isset($_REQUEST['mostrar'])) {
		$mostrar=$_REQUEST['mostrar'];
		switch ($mostrar) {
			case 'contactos':
				?>
				<div class="row">
					<div class="col-sm-4">
						<h1 class='cabecera'>Contactos</h1>
					</div>
					<div class="col-sm-6">
						<div class='search-box'>
							<form class='search-form' id="id-form-buscar">
								<input class='form-control' id="input-form-buscar" placeholder='Buscar contactos... nick, nombres, apellidos, numero o correo' type='text' list="div-datos-datalist" disabled title="Deshabilitado por falta de tiempo">
								
								<button class='btn btn-link search-btn' disabled>
									<i class='glyphicon glyphicon-search'></i>
								</button>

								<datalist id="div-datos-datalist">
								</datalist>
							</form>
						</div>
					</div>
				</div>
				<?php
				break;
			case 'mapa':
				echo "<h1 class='cabecera'>Mapa</h1>";
				break;
			case 'localizar':
				echo "<h1 class='cabecera'>Localizar</h1>";
				break;
			case 'perfil':
				echo "<h1 class='cabecera'>Perfil</h1>";
				break;
			default:
				echo "<h1 class='cabecera'>Esta pagina no existe</h1>";
				break;
		}
	}
?>
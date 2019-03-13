
<div class="text_registro">
	<div class="centrar2">
<form method="POST" name="registro" action="registro.proc.php" onsubmit="return validate()">
					<label></label><input class="user" type="text" id="user" name="user" placeholder="User" autofocus><br><br>
					<label></label><input class="nom" type="text" id="nom" name="nom" placeholder="Nombre" autofocus><br><br>
					<label></label><input class="apellido" type="apellido" id="apellido" name="apellido" placeholder="Apellido" autofocus><br><br>
					<label></label><input class="email" type="email" id="email" name="email" placeholder="email" autofocus><br><br>
					<label></label><input class="pwd" type="password" id="pwd" name="pwd" placeholder="Contraseña"><br><br>
					<label></label><input class="pwd2" type="password" id="pwd2" name="pwd2" placeholder="Repetir Contraseña"><br><br>
					<div class="error_registro">
					<?php

					if (isset($_REQUEST['err'])) {
						echo "<b>Las contraseñas no coinciden</b>";
					}
					if (isset($_REQUEST['igual'])) {
						echo "<b>El usuario ya existe</b>";
					}
						
					?>
					<br>
					<input class="btn" type="submit" name="submit" value="Registrar">
					<br>
					</div>
				</form>
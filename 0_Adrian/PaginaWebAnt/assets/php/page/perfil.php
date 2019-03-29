
<article class="container">
	<form class="form-horizontal col-sm-7 center-block" name="form_mod_perfil" id="id-form-perfil">
		

		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_usuario">Usuario:</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="inp_usuario" name="inp_usuario" value="">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_nombre">Nombre:</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="inp_nombre" name="inp_nombre" value="">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_apellido">Apellido:</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="inp_apellido" name="inp_apellido" value="">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_correo">Correo electrónico</label>
			<div class="input-group col-sm-8 pading-input-group">
				<span class="input-group-addon">@</span>
				<input class="form-control" type="text" id="inp_correo" name="inp_correo" value="">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp1_sexo">Sexo</label>
			<div class="col-sm-8">
				<?php
				if (/*$_SESSION['sexo_usuario'] == 'Hombre'*/true) {
					?>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp1_sexo" value="Hombre" checked> Hombre
					</label>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp2_sexo" value="Mujer"> Mujer
					</label>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp3_sexo" value="Otros"> Otros
					</label>
					<?php
				} else if($_SESSION['sexo_usuario'] == 'Mujer') {
					?>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp1_sexo" value="Hombre"> Hombre
					</label>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp2_sexo" value="Mujer" checked> Mujer
					</label>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp3_sexo" value="Mujer"> Otros
					</label>
					<?php
				} else if($_SESSION['sexo_usuario'] == 'Otros') {
					?>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp1_sexo" value="Hombre"> Hombre
					</label>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp2_sexo" value="Mujer"> Mujer
					</label>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp3_sexo" value="Otros" checked> Otros
					</label>
					<?php
				} else {
					?>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp1_sexo" value="Hombre"> Hombre
					</label>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp2_sexo" value="Mujer"> Mujer
					</label>
					<label class="radio-inline">
						<input type="radio" name="inp_sexo" id="inp3_sexo" value="Otros"> Otros
					</label>
					<?php
				}
				?>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_nivel">Nivel:</label>
			<div class="col-sm-8">
				<select class="form-control" id="inp_nivel" name="inp_nivel">
					<option value="">-Selecciona-</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_foto">Foto:</label>
			<div class="col-sm-8">
				<select class="form-control" id="inp_foto" name="inp_foto">
					<option value="">-Selecciona-</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_reset_pass">Cambiar contraseña</label>
			<div class="col-sm-8">
				<label class="checkbox-inline">
					<input type="checkbox" id="inp_reset_pass" name="inp_reset_pass" value=""> Cambiar contraseña
				</label>
			</div>
		</div>

		<div class="form-group" style="display: none;" id="group_new_pas">
			<label class="col-sm-4 control-label" for="inp_new_pas">Contraseña nueva</label>
			<div class="col-sm-8">
				<input class="form-control" type="password" id="inp_new_pas" name="inp_new_pas">
			</div>
		</div>

		<div class="form-group" style="display: none;" id="group_conf_new_pas">
			<label class="col-sm-4 control-label" for="inp_conf_new_pas">Confirmar contraseña nueva</label>
			<div class="col-sm-8">
				<input class="form-control" type="password" id="inp_conf_new_pas" name="inp_conf_new_pas">
			</div>
		</div>
		
		<div class="alert alert-danger" role="alert" style="display: none;" id="div_error_pas"></div>

		<br /><br />

		<div class="form-group">
			<label class="col-sm-4 control-label" for="formGroup"></label>
			<div class="col-sm-8">
				<button type="submit" class="btn btn-success btn-lg" id="conf-disable-on-mod"><span class="glyphicon glyphicon-floppy-saved"></span> Guardar</button>
				<button type="button" class="btn btn-danger btn-lg" data-dismiss="modal" id="canc-disable-on-mod"><span class="glyphicon glyphicon-remove-circle"></span> Cancelar</button>
			</div>
		</div>

	</form>
</article>
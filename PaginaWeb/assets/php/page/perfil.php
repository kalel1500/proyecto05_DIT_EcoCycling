<article>
	<form class="form-horizontal col-sm-7 center-block" name="form_mod_perfil" id="id-form-perfil">
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp1_cambiar_foto">Foto</label>
			<div class="col-sm-8">
				<label class="radio-inline">
					<input type="radio" name="inp_cambiar_foto" id="inp1_cambiar_foto" value="dejar" checked> Dejar
				</label>
				<label class="radio-inline">
					<input type="radio" name="inp_cambiar_foto" id="inp2_cambiar_foto" value="cambiar"> Cambiar
				</label>
				<label class="radio-inline">
					<input type="radio" name="inp_cambiar_foto" id="inp3_cambiar_foto" value="quitar"> Quitar
				</label>
			</div>
		</div>

		<div class="form-group" style="display: none;" id="group_subir-foto">
			<label class="col-sm-4 control-label" for="inp_subirFoto">Seleccionar archivo</label>
			<div class="col-sm-8">
				<input class="form-control" type="file" id="inp_subirFoto" name="inp_subirFoto" disabled value="default_user" title="Deshabilitado por falta de tiempo">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_usuario">Usuario</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="inp_usuario" name="inp_usuario" value="<?php echo $_SESSION['usuario_usuario']; ?>">
				<span class="help-block">Este nombre sera mostrado a los usuarios, ocultando el verdadero nombre.</span>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_nombre1">Nombre 1</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="inp_nombre1" name="inp_nombre1" value="<?php echo $_SESSION['nombre1_usuario']; ?>">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_nombre2">Nombre 2</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="inp_nombre2" name="inp_nombre2" value="<?php echo $_SESSION['nombre2_usuario']; ?>">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_apellido1">Apellido 1</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="inp_apellido1" name="inp_apellido1" value="<?php echo $_SESSION['apellido1_usuario']; ?>">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_apellido2">Apellido 2</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" id="inp_apellido2" name="inp_apellido2" value="<?php echo $_SESSION['apellido2_usuario']; ?>">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_telefono">Teléfono</label>
			<div class="input-group col-sm-8 pading-input-group">
				<span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
				<input class="form-control" type="text" id="inp_telefono" name="inp_telefono" value="<?php echo $_SESSION['telefono_usuario']; ?>">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp_correo">Correo electrónico</label>
			<div class="input-group col-sm-8 pading-input-group">
				<span class="input-group-addon">@</span>
				<input class="form-control" type="text" id="inp_correo" name="inp_correo" value="<?php echo $_SESSION['email_usuario']; ?>">
			</div>
		</div>
		
		<!-- <div class="form-group">
			<label class="col-sm-4 control-label" for="inp_informacion">Mas información</label>
			<div class="col-sm-8">
				<textarea class="form-control" rows="4" id="inp_informacion" name="inp_informacion" maxlength="130"><?php /*echo*/ $_SESSION/*'comentario_usuario'*/; ?></textarea>
			</div>
		</div> -->
		
		<div class="form-group">
			<label class="col-sm-4 control-label" for="inp1_sexo">Sexo</label>
			<div class="col-sm-8">
				<?php
				if ($_SESSION['sexo_usuario'] == 'Hombre') {
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
						<input type="radio" name="inp_sexo" id="inp3_sexo" value="Otros"> Otros
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
			<label class="col-sm-4 control-label" for="inp_reset_pass">Cambiar contraseña</label>
			<div class="col-sm-8">
				<label class="checkbox-inline">
					<input type="checkbox" id="inp_reset_pass" name="inp_reset_pass" value="si"> Cambiar contraseña
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
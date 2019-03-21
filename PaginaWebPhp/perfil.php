
<?php include "assets/php/header.php" ?>

<section>
	<article class="container">
		<div class="row">
			<h1>Perfil</h1>
			<div class="col-md-12 info-container">
				<form class="form-horizontal col-sm-5 center-block" name="form_mod_perfil" id="id-form-perfil">

						<div class="form-group">
							<label class="col-sm-4 control-label" for="inp_usuario">Usuario:</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="inp_usuario" name="inp_usuario">
								<div class="alerta-roja" role="alert" style="display: none; color: #cc0400;" id="div_error_usuario"></div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-4 control-label" for="inp_nombre">Nombre:</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="inp_nombre" name="inp_nombre">
								<div class="alerta-roja" role="alert" style="display: none; color: #cc0400;" id="div_error_nombre"></div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-4 control-label" for="inp_apellido">Apellido:</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="inp_apellido" name="inp_apellido">
								<div class="alerta-roja" role="alert" style="display: none; color: #cc0400;" id="div_error_apellido"></div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-4 control-label" for="inp_correo">Correo:</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" id="inp_correo" name="inp_correo">
								<div class="alerta-roja" role="alert" style="display: none; color: #cc0400;" id="div_error_correo"></div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-4 control-label" for="inp1_sexo">Sexo:</label>
							<div class="col-sm-8">
								<label class="radio-inline">
									<input type="radio" name="inp_sexo" id="inp1_sexo" value="Hombre"> Hombre
								</label>
								<label class="radio-inline">
									<input type="radio" name="inp_sexo" id="inp2_sexo" value="Mujer"> Mujer
								</label>
								<label class="radio-inline">
									<input type="radio" name="inp_sexo" id="inp3_sexo" value="Otros"> Otros
								</label>
								<div class="alerta-roja" role="alert" style="display: none; color: #cc0400;" id="div_error_sexo"></div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-4 control-label" for="inp_foto">Foto:</label>
							<div class="col-sm-8" id="div-opciones-foto">
								
							</div>
							<div class="alerta-roja" role="alert" style="display: none; color: #cc0400;" id="div_error_foto"></div>
						</div>

						<div class="form-group" id="group_change_pas" style="display: none;">
							<label class="col-sm-4 control-label" for="inp_reset_pass">Cambiar contraseña</label>
							<div class="col-sm-8">
								<label class="checkbox-inline">
									<input type="checkbox" id="inp_reset_pass" name="inp_reset_pass" value="si"> Cambiar contraseña
								</label>
							</div>
						</div>

						<div class="form-group" style="display: none;" id="group_new_pas">
							<label class="col-sm-4 control-label" for="inp_new_pas">Nueva contraseña</label>
							<div class="col-sm-8">
								<input class="form-control" type="password" id="inp_new_pas" name="inp_new_pas">
								<div class="alerta-roja" role="alert" style="display: none; color: #cc0400;" id="div_error_pas"></div>
							</div>
						</div>

						<div class="form-group" style="display: none;" id="group_conf_new_pas">
							<label class="col-sm-4 control-label" for="inp_conf_new_pas">Confirmar contraseña</label>
							<div class="col-sm-8">
								<input class="form-control" type="password" id="inp_conf_new_pas" name="inp_conf_new_pas">
							</div>
						</div>
						
						<!-- <div class="alerta-roja" role="alert" style="display: none; color: #cc0400;" id="div_error_pas"></div> -->
						<!-- <div class="alert alert-danger" role="alert" style="display: none;" id="div_error_pas"></div> -->

						<br /><br />

						<div class="form-group">
							<label class="col-sm-4 control-label" for="formGroup"></label>
							<div class="col-sm-8">
								<button type="button" class="btn btn-info btn-lg" id="modidy-button"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
								<button type="submit" class="btn btn-success btn-lg" id="save-button" style="display: none;"><span class="glyphicon glyphicon-floppy-saved"></span> Guardar</button>
								<button type="button" class="btn btn-danger btn-lg" data-dismiss="modal" id="cancel-button" style="display: none;"><span class="glyphicon glyphicon-remove-circle"></span> Cancelar</button>
							</div>
						</div>

					</form>
			</div>
		</div>
	</article>			
</section>

<?php include "assets/php/footer.php" ?>		

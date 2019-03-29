$(document).ready(function () {
	let registerForm = `
			<div class="form-container">
				<form action="" class="main-form">
					<div class="row">
						<div class="col">
							<div class="form-group">
								<label for="firstname">Nombre</label>
								<input type="text" name="firstname" id="firstname" class="form-control" />   
							</div>
						</div>
						<div class="col">
							<div class="form-group">
								<label for="lastname">Apellidos</label>
								<input type="text" name="lastname" id="lastname" class="form-control">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="email">Email</label>
						<input type="text" name="email" id="email" class="form-control">
						<small class="form-text text-muted">
							ejemplo@ejemplomail.com
						</small>
					</div>
					<div class="form-group">
						<label for="username">Username</label>
						<input type="text" name="username" id="username" class="form-control">
					</div>


							
							

					<div class="row">
						<div class="col">
							<div class="form-group">
								<label for="password">Password</label>
								<input type="password" name="password" id="password" class="form-control">
							</div>
						</div>
						<div class="col">
							<div class="form-group">
								<label for="password">Repetir Password</label>
								<input type="password" name="repeatedPassword" id="repeatedPassword" class="form-control">
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="gender">Género</label>
						<select name="gender" id="gender" class="form-control">
							<option value="male">Hombre</option>
							<option value="female">Mujer</option>
							<option value="female">Prefiero no decirlo</option>
						</select>
					</div>
				</form>
			</div>
	`;

	let loginForm = `
			<form action="" class="main-form" id="login-form">
				<div class="form-group">
					<label for="username">Usuario o correo</label>
					<input type="text" name="username" id="username" class="form-control">
				</div>
				<div class="form-group">
					<label for="password">Contraseña</label>
					<input type="password" name="password" id="password" class="form-control">
				</div>
			</form>
	`;

	$("#goToLogin").on("click", function () {
		$("#exampleModalLabel").html("Login");
			$("#modal-body").html(loginForm);
			$("#goto_Register").html("Registro");
			iniciarValidate();
	});

	$("#goto_Register").on("click", function () {
		if ($("#goto_Register").html() == 'Registro') {
			$("#exampleModalLabel").html("Registro");
			$("#modal-body").html(registerForm);
			$("#goto_Register").html("Login");
			iniciarValidate();
		} else {
			$("#exampleModalLabel").html("Login");
			$("#modal-body").html(loginForm);
			$("#goto_Register").html("Registro");
			iniciarValidate();
		}
	});
});
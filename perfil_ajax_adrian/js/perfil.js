
function disable_inputs(){ 
	$("input").prop('disabled', true);
	$("select").prop('disabled', true);
	$('#group_change_pas').hide();
	$(".radio-inline").addClass("inp-disabled");
	$("#save-button").hide();
	$("#cancel-button").hide();
	$("#group_new_pas").hide();
	$("#group_conf_new_pas").hide();
	$("#div_error_pas").hide();
	$("#inp_reset_pass").prop( "checked", false );
	$("#inp_new_pas").val("");
	$("#inp_conf_new_pas").val("");
	$("#modidy-button").show();
	$("#div_error_usuario").hide();
	$("#div_error_nombre").hide();
	$("#div_error_apellido").hide();
	$("#div_error_correo").hide();
	$("input").removeAttr('style');
}

function enable_inputs(){ 
	$("input").prop('disabled', false);
	$("select").prop('disabled', false);
	$('#group_change_pas').show();
	$(".radio-inline").removeClass("inp-disabled");
	$("#save-button").show();
	$("#cancel-button").show();
	$("#modidy-button").hide();
}

function ajax_fotos(){ 
	// 2.- llamamos al ajax que nos deuelve la lista de fotos
	$.ajax({
		method: "POST",
		url: "php/foto.proc.php",
		cache: false,
		success: function(response) {
			if( response.success ) {

				var output = `<select class="form-control" id="inp_foto" name="inp_foto">`;
				//recorremos cada foto
				$.each(response.data.items, function( key, value ) {
					output += `
						<option value="${value['foto_id']}">${value['foto_nombre']}</option>
					`;
					
				});

				//Actualizamos el HTML del elemento con id="#div-opciones-foto"
				$("#div-opciones-foto").html(output);

			} else {
				//response.success no es true
				$("#div-opciones-foto").html('No ha habido suerte: ' + response.data.message);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			$("#div-opciones-foto").html("Algo ha fallado: " +  textStatus);
		},
		complete: function (data) {
			// 3.- Al acabar de pintar la lista de fotos, llamamos a la funcion continuar que contienelas demas funciones
			continuar();
		}
	});
}

function ajax_mostrarUsuario(){ 
	$.ajax({
		method: "POST",
		url: "php/mostrar_perfil.proc.php",
		cache: false,
		success: function(response) {
			if( response.success ) {
				
				$.each(response.data.items, function( key, value ) {
					$("#inp_usuario").val(value['usuario_usuario']);
					$("#inp_nombre").val(value['usuario_nombre']);
					$("#inp_apellido").val(value['usuario_apellido']);
					$("#inp_correo").val(value['usuario_email']);
					switch(value['usuario_sexo']) {
						case 'Hombre':
							$("#inp1_sexo").prop( "checked", true );
							break;
						case 'Mujer':
							$("#inp2_sexo").prop( "checked", true );
							break;
						case 'Otro':
							$("#inp3_sexo").prop( "checked", true );
							break;
					}
					$("#inp_foto").val(value['foto_id']);
					
				});

			} else {
				//response.success no es true
				$("#inp_foto").html('No ha habido suerte: ' + response.data.message);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			$("#inp_foto").html("Algo ha fallado: " +  textStatus);
		}
	});
}

function ajax_modificarUsuario(){ 
	inp_usuario = $("#inp_usuario").val();
	inp_nombre = $("#inp_nombre").val();
	inp_apellido = $("#inp_apellido").val();
	inp_correo = $("#inp_correo").val();
	inp_sexo = $("input[type='radio'][name='inp_sexo']:checked").val();
	inp_foto = $("#inp_foto").val();
	if( $('#inp_reset_pass').prop('checked') ) {
		existePass = "si";
		inp_new_pas = $("#inp_new_pas").val();
	} else {
		existePass = "no";
		inp_new_pas = "";
	}
	$.ajax({
		method: "POST",
		url: "php/modificar_perfil.proc.php",
		//data: new FormData($("#id-form-perfil")),
		data: {
			inp_usuario: inp_usuario,
			inp_nombre: inp_nombre,
			inp_apellido: inp_apellido,
			inp_correo: inp_correo,
			inp_sexo: inp_sexo,
			inp_foto: inp_foto,
			inp_new_pas: inp_new_pas,
			existePass: existePass
		},
		cache: false,
		success: function(response) {
			alert( "Data Saved: " + msg );
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert("Algo ha fallado: " + textStatus);
		}
	});
}

function continuar(){ 
	// 4.- llamamos a la funcion para deshabilitar los todos los elementos
	disable_inputs();
	// 5.- llamamos a la funcion para mostrar el usuario
	ajax_mostrarUsuario();

	// 6.- Escuchamos el boton modificar. Al clicar llamamos a la funcion para habilitar todos los elementos
	$( "#modidy-button" ).click(function() {
		enable_inputs();
	});

	// 7.- Escuchamos el boton cancelar. Al clicar llamamos a la funcion para deshabilitar todos los elementos y a la funcion que mustra el usuario, para que todo vuelva a estar como al principio
	$( "#cancel-button" ).click(function() {
		disable_inputs();
		ajax_mostrarUsuario();
	});

	//8.- Escuchamos el boton guardar. Al clicar comprobamos que ningun campo este vacio. En caso afirmativo llamamos a las funciones: modificar usuario, deshabilitar elementos y mostrar usuario. De este modo al modificar el usuario volvemos a poner los elementos bien y mostramos el usuario ya modificado
	$( "#save-button" ).click(function(event) {
		event.preventDefault();
		passar = true;
		if ($('#inp_usuario').val().trim() == "") {
			var msg = "Campo usuario obligatorio";
			$("#div_error_usuario").show();
			$("#div_error_usuario").html(msg);
			$("#inp_usuario").css({"border": "1px solid red", "background-color": "#ffe8e8"});
			passar = false;
		}
		if ($('#inp_nombre').val().trim() == "") {
			var msg = "Campo nombre obligatorio";
			$("#div_error_nombre").show();
			$("#div_error_nombre").html(msg);
			$("#inp_nombre").css({"border": "1px solid red", "background-color": "#ffe8e8"});
			passar = false;
		}
		if ($('#inp_apellido').val().trim() == "") {
			var msg = "Campo apellido obligatorio";
			$("#div_error_apellido").show();
			$("#div_error_apellido").html(msg);
			$("#inp_apellido").css({"border": "1px solid red", "background-color": "#ffe8e8"});
			passar = false;
		}
		if ($('#inp_correo').val().trim() == "") {
			var msg = "Campo correo obligatorio";
			$("#div_error_correo").show();
			$("#div_error_correo").html(msg);
			$("#inp_correo").css({"border": "1px solid red", "background-color": "#ffe8e8"});
			passar = false;
		}
		if ($('#inp_reset_pass').prop('checked') && (($("#inp_new_pas").val().trim() == "") || ($("#inp_new_pas").val().trim() != $("#inp_conf_new_pas").val().trim()))) {
			var msg = "";
			if ($("#inp_new_pas").val().trim() == "") { msg = "Rellena el campo contraseña"; }
			else if ($("#inp_new_pas").val().trim() != $("#inp_conf_new_pas").val().trim()) { msg = "Las contraseñas no coinciden"; }
			$("#div_error_pas").show();
			$("#div_error_pas").html(msg);
			$("#inp_new_pas").css({"border": "1px solid red", "background-color": "#ffe8e8"});
			$("#inp_conf_new_pas").css({"border": "1px solid red", "background-color": "#ffe8e8"});
			passar = false;			
		}

		if (passar) {
			ajax_modificarUsuario();
			disable_inputs();
			ajax_mostrarUsuario();
		}

		$("#inp_usuario").keyup(function(){
			$("#div_error_usuario").fadeOut();
			$("#inp_usuario").removeAttr('style');
		});
		$("#inp_nombre").keyup(function(){
			$("#div_error_nombre").fadeOut();
			$("#inp_nombre").removeAttr('style');
		});
		$("#inp_apellido").keyup(function(){
			$("#div_error_apellido").fadeOut();
			$("#inp_apellido").removeAttr('style');
		});
		$("#inp_correo").keyup(function(){
			$("#div_error_correo").fadeOut();
			$("#inp_correo").removeAttr('style');
		});
		$("#inp_new_pas").keyup(function(){
			$("#div_error_pas").fadeOut();
			$("#inp_new_pas").removeAttr('style');
		});
		$("#inp_conf_new_pas").keyup(function(){
			$("#div_error_pas").fadeOut();
			$("#inp_conf_new_pas").removeAttr('style');
		});
	});
}

$(document).ready(function(){
	// 1.- cuando hemos cargado la pagina llamamos a la funcion para cargar las fotos (esta funcion llamara a la funcion continuar)
	ajax_fotos();

});


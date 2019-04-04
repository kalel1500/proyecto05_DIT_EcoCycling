
function disable_inputsA(){ 
	$("#inp_aumentar").prop('disabled', true);
	$("#save-buttonA").hide();
	$("#cancel-buttonA").hide();
	$("#inp_aumentar").val("");
	$("#modidy-buttonA").show();
	$("#div_error_aumentar").hide();
	$("#inp_aumentar").removeAttr('style');
	$("#label_aumentar").hide();
}

function enable_inputsA(){ 
	$("#inp_aumentar").prop('disabled', false);
	$("#save-buttonA").show();
	$("#cancel-buttonA").show();
	$("#modidy-buttonA").hide();
	$("#label_aumentar").show();
}

function iniciar_aumentar(){ 
	disable_inputsA();

	$( "#modidy-buttonA" ).click(function() {
		enable_inputsA();
	});

	$( "#cancel-buttonA" ).click(function() {
		disable_inputsA();
	});
}

$(document).ready(function(){
	iniciar_aumentar();
});
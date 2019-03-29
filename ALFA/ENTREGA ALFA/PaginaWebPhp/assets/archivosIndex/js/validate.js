	function checkFirstname() {
		let inputValue = $.trim($("#firstname").val());

		if (inputValue === '') {
			let errorMessage = `
				<div class="invalid-feedback" id="firstnameBlank">¡Campo obligatorio!</div>
			`;

			if ($("#firstnameNum").length) {
				$("#firstnameNum").remove();
				$("#firstname").after(errorMessage);
			} else if (!$("#firstnameBlank").length) {
				$("#firstname").after(errorMessage);
				$("#firstname").addClass("is-invalid");
			}

		} else {
			let regExp = /^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$/g;

			if (regExp.test(inputValue)) {

				if ($("#firstnameBlank").length) {
					$("#firstnameBlank").remove();
					$("#firstname").removeClass("is-invalid").addClass("is-valid");
				} else {
					$("#firstnameNum").remove();
					$("#firstname").removeClass("is-invalid").addClass("is-valid");
				}
			} else {
				let errorMessage = `
					<div class="invalid-feedback" id="firstnameNum">No puedes introducir números en este campo ni carácteres raros.</div>
				`;

				if ($("#firstnameBlank").length) {
					$("#firstnameBlank").remove();
					$("#firstname").after(errorMessage);
					$("#firstname").addClass("is-invalid");

				} else if (!$("#firstnameNum").length) {
					$("#firstname").after(errorMessage);
					$("#firstname").addClass("is-invalid");
				}
			}
		}
	}

	function checkLastname() {
		let inputValue = $.trim($("#lastname").val());

		if (inputValue === '') {
			let errorMessage = `
				<div class="invalid-feedback" id="lastnameBlank">¡Campo obligatorio!</div>
			`;

			if ($("#lastnameNum").length) {
				$("#lastnameNum").remove();
				$("#lastname").after(errorMessage);
			} else if (!$("#lastnameBlank").length) {
				$("#lastname").after(errorMessage);
				$("#lastname").addClass("is-invalid");
			}

		} else {
			let regExp = /^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$/g;

			if (regExp.test(inputValue)) {

				if ($("#lastnameBlank").length) {
					$("#lastnameBlank").remove();
					$("#lastname").removeClass("is-invalid").addClass("is-valid");
				} else {
					$("#lastnameNum").remove();
					$("#lastname").removeClass("is-invalid").addClass("is-valid");
				}
			} else {
				let errorMessage = `
					<div class="invalid-feedback" id="lastnameNum">No puedes introducir números en este campo ni carácteres raros.</div>
				`;

				if ($("#lastnameBlank").length) {
					$("#lastnameBlank").remove();
					$("#lastname").after(errorMessage);
					$("#lastname").addClass("is-invalid");

				} else if (!$("#lastnameNum").length) {
					$("#lastname").after(errorMessage);
					$("#lastname").addClass("is-invalid");
				}
			}
		}
	}

	function checkEmail() {
		let inputValue = $.trim($("#email").val());

		if (inputValue === '') {
			let errorMessage = `
					<div class="invalid-feedback" id="emailBlank">¡Campo obligatorio!</div>
			`;

			if ($("#noEmail").length) {
				$("#noEmail").remove();
				$("#email").after(errorMessage);
			} else {
				if (!$("#emailBlank").length) {
					$("#email").after(errorMessage);
					$("#email").addClass("is-invalid");
				}
			}
		} else {
			let regExp = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
			
			if (regExp.test(inputValue)) {
				$("#emailBlank").remove();
				$("#noEmail").remove();
				$("#email").removeClass("is-invalid").addClass("is-valid");
			} else {
				let errorMessage = `
					<div class="invalid-feedback" id="noEmail">El formato de correo es incorrecto.</div>
				`;

				if ($("#email").hasClass("is-valid")) {
					$("#email").after(errorMessage);
					$("#email").removeClass("is-valid").addClass("is-invalid");
				} else if ($("#emailBlank").length) {
					$("#emailBlank").remove();
					$("#email").after(errorMessage);
					$("#email").addClass("is-invalid");
				} else {
					if (!$("#noEmail").length) {
						$("#email").after(errorMessage);
						$("#email").addClass("is-invalid");
					}
				}
			}
		}
	}

	function checkUsername() {
		let inputValue = $.trim($("#username").val());
		// El usuario mínimo 6 carácteres sin carácteres especiales ni espacios
		// errores posibles: campo en blanco | no pasa el regex | mínimo 6 carácteres
		if (inputValue === '') {
			let errorMessage = `
				<div class="invalid-feedback" id="usernameBlank">¡Campo obligatorio!</div>
			`;

			if ($("#noUsername").length) {
				$("#noUsername").remove();
				$("#username").after(errorMessage);
			} else if ($("#minLengthErr").length) {
				$("#minLengthErr").remove();
				$("#username").after(errorMessage);
			} else {
				if (!$("#usernameBlank").length) {
					$("#username").after(errorMessage);
					$("#username").addClass("is-invalid");
				}
			}
		} else {
			let regExp = /^[a-zA-ZÀ-ÿ\u00f1\u00d10-9]{6,}$/;

			if (regExp.test(inputValue)) {
				$("#usernameBlank").remove();
				$("#noUsername").remove();
				$("#minLengthErr").remove();
				$("#username").removeClass("is-invalid").addClass("is-valid");
			} else if (inputValue.length >= 6) {
				let errorMessage = `
					<div class="invalid-feedback" id="noUsername">No puedes usar espacios ni carácteres especiales.</div>
				`;

				if ($("#username").hasClass("is-valid")) {
					$("#username").after(errorMessage);
					$("#username").removeClass("is-valid").addClass("is-invalid");
				} else if ($("#usernameBlank").length) {
					$("#usernameBlank").remove();
					$("#username").after(errorMessage);
					$("#username").addClass("is-invalid");
				} else {
					if (!$("#noUsername").length) {
						$("#username").after(errorMessage);
						$("#username").addClass("is-invalid");
					}
				} 
			} else {
				let errorMessage = `
					<div class="invalid-feedback" id="minLengthErr">Mínimo 6 carácteres.</div>
				`;

				if ($("#username").hasClass("is-valid")) {
					$("#username").after(errorMessage);
					$("#username").removeClass("is-valid").addClass("is-invalid");
				} else if ($("#usernameBlank").length) {
					$("#usernameBlank").remove();
					$("#username").after(errorMessage);
					$("#username").addClass("is-invalid");
				} else if ($("#noUsername").length) {
					$("#username").after(errorMessage);
					$("#username").addClass("is-invalid");     
				} else {
					if (!$("#minLengthErr").length) {
						$("#username").after(errorMessage);
						$("#username").addClass("is-invalid");
					} 
				}
			}
		}
	}

	function checkPassword() {
		// El password mínimo 6 carácteres y un carácter especial como mínimo
		let inputValue = $.trim($("#password").val());
		let inputValue2 = $.trim($("#repeatedPassword").val());
		let regExp = /^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$/g;

		if (inputValue >= 4) {
			//alert("Minimo 4 carácteres");
		} else {
			alert("Minimo 4 carácteres");
		}

	}

	function checkRepeatedPassword() {
		let inputValue = $.trim($("#password").val());
		let inputValue2 = $.trim($("#repeatedPassword").val());
		if (inputValue != inputValue2) {
			alert("Estás validando el Repetir Password");
		}
	}


	function iniciarValidate() {
		//alert('wws');
		$("#firstname").focusout(function () {
			checkFirstname();
		});
		$("#lastname").focusout(function () {
			checkLastname();
		});
		$("#email").focusout(function () {
			checkEmail();
		});
		$("#username").focusout(function () {
			checkUsername();
		});
		$("#password").focusout(function () {
			checkPassword();
		});
		$("#repeatedPassword").focusout(function () {
			checkRepeatedPassword();
		});
	}

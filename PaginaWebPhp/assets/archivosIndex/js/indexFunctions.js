let x = $(document);
let errorMsg = false;
x.ready(() => {

  $("#goToLogin").on("click", function (index,error = false) {
			$("input").val("");
      if (error) {
        $("#msg_error").removeClass("d-none").addClass("d-block");
      } else {
        $("#msg_error").removeClass("d-block").addClass("d-none");
      }
	});

  $("#goto_Register").on("click", function () {
		window.location.replace("signup.php");
	});

  $.ajax({
    method: "GET",
    url: "assets/php/json/indexError.json.php",
  })
  .done( function (response) {
      if (response) {
        $("#goToLogin").trigger("click",true);
        errorMsg = true;
      }
  });
});

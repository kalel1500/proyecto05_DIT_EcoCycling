let x = $(document);
let errorMsg = false;
x.ready(() => {



  $.ajax({
    method: "GET",
    url: "assets/php/json/indexError.json.php",
  })
  .done( function (response) {
      if (response) {
        //alert("Error en la operación de login.\nInténtelo de nuevo");
        $("#displayerModal").trigger("click",true);
        errorMsg = true;
      }
  });
});

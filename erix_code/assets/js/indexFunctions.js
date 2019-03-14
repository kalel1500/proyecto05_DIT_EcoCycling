let x = $(document);
x.ready(() => {
  $(".pagModal").each((index) => {
    switch (index) {
      case 0:
        $(`.pagModal:eq(${index})`).html(`
          <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Login</h4>
          </div>
          <div class="modal-body">
              <form id="formLog" method="POST" action="login.php">
                  <div class="form-group">
                    <i class="fas fa-user"></i><input style="display: inline-block;width:90%;margin-left:10px;" type="text" class="form-control" id="log_" placeholder="User Name / Email address">
                  </div>
                  <div class="form-group">
                    <i class="fas fa-lock"></i><input style="display: inline-block;width:90%;margin-left:10px;" type="password" class="form-control" id="pwd" placeholder="Password">
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button id="btn_gotoRegister" type="button" class="btn btn-sm btn-link changePage" style="float:left">Register</button>
            <button id="btn_action_Log" type="submit" form="formLog" class="btn btn-sm btn-success">Log in</button>
            <button type="button" class="btn btn-sm btn-danger" data-dismiss="modal">Close</button>
          </div>
        `);
        break;
      case 1:
        $(`.pagModal:eq(${index})`).html(`
          <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Register</h4>
          </div>
          <div class="modal-body">
              <form id="formReg" method="POST" action="register.php">
                  <div class="form-group">
                    <i class="fas fa-user"></i><input style="display: inline-block;width:90%;margin-left:10px;" type="text" class="form-control" id="new_name" placeholder="Name...">
                  </div>
                  <div class="form-group">
                    <i class="fas fa-user"></i><input style="display: inline-block;width:90%;margin-left:10px;" type="text" class="form-control" id="new_surname" placeholder="Surname...">
                  </div>
                  <div class="form-group">
                    <i class="fas fa-at"></i></i><input style="display: inline-block;width:90%;margin-left:10px;" type="email" class="form-control" id="new_email" placeholder="Email...">
                  </div>
                  <div class="form-group">
                    <i class="fas fa-lock"></i></i><input style="display: inline-block;width:90%;margin-left:10px;" type="password" class="form-control" id="new_password" placeholder="Password...">
                  </div>
                  <div class="form-group">
                    <i class="fas fa-lock"></i><input style="display: inline-block;width:90%;margin-left:10px;" type="password" class="form-control" id="new_verify_password" placeholder="Repeat password...">
                  </div>
              </form>
          </div>
          <div class="modal-footer">
            <button id="btn_gotoLogin" type="button" class="btn btn-sm btn-link changePage" style="float:left">Login</button>
            <button id="btn_action_Reg" type="submit" form="formReg" class="btn btn-sm btn-success">Send</button>
            <button type="button" class="btn btn-sm btn-danger" data-dismiss="modal">Close</button>
          </div>
        `);
        break;
    } // End switch displays
    $(".changePage").each((index) => {
        switch (index) {
          case 0:
            $(`.changePage:eq(${index})`).on("click",() => {
              //Animations
              $(`#modalContent`).animate({height:394.24},200);
              $(`.pagModal:eq(${index})`).slideUp("slow");
              $(`.pagModal:eq(${index+1})`).removeClass("non_display");
              //$(`.pagModal:eq(${index})`).fadeOut();
              //$(`.pagModal:eq(${index+1})`).fadeIn();
              //Reset inputs
              $(".pagModal input").val("");
            });
            break;
          case 1:
            $(`.changePage:eq(${index})`).on("click",() => {
                //Animations
                $(`#modalContent`).animate({height:247.26},200);
                $(`.pagModal:eq(${index})`).slideDown("slow",() => {
                  $(`.pagModal:eq(${index})`).addClass("non_display");
                  //$(`.pagModal:eq(${index-1})`).slideDown(400);
                  $(`.pagModal:eq(${index-1})`).fadeIn();
                });

                //Reset Inputs
                $(".pagModal input").val("");
            });
            break;
        }
    });
  });
  $("#displayerModal").on("click",() => {
    $(".pagModal input").val("");
    $(`.pagModal:eq(0})`).fadeOut();
    if ($(`#modalContent`).height() > 300 ) {
        $(`#modalContent`).animate({height:247.26},200);
        //$(`.pagModal:eq(1)`).slideDown("slow",() => {
          $(`.pagModal:eq(1)`).addClass("non_display");
          $(`.pagModal:eq(0)`).css("display","");

          //$(`.pagModal:eq(${index-1})`).slideDown(400);

          //$(`.pagModal:eq(0})`).fadeIn();
        //});

    }
  });


});

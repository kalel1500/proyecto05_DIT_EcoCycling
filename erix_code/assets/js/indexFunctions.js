let x = $(document);
x.ready(() => {

  $("#formIndex").attr("action","login.php");
  $("#formIndex").attr("method","POST");


  $("#btn_gotoRegister").on("click",(evt) => {
    if ($("#btn_gotoRegister").html() == "Log up") {
      $("#modalContent div:eq(0)").html(`
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Register</h4>
      `);
      $("#modalContent div:eq(1)").html(`
        <form id="formIndex" method="POST">
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
      `);
      $("#btn_gotoRegister").html("Log in");
      $("#btn_action").html("Save");
      $("#formIndex").attr("method","POST");
      $("#formIndex").attr("action","register.php");
    } else if ($("#btn_gotoRegister").html() == "Log in") {
      $("#modalContent div:eq(0)").html(`
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Login</h4>
      `);
      $("#modalContent div:eq(1)").html(`
        <form id="formIndex" method="POST">
        <div class="form-group">
          <i class="fas fa-user"></i><input style="display: inline-block;width:90%;margin-left:10px;" type="text" class="form-control" id="log_" placeholder="User Name / Email address">
        </div>
        <div class="form-group">
          <i class="fas fa-lock"></i><input style="display: inline-block;width:90%;margin-left:10px;" type="password" class="form-control" id="pwd" placeholder="Password">
        </div>
        </form>
      `);
      $("#btn_gotoRegister").html("Log up");
      $("#btn_action").html("Enter");
      $("#formIndex").attr('method','POST');
      $("#formIndex").attr('action','login.php');
    }
  });
});

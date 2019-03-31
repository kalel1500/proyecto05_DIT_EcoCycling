<?php
require "conexion.php";
  require "functionsLibrary/indexFunctions.php";
  

  $send_identifier = trim($_POST['username']);
  $send_pwd = trim($_POST['password']);

  $send_identifier = mysqli_real_escape_string($con,$send_identifier);
  $send_pwd = mysqli_real_escape_string($con,$send_pwd);


  (login_CheckData($send_identifier,$send_pwd)) ? login_CheckDatabase($send_identifier,$send_pwd,$database) : login_ReturnError();
?>

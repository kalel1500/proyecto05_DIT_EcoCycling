<?php
  require "connect.php";

  $reg_name = $_POST['name'];
  $reg_surname = $_POST['surname'];
  $reg_email = $_POST['email'];
  $reg_password = $_POST['pwd'];
  $reg_RePassword = $_POST['pwd2'];

  if ($reg_password != $reg_RePassword) {

  }
//Username combinacion
  $sql = `
  INSERT INTO tbl_usuario VALUES(
      NULL,
      '$reg_user',
      '$reg_name',
      '$reg_surname',
      '$reg_email',
      '$reg_password',
      NULL,
      NULL,
      0.00,
      NULL,
      1,
      1
  )`;
?>

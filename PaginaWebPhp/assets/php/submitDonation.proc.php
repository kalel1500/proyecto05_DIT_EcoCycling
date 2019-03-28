<?php
  require "conexion.php";
  session_start();
  $pay = $_POST['donation'];
  $org = $_POST['org'];
  $id = $_SESSION['ecocycling_user_id'];
  $sql = "UPDATE tbl_entidad SET entidad_dineroActual = (entidad_dineroActual+$pay) WHERE entidad_nombre = '$org'";
  $data = $con -> query($sql);
  $sql = "UPDATE tbl_usuario SET usuario_fondosTotales = (usuario_fondosTotales-$pay) WHERE usuario_id = $id";
  $data = $con -> query($sql);
  header("Location: ../../donations.php");

?>

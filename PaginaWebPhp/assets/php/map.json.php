<?php
  require "conexion.php";

  $arrResult = array();
  $arrCoord = array();
  $arrLabels = array();

  $data = $con->prepare("SELECT * FROM tbl_bicicleta");
  $data->execute();
  $data->bind_result($id,$model,$x,$y);
  while ($data->fetch()) {
    $arrCoord[] = array('0' => $x,'1' => $y);
    $arrLabels[] = $model;
  }
  $arrResult[] = $arrCoord;
  $arrResult[] = $arrLabels;
  echo json_encode($arrResult);
?>

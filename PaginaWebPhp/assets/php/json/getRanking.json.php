<?php
require "../connect.php";
  $btn = $_GET['btn'];
  $arrResult= array();
  switch ($btn) {
    case 1:
      $dataIni = $_GET['dataIni'];
      $dataFin = $_GET['dataFin'];
      $data = $con ->query("SELECT tbl_usuario.usuario_usuario as 'usuario',SUM(historial_kilometros) AS 'km',nivel_nombre as 'nivel' FROM tbl_usuario INNER JOIN tbl_historial ON tbl_usuario.usuario_id=tbl_historial.usuario_id INNER JOIN tbl_nivel ON tbl_usuario.nivel_id=tbl_nivel.nivel_id WHERE historial_fechaFin>{$dataIni} AND historial_fechaInicio<{$dataFin} GROUP BY tbl_usuario.usuario_id ORDER BY SUM(historial_kilometros) DESC LIMIT 10");
      while ($row = $data->fetch_assoc()) {
        $arrResult[] = ['user'=>$row['usuario'],'km'=>$row['km'],'nivel'=>$row['nivel']];
      }
      echo json_encode($arrResult);
      break;
    case 2:
      $data = $con ->query("SELECT tbl_usuario.usuario_usuario as 'usuario',SUM(historial_kilometros) AS 'km',nivel_nombre as 'nivel' FROM tbl_usuario INNER JOIN tbl_historial ON tbl_usuario.usuario_id=tbl_historial.usuario_id INNER JOIN tbl_nivel ON tbl_usuario.nivel_id=tbl_nivel.nivel_id GROUP BY tbl_usuario.usuario_id ORDER BY SUM(historial_kilometros) DESC LIMIT 10");
      while ($row = $data->fetch_assoc()) {
        $arrResult[] = ['user'=>$row['usuario'],'km'=>$row['km'],'nivel'=>$row['nivel']];
      }
      echo json_encode($arrResult);

      break;
  }
?>

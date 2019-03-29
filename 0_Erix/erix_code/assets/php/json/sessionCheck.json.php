<?php
  session_start();
  $arrResult = array();
  if (isset($_SESSION['ecocycling_user_id'])) {
    require "../connect.php";
    $data = $con ->prepare("SELECT usuario_usuario,usuario_nombre,usuario_apellido,usuario_email,usuario_contrasena,usuario_sexo,usuario_fondos,nivel_nombre,foto_nombre FROM tbl_usuario INNER JOIN tbl_foto ON tbl_usuario.foto_id=tbl_foto.foto_id INNER JOIN tbl_nivel ON tbl_usuario.nivel_id=tbl_nivel.nivel_id WHERE usuario_id=?");
    $data->bind_param('s', $_SESSION['ecocycling_user_id']);
    $data->execute();
    $data->store_result();
    if ($data->num_rows == 1) {
      $data->bind_result($sql_usuario,$sql_nombre,$sql_apellido,$sql_email,$sql_contrasena,$sql_sexo,$sql_fondos,$sql_nivel,$sql_foto);
      while ($row = $data->fetch()) {
            echo $sql_email;
      }
    }
  } else {
    $arrResult[] = "error: true";
  }
  echo json_encode($arrResult);
 ?>

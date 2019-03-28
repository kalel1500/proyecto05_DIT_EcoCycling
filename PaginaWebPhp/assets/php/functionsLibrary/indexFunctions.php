<?php
function login_CheckData ($send_identifier,$send_pwd) {
    $exit = true;

    if ($send_identifier == "" || strlen($send_identifier) < 2 || $send_pwd == "" || strlen($send_pwd) < 2) {
      $exit = false;
    }
    return $exit;
  }

  function login_ReturnError() {
    session_start();
    $_SESSION['error'] = true;
    header("Location: ../../index.html");
  }

  function login_CheckDatabase($send_identifier,$send_pwd) {
      global $con;

      $data = $con ->prepare('SELECT usuario_contrasena,usuario_id,usuario_usuario FROM tbl_usuario WHERE usuario_email = ? OR usuario_usuario = ?');
      $data->bind_param('ss', $send_identifier,$send_identifier);
      $data->execute();
      $data->store_result();
      if ($data->num_rows == 1) {
        $data->bind_result($result,$id,$user);
        while ($row = $data->fetch()) {
            if (password_verify($send_pwd,$result)) {
              session_start();
              $_SESSION['ecocycling_user_id'] = $id;
              $_SESSION['ecocycling_user_user'] = $user;
              header("Location: ../../home.php");
            } else {
               session_start();
              $_SESSION['error'] = true;
              header("Location: ../../index.html");
            }
        }
      } else {
        session_start();
        $_SESSION['error'] = true;
        header("Location: ../../index.html");
      }
      //printf($data->num_rows);

      $sql = "SELECT usuario_id FROM tbl_usuario WHERE (usuario_usuario='{$send_identifier}' OR usuario_email='{$send_identifier}') AND usuario_contrasena = '{$send_pwd}';";


      //$response = $data->fetch(PDO::FETCH_ASSOC);
     
  }
?>

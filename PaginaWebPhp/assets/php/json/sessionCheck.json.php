<?php
  session_start();

  if (isset($_SESSION['ecocycling_user_id'])) {
    $arrResult = array('error' => false,'user'=> $_SESSION['ecocycling_user_user']);
    echo json_encode($arrResult);
  } else {
    $arrResult = array('error' => true);
    echo json_encode($arrResult);
  }
 ?>

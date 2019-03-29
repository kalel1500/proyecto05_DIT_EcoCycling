<?php
  session_start();
  if (isset($_SESSION['error'])) {
      session_unset();
      session_destroy();
      echo true;
  } else {
      echo false;
  }
?>

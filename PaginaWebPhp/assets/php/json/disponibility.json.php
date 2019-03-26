<?php
    require "../connect.php";
    $sql = "SELECT usuario_usuario FROM tbl_usuario WHERE usuario_usuario = '" . $_GET['text'] . "'";

    $string = $con->query($sql);
    echo ($string->num_rows == 1) ? true: false;

?>

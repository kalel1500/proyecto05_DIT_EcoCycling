<?php
  define('IP', 'localhost');
  define('USER', 'root');
  define('PASSWORD', '');
  define('DB', 'bd_proyecto_5');

  //global $con = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);

  global $con;
  $con = new mysqli(IP,USER,PASSWORD,DB);
  //$con = mysqli_connect(IP, USER, PASSWORD, DB);

  if (!$con) {
    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
    exit;
  }
  // if (mysqli_connect_errno()) {
  //     printf("Falló la conexión: %s\n", mysqli_connect_error());
  //     exit();
  // }
?>

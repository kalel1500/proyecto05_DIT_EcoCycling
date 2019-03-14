<?php

//include 'conection.php';
session_start();
$user = $_POST['user'];
$pass = $_POST['pass'];
$encriptada=md5($pass);



$q = "";
$q_usuarios = mysqli_query($link, $q);




if (mysqli_num_rows($q_usuarios)>0) {
	$array = mysqli_fetch_array($q_usuarios);
	$_SESSION['nombre']=$array['user_name'];
	$_SESSION['id']=$array['id_user'];
	header('Location: home.php');
}else{
	header('Location: login.php?err=1');
}



?>
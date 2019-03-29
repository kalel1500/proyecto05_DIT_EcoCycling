<?php
include 'conection.php';
session_start();
$user = $_POST['user'];
$nom = $_POST['nom'];
$apellido = $_POST['apellido'];
$email = $_POST['email'];
$pwd = $_POST['pwd'];
$pwd2 = $_POST['pwd2'];


$igual = "SELECT * FROM tbl_usuario WHERE (usuario_usuario='$user')";
$q_usuarios = mysqli_query($link, $igual);


if (mysqli_num_rows($q_usuarios)>0) {
	header('Location: registro.php?igual=1');
}else{
	
if ($pwd==$pwd2) {
	//$encriptada=md5($pwd);
$q = "INSERT INTO tbl_usuario (`usuario_usuario`,`usuario_nombre`,`usuario_apellido`,`usuario_email`,`usuario_contrasena`) VALUES ('$user','$nom','$apellido','$email','$pwd')";
echo $q;
mysqli_query($link,$q);
header("Location:login.php");
}else{
	echo "Las contraseñas no coinciden";
	header('Location: registro.php?err=1');
}
}
?>


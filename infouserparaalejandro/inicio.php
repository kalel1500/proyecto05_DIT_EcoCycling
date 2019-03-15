<?php
include "../conection.php";
//!!!!IMPORTANTE¡¡¡¡
//ahora pongo un id a mano porque desconozco la variable de la sesion
//luego pondremos el id  mediante la variable de la sesion
$query="SELECT * FROM tbl_usuario INNER JOIN tbl_nivel ON tbl_usuario.nivel_id=tbl_nivel.nivel_id WHERE usuario_id=3";
$consulta=mysqli_query($link, $query);
if(mysqli_num_rows($consulta)>0) {
				while($array = mysqli_fetch_array($consulta)) {
					$nombre = $array['usuario_nombre'];
					$apellido = $array['usuario_apellido'];
					$nivel = $array['nivel_id'];
					$fondos = $array['usuario_fondos'];
					$km = $array['nivel_kilometros'];
					echo "El nombre es $nombre<br>";
					echo "El apellido es $apellido<br>";
					echo "El nivel es $nivel<br>";
					echo "Los fondos del usuario son $fondos<br>";
					echo "Este salao ha hecho desde que empezo ha rodar en bicicleta $km km";
				}
			}
?>
<?php
include "historial.php";
include "conection.php";
if ($_REQUEST['filtro']=="10mejores") {
	echo "<div class=mejores>";
echo "<h1>Los 10 mejores</h1>";
echo "</div>";
include "conection.php";
//Dejo la sesion para recordar que luego sea puesta, pongo el id por poner algo
//session_start();
//$id=$_SESSION['id'];
$query="SELECT * FROM `tbl_historial`ORDER BY historial_kilometros DESC LIMIT 10;";
$consulta=mysqli_query($link,$query);
echo "<div class=tabla>";
echo "<table border width=900 height=100>";
echo "<tr>";
echo "<th>id_user</th>";
echo "<th>Fecha_Inicio</th>";
echo "<th>Fecha_Fin</th>";
echo "<th>Kilometros</th>";
echo "<th>Usuario_id</th>";
echo "<th>Bicicleta_id</th>";
echo "</tr>";
echo "<tr>";
if(mysqli_num_rows($consulta)>0) {
				while($array = mysqli_fetch_array($consulta)) {
					$idhistorial = $array['historial_id'];
					$ini = $array['historial_fechaInicio'];
					$fin = $array['historial_fechaFin'];
					$km = $array['historial_kilometros'];
					$idusuario = $array['usuario_id'];
					$idbicicleta = $array['bicicleta_id'];

						echo "<br>";
						echo "<td style=text-align:center;>";
						echo $idhistorial;
						echo "</td>";
						echo "<td style=text-align:center;>";
						echo $ini;
						echo "</td>";
						echo "<td style=text-align:center;>";
						echo $fin;
						echo "</td>";
						echo "<td style=text-align:center;>";
						echo $km;
						echo "</td>";
						echo "<td style=text-align:center;>";
						$query2="SELECT * FROM `tbl_usuario`WHERE usuario_id=$idusuario;";
						$consulta2=mysqli_query($link,$query2);
						if(mysqli_num_rows($consulta2)>0) {
				while($array2 = mysqli_fetch_array($consulta2)) {
					$nombreuser = $array2['usuario_usuario'];
					echo $nombreuser;
				}
			}
						
						echo "</td>";
						echo "<td style=text-align:center;>";
						$query3="SELECT * FROM `tbl_bicicleta`WHERE bicicleta_id=$idbicicleta;";
						$consulta3=mysqli_query($link,$query3);
						if(mysqli_num_rows($consulta3)>0) {
				while($array3 = mysqli_fetch_array($consulta3)) {
					$nombrebicicleta = $array3['bicicleta_modelo'];
					echo $nombrebicicleta;
				}
			}
						
						echo "</td>";
						echo "<tr>";
						echo "</div>";
				}
			}
}

//primer dia del mes

	$fechaini = new DateTime();
$fechaini->modify('first day of this month');
//echo $fechaini->format('d/m/Y');
$inicio=strtotime($fechaini->format('Y-m-d H:i:s'));


//ultimo dia del mes
$fechafin = new DateTime();
$fechafin->modify('last day of this month');
//echo $fechafin->format('d/m/Y');
$fin=strtotime($fechafin->format('Y-m-d H:i:s'));

if ($_REQUEST['filtro']=="mes") {
	echo "<h1>Los 10 mejores del mes</h1>";
	$mes="SELECT * FROM `tbl_historial` WHERE `historial_fechaFin`>'$inicio' AND `historial_fechaFin`< '$fin' ORDER BY historial_kilometros DESC LIMIT 10;"; 
	$consulta=mysqli_query($link,$mes);
	echo "<div class=tabla>";
echo "<table border width=900 height=100>";
echo "<tr>";
echo "<th>id_user</th>";
echo "<th>Fecha_Inicio</th>";
echo "<th>Fecha_Fin</th>";
echo "<th>Kilometros</th>";
echo "<th>Usuario_id</th>";
echo "<th>Bicicleta_id</th>";
echo "</tr>";
echo "<tr>";
if(mysqli_num_rows($consulta)>0) {
				while($array = mysqli_fetch_array($consulta)) {
					$idhistorial = $array['historial_id'];
					$ini = $array['historial_fechaInicio'];
					$fin = $array['historial_fechaFin'];
					$km = $array['historial_kilometros'];
					$idusuario = $array['usuario_id'];
					$idbicicleta = $array['bicicleta_id'];

						echo "<br>";
						echo "<td style=text-align:center;>";
						echo $idhistorial;
						echo "</td>";
						echo "<td style=text-align:center;>";
						echo $ini;
						echo "</td>";
						echo "<td style=text-align:center;>";
						echo $fin;
						echo "</td>";
						echo "<td style=text-align:center;>";
						echo $km;
						echo "</td>";
						echo "<td style=text-align:center;>";
						$query2="SELECT * FROM `tbl_usuario`WHERE usuario_id=$idusuario;";
						$consulta2=mysqli_query($link,$query2);
						if(mysqli_num_rows($consulta2)>0) {
				while($array2 = mysqli_fetch_array($consulta2)) {
					$nombreuser = $array2['usuario_usuario'];
					echo $nombreuser;
				}
			}
						
						echo "</td>";
						echo "<td style=text-align:center;>";
						$query3="SELECT * FROM `tbl_bicicleta`WHERE bicicleta_id=$idbicicleta;";
						$consulta3=mysqli_query($link,$query3);
						if(mysqli_num_rows($consulta3)>0) {
				while($array3 = mysqli_fetch_array($consulta3)) {
					$nombrebicicleta = $array3['bicicleta_modelo'];
					echo $nombrebicicleta;
				}
			}
						
						echo "</td>";
						echo "<tr>";
						echo "</div>";
				}
			}

}


?>
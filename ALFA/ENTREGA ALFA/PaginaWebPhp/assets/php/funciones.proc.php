<?php

function datos_json( $query ) {

	/*---- conexion ----*/
	$ip='localhost';
	$user='root';
	$password='';
	$bd_name='bd_proyecto_5';

	$database = new mysqli($ip, $user, $password, $bd_name);
	$database->query("SET NAMES 'utf8'");
	
	if($database->connect_errno) {
		die("No se pudo conectar a la base de datos");
	}
	/*---- fin conexion ----*/

	$jsondata = array();

	if ( $result = $database->query($query) ) {

		if( $result->num_rows > 0 ) {
			$jsondata["success"] = true;
			$jsondata["data"]["message"] = sprintf("Se han encontrado %d items", $result->num_rows);
			$jsondata["data"]["items"] = array();
			while( $row = $result->fetch_object() ) {
				$jsondata["data"]["items"][] = $row; //$jsondata["data"]["items"][] es un array no asociativo. Tendremos que utilizar JSON_FORCE_OBJECT en json_enconde
			}
		} else {
			$jsondata["success"] = false;
			$jsondata["data"] = array(
			'message' => 'No se encontró ningún resultado.'
			);
			
		}
		$result->close();
		
	} else {
		$jsondata["success"] = false;
		$jsondata["data"] = array(
		'message' => $database->error
		);
	}

	
	header('Content-type: application/json; charset=utf-8');
	echo json_encode($jsondata, JSON_FORCE_OBJECT);
	
	$database->close();

}

?>

<?php
	
	include "assets/php/partes/head.proc.php";

	if (!isset($_SESSION['user_id'])) {
		include "assets/php/login.php";
	} else {
		include "assets/php/partes/bdoy.php";
	}
	
	include "assets/php/partes/footer.proc.php";
?>
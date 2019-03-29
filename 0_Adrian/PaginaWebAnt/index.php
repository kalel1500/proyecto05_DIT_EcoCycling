
<?php
	session_start();
	
	include "assets/php/part/head.part.php";

	if (!isset($_SESSION['user_id'])) {
		include "assets/php/part/bodyUnlog.part.php";
	} else {
		include "assets/php/part/navegador.part.php";
		include "assets/php/part/bodyLog.part.php";
	}
	
	include "assets/php/part/footer.part.php";
?>
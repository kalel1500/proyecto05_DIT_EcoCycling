<section>
	<?php
		if (isset($_REQUEST['mostrar']) && $_REQUEST['mostrar'] == "signup") {
			include "assets/php/page/signup.php";
		} else {
			include "assets/php/page/login.php";
		}
	?>
</section>
		
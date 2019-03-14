<article>
	<?php
		echo "<br>-------------------<br>";
			echo "time: ".time();
		echo "<br>-------------------<br>";
			$date = date('Y-m-d H:i:s',time());
			echo "date de time: ".$date;
		echo "<br>-------------------<br>";
			echo "time de date: ".strtotime($date);
		echo "<br>-------------------<br>";
	?>
</article>
	
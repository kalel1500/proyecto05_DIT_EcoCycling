<article>
	<?php
		echo "<br>-------------------<br>";
			$time = time();
			echo "time: ".time();
		echo "<br>-------------------<br>";
			$date = date('Y-m-d H:i:s',time());
			echo "date de time: ".$date;
		echo "<br>-------------------<br>";
			echo "time de date: ".strtotime($date);
		echo "<br>-------------------<br>";

		echo "<br>-------------------<br>";
			$fecha = new DateTime();
			$fecha->modify('last day of this month');
			echo "<br>ultimo dia del mes: ".$fecha->format('Y-m-d H:i:s');
			echo "<br>ultimo dia del mes: ".strtotime($fecha->format('Y-m-d H:i:s'));
			$fecha->modify('first day of this month');
			echo "<br>ultimo dia del mes: ".$fecha->format('Y-m-d H:i:s');
			echo "<br>ultimo dia del mes: ".strtotime($fecha->format('Y-m-d H:i:s'));
		echo "<br>-------------------<br>";
			echo "random int: ".random_int(1, 100);
		echo "<br>-------------------<br>";
			echo "rand: ".rand(1, 100);
		echo "<br>-------------------<br>";
			$num = intval($time)+1;
			$sum = $num+1;
			echo "fecha fin: ".(time()+random_int(1800, 21600));
		echo "<br>-------------------<br>";
			//echo "round 11/15 hacia abajo".round(11/15, 0, PHP_ROUND_DOWN);
			echo "round 11/15 hacia abajo". intval(30/15);
		echo "<br>-------------------<br>";

		echo "<br>--------fin-------------------------------------------------<br>";
	?>
</article>
	

<?php
	$km = round($array['kilometros_totales'], 0, PHP_ROUND_HALF_DOWN);
	$numLength = strlen($km);
	
	$msg = "";
	if ($km < 800) {
		$msg = "";
		if ($numLength == 3) {
			$porcentage = substr($km, -2, 2);
		} else {
			$porcentage = $km;
		}
	} else {
		$porcentage = 100;
		$msg = "Nivel maximo";
	}
		
?>



<div class="progress progress-striped">
	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $porcentage; ?>%;"><?php echo $porcentage; ?>%
	</div>
</div>

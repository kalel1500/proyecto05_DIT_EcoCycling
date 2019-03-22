
<?php
	$km = round($array['kilometros_totales'], 0, PHP_ROUND_HALF_DOWN);
	$numLength = strlen($km);

	if ($numLength == 1) {
		$porcentage = $km;
	} elseif ($numLength == 2) {
		$porcentage = substr($km, -1, 1);
	} elseif ($numLength == 3) {
		$porcentage = substr($km, -2, 2);
	}
?>



<div class="progress progress-striped">
	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $porcentage; ?>%;">
	</div>
</div>
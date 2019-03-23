<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>EcoCycling</title>
		<link rel="icon" type="image/png" href="assets/img/isotipoFooter.png"/>

		<!-- Font awesome -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
		
		<!--Librerias bootstrap-->
		<script src="assets/js/jquery-3.3.1.min.js" charset="utf-8"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">



		<script type="text/javascript" src="http://beneposto.pl/jqueryrotate/js/jQueryRotateCompressed.js"></script>

		<!-- Estilos propios -->
		<link href="assets/css/estilos.css" rel="stylesheet" type="text/css"/>
		<link href="assets/css/navegador.css" rel="stylesheet" type="text/css"/>
		<link href="assets/css/footer.css" rel="stylesheet" type="text/css"/>
		<link href="assets/css/perfil.css" rel="stylesheet" type="text/css" >
		<link href="assets/css/home.css" rel="stylesheet" type="text/css" >
		<link href="assets/css/rankingStyle.css" rel="stylesheet" type="text/css"/>

		<!-- Js propios -->
		<script type="text/javascript" src="assets/js/indexFunctions.js" ></script>
		<!-- <script type="text/javascript" src="assets/js/perfil_display_inputs.js"></script> -->
		<script type="text/javascript" src="assets/js/ajax_perfil.js"></script>
		<script type="text/javascript" src="assets/js/aumentar.js"></script>

		<!-- conexion -->
		<?php
			include "assets/php/conexion.php";
			if (!isset($_SESSION['ecocycling_user_id'])) {
				header("Location: login.php");
			}
		?>

	</head>
	<body>

		

		<header>
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="container">
					<div class="navbar-header" >
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span> 
						</button>

						<a class="navbar-brand" href=""><img class="navbar-img" src="assets/img/isologoHead.png"></a>
						
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<?php
								$ruta = pathinfo($_SERVER["REQUEST_URI"]);
							?>
							
							<li class="<?php echo ($ruta['filename'] == "home") ? "active" : ""; ?>"><a href="home.php"><i class="fas fa-home"></i> Home</a></li>
							<li class="<?php echo ($ruta['filename'] == "ranking") ? "active" : ""; ?>"><a href="ranking.php"><i class="fas fa-medal"></i> Ranking</a></li>
							<li class="<?php echo ($ruta['filename'] == "donations") ? "active" : ""; ?>"><a href="donations.php"><i class="fas fa-hand-holding-usd"></i> Donaciones</a></li>
							<li class="<?php echo ($ruta['filename'] == "info") ? "active" : ""; ?>"><a href="info.php"><i class="fas fa-info"></i> Informacion</a></li>
							<!-- <li class="<php echo ($ruta['filename'] == "consultas") ? "active" : ""; ?>"><a href="consultas.php"><i class="fas fa-info"></i> Con</a></li> -->

						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="<?php echo ($ruta['filename'] == "perfil") ? "active" : ""; ?>" id="li-link-nombre-usuario"><?php echo "<a href=\"perfil.php?id=$_SESSION[ecocycling_user_id]\">"?><i class="fas fa-user"></i> <span class="hide-size-tablet">Perfil</span></a></li>
							<li><a href="logout.php"><i class="fas fa-sign-out-alt"></i> <span class="hide-size-tablet">Cerrar sesion</span></a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
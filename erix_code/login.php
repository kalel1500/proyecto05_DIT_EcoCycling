
<style type="text/css">
	.text_centrado{
		text-align: center;
		width: 20%;
		height: 20%;
		margin-top: 20%;
		margin-left: 40%;
	}
body{
	background-image: url("imagenes/login.jpg");
}
.user{
	background-color: grey;
	   border-radius: 5px;
	   width: 70%;
	   height: 30%;
	   margin-top: 10px;
}
.pwd{
	background-color: grey;
	   border-radius: 5px;
	    width: 70%;
	   height: 30%;
}

.btn{
	margin: auto!important;
    width: 40%!important;
    background: transparent!important;
    border: 2px solid grey!important;
    border-radius: 5px;
    color: grey;
    line-height: 24px;
    transition: 0.4s all;
    cursor: pointer;
    border-color: 
}
.centrar{
	background-color: white;
	width: 120%;
	height: 180%;
}

</style>
<div class="text_centrado">
	<div class="centrar">
<form method="POST" name="loggin" action="login.proc.php" onsubmit="return validate()">
					<label></label><input class="user" type="text" id="user" name="user" placeholder="Usuario/Email" autofocus><br><br>
					<label></label><input class="pwd" type="password" id="pass" name="pass" placeholder="Contraseña">
					<br>
					<br>
					<div class="error_login">
					<?php

					if (isset($_REQUEST['err'])) {
						echo "<b>El usuario o la contraseña son incorrectos</b>";
					}
						
					?>
					</div>
					<input class="btn" type="submit" name="submit">
					</div>
				</form>
			
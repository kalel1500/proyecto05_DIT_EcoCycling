<!DOCTYPE html
<?php
  include "assets/php/conexion.php";
  if (!isset($_SESSION['ecocycling_user_id'])) {
    header("Location: login.php");
  }
?>
<html lang="es" dir="ltr">
  <head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>EcoCycling</title>
		<link rel="icon" type="image/png" href="assets/img/isotipoFooter.png"/>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

		<!-- Font awesome -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

		<!--Librerias bootstrap-->
		<!-- <script src="assets/js/jquery-3.3.1.min.js" charset="utf-8"></script> -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <meta charset="utf-8">


    <link href="assets/css/navegador.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/footer.css" rel="stylesheet" type="text/css"/>


  <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.js'></script>
  <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.48.0/mapbox-gl.css' rel='stylesheet' />
  <script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v2.3.0/mapbox-gl-geocoder.min.js'></script>
  <link rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v2.3.0/mapbox-gl-geocoder.css' type='text/css' />
  <style>
  #marker {
    background-image: url('https://docs.mapbox.com/mapbox-gl-js/assets/washington-monument.jpg');
    background-size: cover;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    cursor: pointer;
    z-index: 999;

    }

    .mapboxgl-popup {
    max-width: 240px;
    color: black;
    font-size: 14px;
    }
  </style>
  <link href="assets/css/estilos.css" rel="stylesheet" type="text/css"/>
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
              <li class="<?php echo ($ruta['filename'] == "info") ? "active" : ""; ?>"><a href="info.php"><i class="fas fa-info"></i> Información</a></li>
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

    <section>
      <article class="container">
        <div class="row">
          <h1>Localiza tu bici.</h1>
          <div class="col-md-12 info-container" style="padding:0px;">
              <div class="" id="map3" style="width:100%;height: 80%;position:relative;border-radius:42px 42px">
          </div>
        </div>
      </article>
    </section>



    </div>
    <script type="text/javascript">
      $.ajax({
        url: "assets/php/map.json.php",
        method: "GET",
        success: function (saved_markers) {
          saved_markers = JSON.parse(saved_markers);
          mapboxgl.accessToken = 'pk.eyJ1IjoiZmFraHJhd3kiLCJhIjoiY2pscWs4OTNrMmd5ZTNra21iZmRvdTFkOCJ9.15TZ2NtGk_AtUvLd27-8xA';
          var map_location = [2.154007,41.390205];
          var marker;
          var map = new mapboxgl.Map({
              container: 'map3',
              style: 'mapbox://styles/mapbox/streets-v9',
              center: map_location,
              zoom: 12
          });
          map.on('load', function() {
              add_markers(saved_markers[0]);
          });
          function add_markers(coordinates) {
              // var popup = new mapboxgl.Popup({ offset: 25 })
              //   .setText('Construction on the Washington Monument began in 1848.');


              var geojson = (saved_markers[0] == coordinates ? saved_markers[0] : '');
              console.log(geojson);
              // add markers to map

              geojson.forEach(function (marker,index) {
                var popup = new mapboxgl.Popup({ offset: 25 })
                  .setText(saved_markers[1][index]);
                  // var el = document.createElement('div');
                  //   el.id = 'marker';
                  // console.log(marker);
                  // make a marker for each feature and add to the map
                  new mapboxgl.Marker()
                      .setLngLat(marker)
                      .setPopup(popup)
                      .addTo(map);
              });

          }

        }
      });
    </script>
  </body>
</html>

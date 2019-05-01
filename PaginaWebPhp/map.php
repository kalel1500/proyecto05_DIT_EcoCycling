
<?php include "assets/php/header.php" ?>

<section>
	<article class="container">
		<div class="row">
			<h1>Localiza tu bici.</h1>
			<div class="col-md-12 info-container" style="padding:0px;">
					<div class="" id="map3" style="width:100%;height: 80%;position:relative;border-radius:42px 42px"></div>
			</div>
		</div>
	</article>
</section>

		
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

<?php include "assets/php/footer.php" ?>
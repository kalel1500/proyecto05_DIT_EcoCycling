
	<?php include "assets/php/header.php" ?>
	<script type="text/javascript">
	$(document).ready( () => {

	  let d = new Date();
	  let d2 = new Date(d.getFullYear(),d.getMonth()-1,1,0,0,0).getTime()/1000,
		  d3 = new Date(d.getFullYear(),d.getMonth(),0,23,59,59).getTime()/1000;
		  month = new Array();
			month[0] = "Enero";
			month[1] = "Febrero";
			month[2] = "Marzo";
			month[3] = "Abril";
			month[4] = "Mayo";
			month[5] = "Junio";
			month[6] = "Julio";
			month[7] = "Agosto";
			month[8] = "Septiembre";
			month[9] = "Octobre";
			month[10] = "Noviembre";
			month[11] = "Diciembre";

	  $.ajax({
		method: "GET",
		url: "assets/php/json/sessionCheck.json.php",
		success: function() {
		  $("#btn_history").trigger("click");
		}
	  })

	  function ajaxRanking (button) {
		  $.ajax({
			  method: "GET",
			  url: "assets/php/json/getRanking.json.php",
			  data: { btn: button,dataIni: d2,dataFin: d3 },
			  success: function (result) {
				  result = JSON.parse(result);
				  let options = ``;
				  for (let i = 0; i < result.length; i++) {
					options += `<tr>
					  <th scope="row" class="rowIndex">${i+1}</th>
					  <td>${result[i].user}</td>
					  <td>${Math.round(result[i].km)} km</td>
					  <td>${result[i].nivel}</td>
					</tr>`;
				  }
				  $("#rowsContainer").html(options);

			 },
			 complete: function() {
			 	$(".monthPrinter").html("<br>");
			 	if (button == 1) {
			 		$(".monthPrinter").html(`Resultados del mes: ${month[d.getMonth()]}`);
			 	}
			 	
			 }
		  });
	  }

	  $("#btn_lastMonth").on("click",() => {
		$("#btn_lastMonth").addClass("btn-active");
		$("#btn_history").removeClass("btn-active");
		ajaxRanking($("#btn_lastMonth").val());
	  });

	  $("#btn_history").on("click",() => {
		$("#btn_history").addClass("btn-active");
		$("#btn_lastMonth").removeClass("btn-active");
		ajaxRanking($("#btn_history").val());
	  });

	  $("#rotar").mouseenter(function(){
		  $(this).rotate({
			  angle: 0,
			  animateTo:360
			});
		});
	  $(".navbar-brand").css("cursor","default");
	  $(".navbar-brand").on("click", function () {
		event.preventDefault();
	  });
	});

	</script>

	
	<section>
		<div class="container">
			<div class="row">
				<h1>Ranking</h1>
					<!-- <div class="col"></div> -->
					<div class="col-md-12 info-container">
						<div class="col-12 table-responsive">
							<div class="btnContainer">
								<button type="button" class="btn btn-success btn_options btn-active" id="btn_lastMonth" value="1">Top 10 Último mes</button>
								<button type="button" class="btn btn-success btn_options" id="btn_history" value="2">Top 10 del mundo</button>
							</div>

							<table class="table table-striped table-bordered table-sm .table-condensed tblRanking">
								<caption class="monthPrinter">Top 10</caption>
								<thead class="thead-dark">
									<tr>
										<th scope="col">#</th>
										<th scope="col">Nombre de usuario</th>
										<th scope="col">Kilómetros</th>
										<th scope="col">Nivel de usuario</th>
									</tr>
								</thead>
								<tbody id="rowsContainer">
									
								</tbody>
							</table>
						</div>
					</div>
			  <!-- <div class="col"></div> -->
			</div>
		</div>
	</section>


<?php include "assets/php/footer.php" ?>
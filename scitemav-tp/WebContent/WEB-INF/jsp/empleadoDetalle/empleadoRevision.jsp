<script>
	$(document).ready(function(e) {
		var idempleado = $('#spnIdEmpleado').text();
		inicioConsultaVehiculos(idempleado);
	});
	function inicioConsultaVehiculos(idempleado){
		var filas = '';
		var columnas = '';	
	    $.ajax({
	 		url: 'getVehiculosEmpleado-'+idempleado,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(vehiculos){
	 			$.each(vehiculos, function(i, vehiculo){
	 				filas = filas +'<tr class="">'+
					'<td class="center"><a id="vehiculo_'+i+'" href="toVehiculoDetalle-'+vehiculo.idVehiculo+'">VEH-'+vehiculo.idVehiculo+'</a></td>'+
					'<td class="center">'+vehiculo.nombreMarca+'</td>'+
					'<td class="center">'+vehiculo.nombreTipoVehiculo+'</td>'+
					'<td class="center">'+vehiculo.nombreModelo+'</td>'+
					'<td class="center">'+vehiculo.fabricacion+'</td>'+
					'<td class="center">'+vehiculo.color+'</td>'+
					'<td class="center">'+vehiculo.numeroMotor+'</td>'+
					'<td class="center">'+vehiculo.numeroPlaca+'</td>'+
					'<td class="center">'+vehiculo.numeroEjes+'</td>'+
					'<td class="center">'+vehiculo.numeroRuedas+'</td>'+
					'</tr>';
				});		        
	 		},
	 		complete: function() {
	 			columnas = columnas + 
	 				'<th class="center">Codigo</th>'+
					'<th class="center">Marca</th>'+
					'<th class="center">Tipo Vehiculo</th>'+
					'<th class="center">Modelo</th>'+
					'<th class="center">Fabricación</th>'+
					'<th class="center">Color</th>'+
					'<th class="center">Número Motor</th>'+
					'<th class="center">Número Placa</th>'+
					'<th class="center">Número Ejes</th>'+
					'<th class="center">Número Ruedas</th>';
	 			realizarTabla(columnas,filas);
	 			removeNulls();
	  		}
	 	});
	}
</script>
<div class="tab-pane fade" id="vehiculo">
	<div id="spnResultList" class="resultBox section summaryPane"></div>
</div>
<script>
	$(document).ready(function(e) {
		var idCliente = $('#spnIdCliente').text();
		inicioConsulta(idCliente);
	});

	function inicioConsulta(idCliente){
		var filas = '';		
		var columnas = '';	
	    $.ajax({
	 		url: 'getClienteRevisiones-'+idCliente,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(revisiones){
	 			$.each(revisiones, function(i, revision){
	 				filas = filas +'<tr class="">'+
	 				'<td class="center"><a id="revision_"'+i+'" href="toRevisionDetalle-'+revision.idRevision+'">REV-'+revision.idRevision+'</a></td>'+
	 			//	'<td class="center">'+revision.idRevision+'</td>'+
	 				'<td class="center">'+revision.numeroPlaca+'</td>'+
	 				'<td class="center">'+revision.fechaInicio+'</td>'+
	 				'<td class="center">'+revision.fechaFin+'</td>'+
	 				'<td class="center">'+revision.fechaProxima+'</td>'+
	 				'<td class="center">'+revision.kilometrajeActual+'</td>'+
	 				'<td class="center">'+revision.kilometrajeProximo+'</td>'+ 				
	 				'<td class="center">'+revision.costoTotal+'</td>'+
	 				'<td class="center">'+revision.estado+'</td>'+
	 				n'<td class="center"><a target="_blank" href="verPDFRevision-'+revision.idRevision+'"><img width="50" height="50" src="images/pdfReport.jpg"></a></td>'+
					'</tr>';
				});		        
	 		},
	 		complete: function() {
	 			columnas = columnas + 
	 				'<th class="center">Codigo</th>'+
					'<th class="center">Vehiculo</th>'+
					'<th class="center">Fecha de inicio</th>'+
					'<th class="center">Fecha de fin</th>'+
					'<th class="center">Fecha pr�xima</th>'+
					'<th class="center">Kilometraje Actual</th>'+
					'<th class="center">Kilometraje Pr�ximo</th>'+
					'<th class="center">Costo total</th>'+
					'<th class="center">Estado</th>'+
					'<th class="center">Reporte</th>';	
					var id = 'cliRevision';
					realizarTabla2(id,columnas,filas);
	 			removeNulls();
	  		}
	 	});
	}

	
</script>
<div class="tab-pane fade" id="revision">
	<div id="spnResultList_cliRevision" class="resultBox section summaryPane"></div>
</div>
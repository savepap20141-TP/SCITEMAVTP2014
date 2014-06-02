<script>
$(document).ready(function(e) {
	var idvehiculo = $('#spnIdVehiculo').text();
	inicioConsultaRevisiones(idvehiculo);
	removeNulls();
});
function inicioConsultaRevisiones(idvehiculo){
	var filas = '';
	var columnas = '';	
    $.ajax({
 		url: 'getRevisionesVehiculos-'+idvehiculo,
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
 				'<td class="center"><a target="_blank" href="verPDFRevision-'+revision.idRevision+'"><img width="50" height="50" src="images/pdfReport.jpg"></img></a></td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 				'<th class="center">Id</th>'+
				'<th class="center">Vehiculo</th>'+
				'<th class="center">Fecha de inicio</th>'+
				'<th class="center">Fecha de fin</th>'+
				'<th class="center">Fecha próxima</th>'+
				'<th class="center">Kilometraje Actual</th>'+
				'<th class="center">Kilometraje Próximo</th>'+
				'<th class="center">Costo total</th>'+
				'<th class="center">Reporte</th>';	
 			realizarTabla(columnas,filas);
 			removeNulls();
  		}
 	});
}
</script>
<div class="tab-pane fade" id="revisiones">
	<div id="spnResultList" class="resultBox section summaryPane"></div>
</div>
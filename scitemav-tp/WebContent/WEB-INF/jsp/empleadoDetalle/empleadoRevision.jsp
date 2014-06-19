<script>
	$(document).ready(function(e) {
		var idempleado = $('#spnIdEmpleado').text();
		inicioConsultaRevisiones(idempleado);
	});
	function inicioConsultaRevisiones(idempleado){
		var filas = '';
		var columnas = '';	
	    $.ajax({
	 		url: 'getRevisionesEmpleado-'+idempleado,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(revisiones){
	 			$.each(revisiones, function(i, revision){
	 				filas = filas +'<tr class="">'+
					'<td class="center"><a id="revision'+i+'" href="toRevisionDetalle-'+revision.idRevision+'">REV-'+revision.idRevision+'</a></td>'+
					'<td class="center">'+revision.fechaInicio+'</td>'+
					'<td class="center">'+revision.fechaFin+'</td>'+
					'<td class="center">'+revision.fechaProxima+'</td>'+
					'<td class="center">'+revision.kilometrajeActual+'</td>'+
					'<td class="center">'+revision.kilometrajeProximo+'</td>'+
					'<td class="center">'+revision.costoTotal+'</td>'+					
					'</tr>';
				});		        
	 		},
	 		complete: function() {
	 			columnas = columnas + 
	 				'<th class="center">Codigo</th>'+
					'<th class="center">Fecha Inicio</th>'+
					'<th class="center">Fecha Fin</th>'+
					'<th class="center">Fecha Próxima</th>'+
					'<th class="center">Kilometraje Actual</th>'+
					'<th class="center">Kilometraje Próximo</th>'+
					'<th class="center">Costo Total</th>';
					var id = 'Rev';
					var contenido = '';
					$("#spnResultList_"+id).empty();
		
					contenido = contenido + '<table cellpadding="0" cellspacing="0" border="0" class="display dataTable" id="example_'+id+'"> '+
							' <thead class="tableGri"> '+
					            '<tr role="row">'+
					            	columnas+							                            
					            '</tr>'+
					        '</thead> '+
					        '<tbody id="'+id+'">';
					contenido = contenido + filas;   
					contenido = contenido + '</tbody>'+
							'</table> ';
					
					$("#spnResultList_"+id).append(contenido);
	 			removeNulls();
	  		}
	 	});
	}
</script>
<div class="tab-pane fade" id="revision">
	<div id="spnResultList_Rev" class="resultBox section summaryPane"></div>
</div>
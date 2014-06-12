<script>
var tipoEntidad;
var idEntidad;
var countArchivo = 0;
$(document).ready(function(e) {
	$('#hdnIdEntidadc').val(idEntidad);
	$('#hdnTipoEntidadc').val(tipoEntidad);
	listarComentarios();

});	
function listarComentarios(){
		var filas = '';
		var columnas = '';	
	    $.ajax({
	 		url: 'getComentarios',
	 		type: 'post',
	 		dataType: 'json',
	 		data:  $('#frmComentario').serialize(),
	 		success: function(coments){
	 			$.each(coments, function(i, coment){
	 				filas = filas +'<tr class="">'+
	 				'<td class="center">COM-'+coment.idComentario+'</td>'+
	 				'<td class="center" id="filaIdC_'+i+'" style="display:none;">'+coment.idComentario+'</td>'+
	 				'<td class="center">'+coment.nombreUsuario+'</td>'+
					'<td class="center">'+coment.comentario+'</td>'+
					'<td class="center">'+timeStampFormatted(coment.fechaCreacion)+'</td>'+
					'<td class="center">'+
						'<button Title="Editar" class="btn btn-success btn-circle" type="button" id="btnEditC_'+i+'" data-toggle="modal" data-target="#myModal" onclick="mostrarEditarC('+i+')"><i class="fa fa-list"></i></button>'+
						'<button Title="Eliminar" class="btn btn-danger btn-circle" type="button" id="btnDeleteC_'+i+'" data-toggle="modal" data-target="#myModalR" onclick="mostrarEliminarC('+i+','+coment.idComentario+')"><i class="fa fa-times"></i></button>'+
					'</td>'+
				    '</tr>';
				});		        
	 		},
	 		complete: function() {	 			
	 			columnas = columnas + 
 				'<th class="center">Codigo </th>'+
 				'<th class="center" style="display:none;">IdComentario</th>'+
 				'<th class="center">Creador por </th>'+
 				'<th class="center">Comentario </th>'+
 				'<th class="center">Fecha Creación </th>'+				
				'<th class="center">Acciones</th>';
	 			var id = 'Coment';
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
function registrarComentarios(){
	$.ajax({
 		url: 'registrarComentario',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmComentario').serialize(),
 		success: function(resultado){
 			listarComentarios(); 			
 		}
 	});	
}

</script>

<div class="tab-pane fade" id="comentarios">
	<h4>Comentarios</h4>
	<p>
	<form role="form" id="frmComentario" commandName="comentariobean"
					style="width: 90%;">
		<textarea id="txtNComment" class="form-control" name="comentario"
			placeholder="Escribir nuevo comentario"></textarea>
		<br>
		<input id="btnEnviarComentario" onclick="registrarComentarios();"
			class="btn btn-lg btn-success btn-block" type="button" value="Enviar"
			style="width: 20%;"></input> <span>Visibilidad: <select
			id="visibilidadComentario" class="form-control" name="visibilidad"
			style="width: 222px;">
			<option value="Privado (Empleados)">Privado (Empleados)</option>
			<option value="Privado (Cliente)">Privado (Cliente)</option>
			<option value="Privado (Empleados & Clientes)">Privado
				(Empleados & Clientes)</option>
		</select>
		<input id="hdnIdEntidadc" name="idEntidadC" type="hidden" /> 
		<input id="hdnTipoEntidadc" name="tipoEntidadC" type="hidden" />
		</span>
	</form>
	</p>
	</br>
	<div id="spnResultList_Coment" class="resultBox section summaryPane" style="overflow: auto;height: 500px"></div>
	
	</p>
</div>
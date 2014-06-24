<script>
var tipoEntidad;
var idEntidad;
var countArchivo = 0;
var idUsuario = '${pageContext.session.getAttribute("idUsuario")}';
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
					'<td class="center" id="Comentario_'+i+'">'+coment.comentario+'</td>'+
					'<td class="center">'+timeStampFormatted(coment.fechaCreacion)+'</td>'+
					'<td class="center">'+coment.visibilidad+'</td>'+
					'<td class="center">';
				    if(idUsuario==coment.idUsuario){
				    	filas += '<button Title="Editar" class="btn btn-success btn-circle" type="button" id="btnEditC_'+i+'" data-toggle="modal" data-target="#myModalEC" onclick="mostrarEditarCom('+i+')"><i class="fa fa-list"></i></button>'+
						'<button Title="Eliminar" class="btn btn-danger btn-circle" type="button" id="btnDeleteC_'+i+'" data-toggle="modal" data-target="#myModalR" onclick="mostrarEliminarC('+i+','+coment.idComentario+')"><i class="fa fa-times"></i></button>';
				    }
				    filas += '</td>'+
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
 				'<th class="center">Visibilidad </th>'+
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
					        ' <thead class="tableGri" id="FiltroCol_'+id+'"> '+
					            '<tr role="row">'+
					            	columnas+							                            
					            '</tr>'+
					        '</thead> '+
				        '<tbody id="'+id+'">';
				contenido = contenido + filas;   
				contenido = contenido + '</tbody>'+
						'</table> ';
				
				$("#spnResultList_"+id).append(contenido);
				$('#example_'+id+' #FiltroCol_'+id+' th').each( function () {
				    var title = $('#example_'+id+' #FiltroCol_'+id+' th').eq( $(this).index() ).text();
				    $(this).html( '<input type="text" class="search_init" name="search_'+title+'" placeholder="Buscar '+title+'" />' );
				});	
				
				multiFiltrosColumnasId(id);
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
 			$('#txtNComment').val('');
 			listarComentarios(); 			
 		}
 	});	
}

function mostrarEditarCom(ind){
	$('#myModalLabel').empty();
	$('#myModalLabel').append('Editar Comentario');
	$('#txtIdCo').val($('#filaIdC_'+ind).text());
	$('#txtComentario1').val($('#Comentario_'+ind).text());
	
}

function editarComentario(){
	
	var formElement = document.getElementById("frmEditarComentario");
	var formData = new FormData(formElement);	
	$.ajax({
   		url: 'editarComentario',
   		type: 'post',
   		data:  formData,
		mimeType:"multipart/form-data",
		contentType: false,
	    cache: false,
		processData:false,
		beforeSend: function(){
			//$.blockUI({ message: $('#domMessage') });
	    },
   		success: function(result){
   			$('#resultOkFa3').hide();
			$('#resultFalse').hide();	
			//alert(result);
			var res  = ''+result;
   			if(res == 'true'){   				
   				//$('#resultOk').append('Se ha registrado correctamente');
   				$('#resultOkFa3').show();
   				$('#txtIdEmRe').val('');   
   				listarComentarios();
   				//inicioConsultaFalla();
   			}else{
   				$('#resultFalse').show();
   				//$('#resultFalse').append('Se ha producido un error al registrarse');
   			}
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
	
	<div class="modal fade" id="myModalEC" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabelEC">Editar Comentario</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="frmEditarComentario" method="post"
						commandName="comentariobean" enctype="multipart/form-data"
						style="width: 30%; margin-left: 10%;">

						<fieldset>
							<div class="form-group" style="display: none">
								<label> Id Revision</label> <input class="form-control"
									name="idRevision" id="txtIdCoRe" />
							</div>

							<div class="form-group" style="display: none">
								<label> Id Comentario</label> <input class="form-control"
									name="idComentario" id="txtIdCo" />
							</div>

							<div class="form-group">
								<label>Comentario:</label>
								<textarea id="txtComentario1" class="form-control"
									name="comentario" placeholder="Comentario"></textarea>
							</div>
							
							


						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="editarComentario();">Guardar</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="$('#txtIdCoRe').val('');$('#txtIdCo').val('');$('#txtComentario1').val('');">Cancelar</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	</br>
	<div id="spnResultList_Coment" class="resultBox section summaryPane" style="overflow: auto;height: 500px"></div>
	
	</p>
</div>


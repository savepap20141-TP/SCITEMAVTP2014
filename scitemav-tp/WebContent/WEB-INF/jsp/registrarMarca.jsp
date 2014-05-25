<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de marca</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
$(document).ready(function(e){
	inicioConsulta();
	$('#frmRegistroMarca').validate({
		rules:{
			nombre:{
			required: true,
			}
		},	
		messages:{
			nombre:{
			required: "Se debe ingresar un nombre de marca",
			}
		},			
		submitHandler: function(form){
			form.submit();
		}		
	});
});

function inicioConsulta(){
	var filas = '';	
	var columnas = '';
	
    $.ajax({
 		url: 'getMarcas',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(marca){
 			$.each(marca, function(i, mar){
 				var imagen = '';
 				if(mar.urlImagen!=null || mar.urlImagen!=''){
 					imagen = '<img width="150" height="150" src="'+mar.urlImagen+'"></img>';
 				}
 				filas = filas +'<tr class="">'+
				'<td class="center" id="filaId_'+i+'">'+mar.idMarca+'</td>'+
				'<td class="center" id="filaNombre_'+i+'">'+mar.nombre+'</td>'+
				'<td class="center">'+imagen+'</td>'+
				'<td class="center"><button class="btn btn-success btn-circle" type="button" id="btnEdit_'+i+'" data-toggle="modal" data-target="#myModal" onclick="mostrarEditar('+i+')"><i class="fa fa-list"></i></button></td>'+
				'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+i+'"><i class="fa fa-times"></i></button></td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + '<th class="center">Id Marca</th><th class="center">Nombre</th><th class="center">Logo</th><th class="center">Editar</th><th class="center">Eliminar</th>';
 			realizarTabla(columnas,filas); 		
 			removeNulls();
  		}
 	});	  
		
}

</script>
<script>
function mostrarEditar(ind){
	$('#myModalLabel').empty();
	$('#myModalLabel').append('Editar Marca');
	$('#txtIdMC').val($('#filaId_'+ind).text());
	$('#txtNombre').val($('#filaNombre_'+ind).text());
}
function registrarMarca(){
	var formElement = document.getElementById("frmRegistroMarca");
	var formData = new FormData(formElement);		
	$.ajax({
 		url: 'registroMarca',
 		type: "POST",
		data:  formData,
		mimeType:"multipart/form-data",
		contentType: false,
	    cache: false,
		processData:false,
		beforeSend: function(){
			//$.blockUI({ message: $('#domMessage') });
	    },
 		success: function(result){
 			$('#resultOk').hide();
			$('#resultFalse').hide();			
   			if(result == 'true'){   				
   				//$('#resultOk').append('Se ha registrado correctamente');
   				$('#resultOk').show();
   				$('#txtNombre').val('');
   				$('#txtIdMC').val('');
   				$('#txturlImagen').val('');
   				inicioConsulta();
   			}else{
   				$('#resultFalse').show();
   				//$('#resultFalse').append('Se ha producido un error al registrarse');
   			}
 			inicioConsulta();
		},
	    complete: function() {
		}		
 	});
}



</script>
<body>
 <div id="wrapper">

		<jsp:include page="componentes/cabecera.jsp" />
		
		<jsp:include page="componentes/menu.jsp" />		
		
		
		  <div id="page-wrapper">
		
		   <div class="row">
				<div class="col-lg-12">
					<br></br>
				</div>
			</div>

			<div class="row">
			
				<div class="col-lg-12" style="width:90%;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> Registro de marca
							<div class="pull-right">
								<div class="btn-group"></div>
							</div>
						</div>
						<div class="panel-body">
						<!-- Button trigger modal -->
                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                Nueva Marca
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Registrar Marca</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<form role="form" id="frmRegistroMarca" 
											 method="post" commandName="marcaBean" enctype="multipart/form-data"  style="width: 30%; margin-left: 10%;">
			
												<fieldset>					
													<div class="form-group" style="display:none">
															<label> Id Marca</label> <input 
															class="form-control" name="idMarca" id="txtIdMC"/>
													</div>			
																	
													<div class="form-group">
														<label> Nombre Marca</label> <input id="txtNombre"
														class="form-control" name="nombre" placeholder="Nombre"></input>
													</div>
													
													<div class="form-group">
							                            <label>Imagen de ejemplo: </label>
							                            <input type="file" name="file" id="fileimagen">
							                        </div>
															
												</fieldset>
											</form>
                                        </div>
                                        <div class="modal-footer">
                                        	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="registrarMarca();">Guardar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#txtIdMC').val('');$('#txtNombre').val('');$('#fileimagen').val('');">Cancelar</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->

						</div>
						<!-- .panel-body -->
						<div class="panel-body">
							<div class="alert alert-success alert-dismissable" id="resultOk" style="display:none">
    							<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
								Se ha guardo correctamente
							</div>
							<div class="alert alert-danger alert-dismissable" id="resultFalse" style="display:none">
    							<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
								Se ha producido un error al guardar
							</div>
							<div class="row">
									<div class="col-lg-12">
					                    <div class="panel panel-default">
					                        <div class="panel-heading">
					                            Lista de Marcas
					                        </div>
					                        <!-- /.panel-heading -->
					                        <div class="panel-body">
					                            <div class="table-responsive">
					                            	<div id="spnResultList" class="resultBox section summaryPane"></div>
					                            </div>
					                        </div>
					                        <!-- /.panel-body -->
					                    </div>
					                    <!-- /.panel -->
					                </div>
					                <!-- /.col-lg-12 -->
															
							</div>
						</div>
				</div>
		</div>
		</div>
</div>
 </div>
</body>
</html>

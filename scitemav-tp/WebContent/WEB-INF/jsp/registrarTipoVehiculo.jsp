<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrar Tipo de Vehiculo</title>
<jsp:include page="componentes/head.jsp" />
</head>
<style>
label.error {
	margin-left: 10px;
	width: auto;
	display: inline;
	color: rgb(255, 0, 0);
	font-weight: bold;
}

label.ok {
	margin-left: 10px;
	width: auto;
	display: inline;
	color: green;
	font-weight: bold;
}
</style>
<script>

$(document).ready(function(e){
	inicioConsulta();
	$("#frmRegistroTipoVehiculo").validate({
		rules: {
			nombre: {
				required: true
			}                                       
		},
		messages: {
			nombre: "*"
		}
	});
});
function inicioConsulta(){
	var filas = '';	
	var columnas = '';
	
    $.ajax({
 		url: 'getTipoVehiculos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(tipvehiculos){
 			$.each(tipvehiculos, function(i, tipveh){
 				var imagen = '';
 				if(tipveh.urlImagen!=null){
 					imagen = '<img width="150" height="150" src="'+tipveh.urlImagen+'"></img>';
 				}
 				filas = filas +'<tr class="">'+
				'<td class="center" id="filaId_'+i+'">'+tipveh.idTipoVehiculo+'</td>'+
				'<td class="center" id="filaNombre_'+i+'">'+tipveh.nombre+'</td>'+
				'<td class="center">'+imagen+'</td>'+
				'<td class="center"><button class="btn btn-success btn-circle" type="button" id="btnEdit_'+i+'" data-toggle="modal" data-target="#myModal" onclick="mostrarEditar('+i+')"><i class="fa fa-list"></i></button></td>'+
				'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+i+'" data-toggle="modal" data-target="#myModal1" onclick="mostrarEliminar('+i+')"><i class="fa fa-times"></i></button></td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + '<th class="center">Codigo</th><th class="center">Nombre</th><th class="center">Logo</th><th class="center">Editar</th><th class="center">Eliminar</th>';
 			realizarTabla(columnas,filas); 		
 			removeNulls();
  		}
 	});	  
		
}

</script>
<script type="text/javascript">
function mostrarEditar(ind){
	$('#myModalLabel').empty();
	$('#myModalLabel').append('Editar Tipo de Vehiculo');
	$('#txtIdTV').val($('#filaId_'+ind).text());
	$('#txtNombreTV').val($('#filaNombre_'+ind).text());
}

function mostrarEliminar(ind){
	$('#myModalLabel').empty();
	$('#myModalLabel').append('Eliminar Tipo de Vehiculo');
	$('#txtIdTV1').val($('#filaId_'+ind).text());	
}
function registrarTipoVehiculo(){
	if($('#txtNombreTV').val()==''){
		alert('Completar los campos obligatorios');
	}else{
		var formElement = document.getElementById("frmRegistroTipoVehiculo");
		var formData = new FormData(formElement);	
		$.ajax({
	   		url: 'registroTipoVehiculo',
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
	   			$('#resultOk').hide();
				$('#resultFalse').hide();	
				//alert(result);
				var res  = ''+result;
	   			if(res == 'true'){   				
	   				//$('#resultOk').append('Se ha registrado correctamente');
	   				$('#resultOk').show();
	   				$('#txtNombreTV').val('');
	   				$('#txtIdTV').val('');
	   				inicioConsulta();
	   			}else{
	   				$('#resultFalse').show();
	   				//$('#resultFalse').append('Se ha producido un error al registrarse');
	   			}
	   		}
	   	});
	}	
}
function eliminarTipoVehiculo(){
	
		var formElement = document.getElementById("frmEliminarTipoVehiculo");
		var formData = new FormData(formElement);	
		$.ajax({
	   		url: 'eliminarTipoVehiculo',
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
	   			$('#resultOk1').hide();
				$('#resultFalse').hide();	
				//alert(result);
				var res  = ''+result;
	   			if(res == 'true'){   				
	   				//$('#resultOk').append('Se ha registrado correctamente');
	   				$('#resultOk1').show();
	   				$('#txtIdTV1').val('');
	   				inicioConsulta();
	   			}else{
	   				$('#resultFalse').show();
	   				//$('#resultFalse').append('Se ha producido un error al registrarse');
	   			}
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
			
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> Administrar Tipo de Vehículo
							<div class="pull-right">
								<div class="btn-group"></div>
							</div>
						</div>
						<!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Button trigger modal -->
                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                Nuevo Tipo de Vehiculo
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Registrar Tipo de Vehiculo</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<form role="form" id="frmRegistroTipoVehiculo"
													method="post" commandName="tipovehiculo"
													style="width: 60%; margin-left: 20%;">				
													<fieldset>		
														<div class="form-group" style="display:none">
															<label> Id Tipo vehiculo</label> <input 
															class="form-control" name="idTipoVehiculo" id="txtIdTV"/>
														</div>
																									
														<div class="form-group">
															<label> Nombre Tipo de Vehiculo: </label> <input required 
															class="form-control" name="nombre"  placeholder="Nombre" id="txtNombreTV"/>
														</div>
														
				                                        <div class="form-group">
				                                            <label>Imagen de ejemplo: </label>
				                                            <input type="file" name="file" id="fileimagen">
				                                        </div>	
															<p><br>
														</p>
													</fieldset>
												</form>	
                                        
                                        
                                        </div>
                                        <div class="modal-footer">
                                        	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="registrarTipoVehiculo();">Guardar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#txtIdTV').val('');$('#txtNombreTV').val('');$('#txtIdTV').val('');">Cancelar</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                        </div>
                        <div class="panel-body">                            
                            <!-- Modal -->
                            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel1">Eliminar Tipo de Vehiculo</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<form role="form" id="frmEliminarTipoVehiculo"
													method="post" commandName="tipovehiculo"
													style="width: 60%; margin-left: 20%;">				
													<fieldset>
													    <div>¿Eliminar a este tipo de vehículo?</div>		
														<div class="form-group" style="display:none">
															<label> Id Tipo vehiculo</label> <input 
															class="form-control" name="idTipoVehiculo" id="txtIdTV1"/>
														</div>
																									
														
														</p>
													</fieldset>
												</form>	
                                        
                                        
                                        </div>
                                        <div class="modal-footer">
                                        	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarTipoVehiculo();">Eliminar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#txtIdTV1').val('');">Cancelar</button>
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
							<div class="alert alert-success alert-dismissable" id="resultOk1" style="display:none">
    							<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
								Se ha eliminado correctamente
							</div>
							<div class="row">
									<div class="col-lg-12">
					                    <div class="panel panel-default">
					                        <div class="panel-heading">
					                            Lista de Tipos de Vehiculo
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Repuesto</title>
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
	listarTiporepuestos();
	$("#frmRegistroRepuesto").validate({
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
 		url: 'getRepuesto',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(repuesto){
 			$.each(repuesto, function(i,rep){
 				filas = filas +'<tr class="">'+
				'<td class="center" id="filaId_'+i+'">'+rep.idRepuesto+'</td>'+
				'<td class="center" id="filaNombre_'+i+'">'+rep.nombre+'</td>'+
				'<td class="center" id="filaTipId_'+i+'" style="display:none">'+rep.idTipoRepuesto+'</td>'+
				'<td class="center" id="filaNombreTipoRepuesto_'+i+'">'+rep.nombreTipoRepuesto+'</td>'+
				'<td class="center"><button class="btn btn-success btn-circle" type="button" id="btnEdit_'+i+'" data-toggle="modal" data-target="#myModal" onclick="mostrarEditar('+i+')"><i class="fa fa-list"></i></button></td>'+
				'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+i+'"><i class="fa fa-times"></i></button></td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + '<th class="center">Codigo</th><th class="center">Nombre</th><th class="center" style="display:none">Id Tipo Repuesto</th><th class="center">Nombre Tipo Repuesto</th><th class="center">Editar</th><th class="center">Eliminar</th>';
 			realizarTabla(columnas,filas); 			
  		}
 	});	  
		
}
</script>
<script type="text/javascript">
function mostrarEditar(ind){
	$('#myModalLabel').empty();
	$('#myModalLabel').append('Editar Repuesto');
	$('#txtIdR').val($('#filaId_'+ind).text());
	$('#txtNombreR').val($('#filaNombre_'+ind).text());
	$('#comboTiporepuestos').val($('#filaTipId_'+ind).text());
}
function registrarRepuesto(){
	if($('#txtNombreR').val()==''){
		alert('Completar los campos obligatorios');
	}else{
		$.ajax({
	   		url: 'registroRepuesto',
	   		type: 'post',
	   		dataType: 'json',
	   		data: $('#frmRegistroRepuesto').serialize(),
	   		success: function(result){
	   			$('#resultOk').hide();
				$('#resultFalse').hide();			
	   			if(result == true){   				
	   				//$('#resultOk').append('Se ha registrado correctamente');
	   				$('#resultOk').show();
	   				$('#comboTiporepuestos').val('');
	   				$('#txtNombreR').val('');
	   				$('#txtIdR').val('');
	   				inicioConsulta();
	   			}else{
	   				$('#resultFalse').show();
	   				//$('#resultFalse').append('Se ha producido un error al registrarse');
	   			}
	   		}
	   	});
	}	
}
</script>
<script>

function listarTiporepuestos(){
	
	$.ajax({
 		url: 'getTipoRepuestos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(tiporepuesto){
 			$('#comboTiporepuestos').empty();
 			$('#comboTiporepuestos').append('<option value="">Seleccione su Tipo</option>');
 			$.each(tiporepuesto, function(i, tiporepuestos){
 				$('#comboTiporepuestos').append('<option value="'+tiporepuestos.idTipoRepuesto+'">'+tiporepuestos.nombre+'</option>');				
			});
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
							<i class="fa fa-bar-chart-o fa-fw"></i> Administrar Repuesto
							<div class="pull-right">
								<div class="btn-group"></div>
							</div>
						</div>
						<!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Button trigger modal -->
                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                Nuevo Repuesto
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Registrar Repuesto</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<form role="form" id="frmRegistroRepuesto"
													method="post" commandName="repuesto"
													style="width: 60%; margin-left: 20%;">				
													<fieldset>		
														<div class="form-group" style="display:none">
															<label> Id repuesto</label> <input 
															class="form-control" name="idRepuesto" id="txtIdR"/>
														</div>
																									
														<div class="form-group">
															<label> Nombre repuesto: </label> <input required 
															class="form-control" name="nombre"  placeholder="Nombre" id="txtNombreR"/>
														</div>
														<div class="form-group">
														<label> Nombre Tipo de repuesto:</label> 										
														<select class="form-control" id="comboTiporepuestos" name="idTipoRepuesto">
														</select>
														</div>
				                                        <!-- <div class="form-group">
				                                            <label>Imagen de ejemplo: </label>
				                                            <input type="file">
				                                        </div>	 -->
															<p><br>
														</p>
													</fieldset>
												</form>	
                                        
                                        
                                        </div>
                                        <div class="modal-footer">
                                        	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="registrarRepuesto();">Guardar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#comboTiporepuestos').val('');$('#txtNombreR').val('');$('#txtIdR').val('');">Cancelar</button>
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
					                            Lista de Repuesto
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
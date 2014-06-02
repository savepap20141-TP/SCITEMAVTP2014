<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Fallas</title>
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
	listarTipofallas();
	$("#frmRegistroFalla").validate({
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
 		url: 'getFalla',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(falla){
 			$.each(falla, function(i,fal){
 				filas = filas +'<tr class="">'+
				'<td class="center" id="filaId_'+i+'">'+fal.idFalla+'</td>'+
				'<td class="center" id="filadescripcion_'+i+'">'+fal.descripcion+'</td>'+
				'<td class="center" id="filaTipId_'+i+'" style="display:none">'+fal.idTipoFalla+'</td>'+
				'<td class="center" id="filanombreTipoFalla_'+i+'">'+fal.nombreTipoFalla+'</td>'+
				'<td class="center"><button class="btn btn-success btn-circle" type="button" id="btnEdit_'+i+'" data-toggle="modal" data-target="#myModal" onclick="mostrarEditar('+i+')"><i class="fa fa-list"></i></button></td>'+
				'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+i+'"><i class="fa fa-times"></i></button></td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + '<th class="center">Id Falla</th><th class="center">descripcion</th><th class="center" style="display:none">Id Tipo Falla</th><th class="center">Nombre Tipo Falla</th><th class="center">Editar</th><th class="center">Eliminar</th>';
 			realizarTabla(columnas,filas); 			
  		}
 	});	  
		
}
</script>
<script type="text/javascript">
function mostrarEditar(ind){
	$('#myModalLabel').empty();
	$('#myModalLabel').append('Editar Fallas');
	$('#txtIdF').val($('#filaId_'+ind).text());
	$('#txtNombreF').val($('#filadescripcion_'+ind).text());
	$('#comboTipofallas').val($('#filaTipId_'+ind).text());
}
function registrarFalla(){
	if($('#txtNombreF').val()==''){
		alert('Completar los campos obligatorios');
	}else{
		$.ajax({
	   		url: 'registroFalla',
	   		type: 'post',
	   		dataType: 'json',
	   		data: $('#frmRegistroFalla').serialize(),
	   		success: function(result){
	   			$('#resultOk').hide();
				$('#resultFalse').hide();			
	   			if(result == true){   				
	   				//$('#resultOk').append('Se ha registrado correctamente');
	   				$('#resultOk').show();
	   				$('#comboTipofallas').val('');
	   				$('#txtNombreF').val('');
	   				$('#txtIdF').val('');
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

function listarTipofallas(){
	
	$.ajax({
 		url: 'getTipoFallas',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(tipofalla){
 			$('#comboTipofallas').empty();
 			$('#comboTipofallas').append('<option value="">Seleccione su Tipo</option>');
 			$.each(tipofalla, function(i, tipofallas){
 				$('#comboTipofallas').append('<option value="'+tipofallas.idTipoFalla+'">'+tipofallas.nombreTipoFalla+'</option>');				
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
							<i class="fa fa-bar-chart-o fa-fw"></i> Administrar Falla
							<div class="pull-right">
								<div class="btn-group"></div>
							</div>
						</div>
						<!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Button trigger modal -->
                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                Nuevo Falla
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Registrar Falla</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<form role="form" id="frmRegistroFalla"
													method="post" commandName="fallaBean"
													style="width: 60%; margin-left: 20%;">				
													<fieldset>		
														<div class="form-group" style="display:none">
															<label> Id falla</label> <input 
															class="form-control" name="idFalla" id="txtIdF"/>
														</div>
																									
														<div class="form-group">
															<label> Descripcion: </label> <input required 
															class="form-control" name="descripcion"  placeholder="Descripcion" id="txtNombreF"/>
														</div>
														<div class="form-group">
														<label> Nombre Tipo de Falla:</label> 										
														<select class="form-control" id="comboTipofallas" name="idTipoFalla">
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
                                        	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="registrarFalla();">Guardar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#comboTipofallas').val('');$('#txtNombreF').val('');$('#txtIdF').val('');">Cancelar</button>
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
					                            Lista de Falla
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
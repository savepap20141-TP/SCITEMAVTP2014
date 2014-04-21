<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar Vehiculo</title>
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
});

function inicioConsulta(){
	var filas = '';	
	var columnas = '';
	
    $.ajax({
 		url: 'getVehiculos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(vehiculos){
 			$.each(vehiculos, function(i, veh){
 				filas = filas +'<tr class="">'+
				'<td class="center" id="filaId_'+i+'">'+veh.idVehiculo+'</td>'+
				'<td class="center" id="filaNombre'+i+'">'+veh.idCliente+'</td>'+
				'<td class="center" id="filaColor'+i+'">'+veh.color+'</td>'+
				'<td class="center"><button class="btn btn-success btn-circle" type="button" id="btnEdit_'+i+'" data-toggle="modal" data-target="#myModal" onclick="mostrarEditar('+i+')"><i class="fa fa-list"></i></button></td>'+
				'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+i+'"><i class="fa fa-times"></i></button></td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + '<th class="center">Id Vehiculo</th><th class="center">Nombre</th><th class="center">Color</th><th class="center">Editar</th><th class="center">Eliminar</th>';
 			realizarTabla(columnas,filas); 			
  		}
 	});	  
		
}
</script>
<script type="text/javascript">
function mostrarEditar(ind){
	$('#myModalLabel').empty();
	$('#myModalLabel').append('Editar Vehiculo');
	$('#txtIdV').val($('#filaId_'+ind).text());
	$('#txtNombreV').val($('#filaNombre_'+ind).text());
	$('#txtColorV').val($('#filaColor_'+ind).text());
}
function registrarVehiculo(){
	if($('#txtNombreV').val()==''){
		alert('Completar los campos obligatorios');
	}else{
		$.ajax({
	   		url: 'registroVehiculo',
	   		type: 'post',
	   		dataType: 'json',
	   		data: $('#frmRegistroVehiculo').serialize(),
	   		success: function(result){
	   			$('#resultOk').hide();
				$('#resultFalse').hide();			
	   			if(result == true){   				
	   				//$('#resultOk').append('Se ha registrado correctamente');
	   				$('#resultOk').show();
	   				$('#txtIdV').val('');
	   				$('#txtNombreV').val('');
	   				$('#txtColorV').val('');	   				
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
<body>
	<div id="wrapper">

		<jsp:include page="componentes/cabecera.jsp" />

		<jsp:include page="componentes/menu.jsp" />

		<div id="page-wrapper">

			<!-- TITULO -->
			<div class="row">
			
				<div class="col-lg-12">
					<br></br>
				</div>
				
			</div>
			
			<!-- FORM -->
			<div class="row">
			
			<div class="col-lg-12" style="width:90%;">
				<div class="panel panel-default">
					<div class="panel-heading">
					<i class="fa fa-bar-chart-o fa-fw"></i>Registro de nuevo vehículo
					<div class="pull-right">
								<div class="btn-group"></div>
							</div>
					</div>
					
					<!-- Button trigger modal -->
                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                                Nuevo Vehiculo
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Registrar Vehiculo</h4>
                                        </div>
                                        <div class="modal-body">
							<form role="form" id="frmRegistroVehiculo" 
									method="post" commandName="vehiculo"
									 style="width: 90%; padding-left: 10%;">
							<fieldset>						
								<div class="col-lg-6">						
									<!-- PRIMERA COLUMNA -->
									<div class="form-group" style="display:none">
															<label> Id vehiculo</label> <input 
															class="form-control" name="idVehiculo" id="txtIdV"/>
														</div>
									
									
										<div class="form-group input-group">
											<label>DNI del cliente</label>
                                            <input type="text" class="form-control" id="txtDniCliente" name="DNI" placeholder="DNI del Cliente">
                                            <span class="input-group-btn">
                                                <button style="margin-top:25px; height: 34px;" class="btn btn-default" type="button"><i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>					
                                        
                                        <div class="form-group">
                                            <label>Marca</label>
                                            <select class="form-control" id="comboMarca">
                                            </select>
                                        </div>         

                                        <div class="form-group">
                                            <label>Modelo</label>
                                            <select class="form-control" id="comboModelo">
                                            </select>
                                        </div>           
                                        
                                        <div class="form-group">
                                            <label>Tipo de Vehiculo</label>
                                            <select class="form-control" id="comboTipo">
                                            </select>
                                        </div>                                                                                                                    																											
										
										<div class="form-group">
											<label>Año de fabricacion</label> 
											<input id="txtAño" class="form-control"
											 name="añoFabricacion" placeholder="Año"></input>
										</div>
										
										<div class="form-group">
											<label>Número de motor</label> 
											<input id="txtNumMotor" class="form-control"
											 name="numeroMotor" placeholder="Numero de motor"></input>
										</div>
										
										<div class="form-group">
											<label>Número de placa</label> 
											<input id="txtNumPlaca" class="form-control"
											 name="numeroPlaca" placeholder="Numero de placa"></input>
										</div>	
										
										<div class="form-group">
											<label style="margin-top: 7px; margin-bottom: 10px;">Número de ejes</label><br>
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje1" value="1">1</label> 											
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje2" value="2">2</label>
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje3" value="2">3</label>
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje4" value="2">4</label>
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje5" value="2">5</label>
										</div>																																
										
										<div class="form-group">
											<label>Número de cilindros</label> 
											<input id="txtNumCilindros" class="form-control"
											 name="numeroCilindros" placeholder="Numero de cilindros"></input>
										</div>	
										
										<div class="form-group">
											<label>Número de serie</label> 
											<input id="txtNumSerie" class="form-control"
											 name="numeroSerie" placeholder="Numero de serie"></input>
										</div>																																																																																																					
											
									<!-- FINAL PRIMERA COLUMNA -->								
								</div>
								<div class="col-lg-6">
									<!-- SEGUNDA COLUMNA -->
									
										<div class="form-group">
											<label>Color</label> 
											<input id="txtColorV" class="form-control"
											 name="color" placeholder="Color"></input>
										</div>									
										
										<div class="form-group">
											<label>Número de pasajeros</label> 
											<input id="txtNumPasajeros" class="form-control"
											 name="numeroPasajeros" placeholder="Numero de pasajeros"></input>
										</div>
										
										<div class="form-group">
											<label>Número de asientos</label> 
											<input id="txtNumAsientos" class="form-control"
											 name="numeroAsientos" placeholder="Numero de asientos"></input>
										</div>	
										
										<div class="form-group">
											<label>Peso seco</label> 
											<input id="txtPesoSeco" class="form-control"
											 name="pesoSeco" placeholder="Peso en seco(KG)"></input>
										</div>	
										
										<div class="form-group">
											<label>Peso bruto</label> 
											<input id="txtPesoBruto" class="form-control"
											 name="pesoBruto" placeholder="Peso bruto(KG)"></input>
										</div>	
										
										<div class="form-group">
											<label>Longitud</label> 
											<input id="txtLongitud" class="form-control"
											 name="longitud" placeholder="Longitud(m)"></input>
										</div>	
										
										<div class="form-group">
											<label>Altura</label> 
											<input id="txtAltura" class="form-control"
											 name="altura" placeholder="Altura(m)"></input>
										</div>	
										
										<div class="form-group">
											<label>Ancho</label> 
											<input id="txtAncho" class="form-control"
											 name="ancho" placeholder="Ancho(m)"></input>
										</div>		
										
										<div class="form-group">
											<label>Carga util</label> 
											<input id="txtCargaUtil" class="form-control"
											 name="cargaUtil" placeholder="Carga Util(KG)"></input>
										</div>											
										
										<div class="form-group">
											<label>Número de ruedas</label> 
											<input id="txtNumRuedas" class="form-control"
											 name="numeroRuedas" placeholder="Numero de ruedas"></input>
										</div>																																																										
																																					
									<!-- FINAL SEGUNDA COLUMNA -->
								</div>		
							</fieldset>							
							</form>
						</div>
					<div class="modal-footer">
                                        	<button type="button" class="btn btn-primary" onclick="registrarVehiculo();">Guardar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                        </div>
			</div>			
			
			</div>

		</div>
		</div>
		</div>
		
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
					                            Lista de Vehiculos
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
	
		
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar Vehiculo</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
$(document).ready(function(e){
	listarClientes();
	listarTipoVehiculos();
	listarModelos();
	listarMarcas();
});
</script>
<script>

function listarClientes(){
	
	$.ajax({
 		url: 'getClientes',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(clientes){
 			$('#comboCliente').empty();
 			$.each(clientes, function(i, cliente){
 				$('#comboCliente').append('<option value="'+cliente.idCliente+'">'+cliente.nombre+' '+cliente.apellidoPaterno+' - '+cliente.dni+'</option>');				
			});
 		}
 	});	
	
}

function listarTipoVehiculos(){
	
	$.ajax({
 		url: 'getTipoVehiculos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(tipovehiculos){
 			$('#comboTipovehiculo').empty();
 			$.each(tipovehiculos, function(i, tipovehiculo){
 				$('#comboTipovehiculo').append('<option value="'+tipovehiculo.idTipoVehiculo+'">'+tipovehiculo.nombre+'</option>');				
			});
 		}
 	});	
	
}

function listarModelos(){
	
	$.ajax({
 		url: 'getModelos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(modelos){
 			$('#comboModelo').empty();
 			$.each(modelos, function(i, modelo){
 				$('#comboModelo').append('<option value="'+modelo.idModelo+'">'+modelo.nombre+'</option>');				
			});
 		}
 	});	
	
}

function listarMarcas(){
	
	$.ajax({
 		url: 'getMarcas',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(marcas){
 			$('#comboMarca').empty();
 			$.each(marcas, function(i, marca){
 				$('#comboMarca').append('<option value="'+marca.idMarca+'">'+marca.nombre+'</option>');				
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
					</div>
					
					<div class="panel-body">
						<div class="row">
							<form role="form" id="frmRegistroVehiculo" action="registroVehiculo"
									method="post" commandName="vehiculobean" style="width: 90%; padding-left: 10%;">
							<fieldset>						
								<div class="col-lg-6">						
									<!-- PRIMERA COLUMNA -->
									
										<!--   <div class="form-group input-group">
											<label>DNI del cliente</label>
                                            <input type="text" class="form-control" id="txtDniCliente" name="idCliente" placeholder="DNI del Cliente">
                                            <span class="input-group-btn">
                                                <button style="margin-top:25px; height: 34px;" class="btn btn-default" type="button"><i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>	-->	
                                        
                                        <div class="form-group">
                                            <label>Cliente</label>
                                            <select class="form-control" id="comboCliente" name="idCliente">
                                                 <option value="">Seleccione el cliente</option>
                                            </select>
                                        </div>			
                                        
                                        <div class="form-group">
                                            <label>Marca</label>
                                            <select class="form-control" id="comboMarca" name="idMarca">
                                                 <option value="">Seleccione la marca</option>
                                            </select>
                                        </div>         

                                        <div class="form-group">
                                            <label>Modelo</label>
                                            <select class="form-control" id="comboModelo" name="idModelo">
                                                 <option value="">Seleccione el modelo</option>
                                            </select>
                                        </div>           
                                        
                                        <div class="form-group">
                                            <label>Tipo de Vehiculo</label>
                                            <select class="form-control" id="comboTipovehiculo" name="idTipoVehiculo">
                                            <option value="">Seleccione el tipo</option>
                                            </select>
                                        </div>                                                                                                                    																											
										
										<div class="form-group">
											<label>Año de fabricacion</label> 
											<input id="txtAño" class="form-control"
											 name="fabricacion" placeholder="Año"></input>
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
											<input id="txtColor" class="form-control"
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
																
								
										<input class="btn btn-lg btn-success btn-block" 
										type="submit" value="Registrar Vehiculo" style="width: 60%; margin-left: 20%; margin-top: 10%;"/>
										<p>
											<label class="error"><c:out value="${msg}" /></label>
										</p>
							</fieldset>							
							</form>
						</div>
					</div>
				</div>
			</div>			
			
			</div>

		</div>
	</div>	
</body>
</html>

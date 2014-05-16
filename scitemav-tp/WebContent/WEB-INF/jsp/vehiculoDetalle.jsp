<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vehiculo Detalle</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
	$(document).ready(function(e) {
		var idvehiculo = $('#spnIdVehiculo').text();
		inicioConsulta(idvehiculo);
		listarTipoVehiculos();
		listarModelos();
		listarMarcas();
		removeNulls();
	});

	function EditInformacionVehiculo(){
		$.ajax({
	   		url: 'ajaxEditInformacionVehiculo',
	   		type: 'post',
	   		dataType: 'json',
	   		data: $('#frmEdicionVehiculo').serialize(),
	   		success: function(vehiculo){
	   			IniciarInfoVehiculo(vehiculo);
	 			$('.vistaInformacion').show();
	 			$('.edicionInformacion').hide();
	 			$('#btnVerInformacion').hide();
	 			$('#btnVerEdicion').show();
	   		}
	   	});
	}
	function inicioConsulta(idvehiculo) {
		$.ajax({
					url : 'getInformacionVehiculo-' + idvehiculo,
					type : 'POST',
					dataType : 'json',
					data : '',
					success : function(vehiculo) {
						IniciarInfoVehiculo(vehiculo);
						removeNulls();
					}
				});
	}
	
	function IniciarInfoVehiculo(vehiculo){
		//Vista de Informacion
		$('#spnNumeroPlaca').text(vehiculo.numeroPlaca);
		$('#spnMarca').text(vehiculo.nombreMarca);
		$('#spnModelo').text(vehiculo.nombreModelo);
		$('#spnTipoVehiculo').text(vehiculo.nombreTipoVehiculo);
		$('#spnFabricacion').text(vehiculo.fabricacion);
		$('#spnNumeroMotor').text(vehiculo.numeroMotor);
		$('#spnColor').text(vehiculo.color);
		$('#spnNumeroEjes').text(vehiculo.numeroEjes);
		$('#spnNumeroRuedas').text(vehiculo.numeroRuedas);
		$('#spnNumeroCilindros').text(vehiculo.numeroCilindros);
		$('#spnNumeroSerie').text(vehiculo.numeroSerie);
		$('#spnNumeroPasajeros').text(vehiculo.numeroPasajeros);
		$('#spnNumeroAsientos').text(vehiculo.numeroAsientos);
		$('#spnPesoSeco').text(vehiculo.pesoSeco);
		$('#spnPesoBruto').text(vehiculo.pesoBruto);
		$('#spnLongitud').text(vehiculo.longitud);
		$('#spnAltura').text(vehiculo.altura);
		$('#spnAncho').text(vehiculo.ancho);
		$('#spnCargaUtil').text(vehiculo.cargaUtil);

		$('#spnColorGeneral').text(vehiculo.color);
		$('#spnNumeroPlacaGeneral').text(vehiculo.numeroPlaca);
		$('#spnFabricacionGeneral').text(vehiculo.fabricacion);
		$('#spnMarcaGeneral').text(vehiculo.nombreMarca);
		$('#spnModeloGeneral').text(vehiculo.nombreModelo);

		$('#spnDniCliente').text(vehiculo.dniCliente);
		$('#spnPrimerNombreCliente').text(
				vehiculo.primerNombreCliente);
		$('#spnApellidoPatCliente').text(
				vehiculo.apePaternoCliente);
		$('#spnApellidoMatCliente').text(
				vehiculo.apeMaternoCliente);
		$('#spnTelefonoCliente').text(vehiculo.telefonoCliente);
		$('#spnCelularCliente').text(vehiculo.celularCliente);
		
		//Vista de Edicion
		$('#txtCliente').val(vehiculo.idCliente);
		$('#txtVehiculo').val(vehiculo.idVehiculo);
		$('#comboMarca').val(vehiculo.idMarca);
		$('#comboModelo').val(vehiculo.idModelo);
		$('#comboTipovehiculo').val(vehiculo.idTipoVehiculo);
		$('#txtAño').val(vehiculo.fabricacion);
		$('#txtNumMotor').val(vehiculo.numeroMotor);
		$('#txtNumPlaca').val(vehiculo.numeroPlaca);
		$('#comboNumeroEjes').val(vehiculo.numeroEjes);
		$('#txtNumCilindros').val(vehiculo.numeroCilindros);
		$('#txtNumSerie').val(vehiculo.numeroSerie);
		$('#txtColor').val(vehiculo.color);
		$('#txtNumPasajeros').val(vehiculo.numeroPasajeros);
		$('#txtNumAsientos').val(vehiculo.numeroAsientos);
		$('#txtPesoSeco').val(vehiculo.pesoSeco);
		$('#txtPesoBruto').val(vehiculo.pesoBruto);
		$('#txtLongitud').val(vehiculo.longitud);
		$('#txtAltura').val(vehiculo.altura);
		$('#txtAncho').val(vehiculo.ancho);
		$('#txtCargaUtil').val(vehiculo.cargaUtil);
		$('#txtNumRuedas').val(vehiculo.numeroRuedas);
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
	
	function ExtractInformacion(){
		$('.vistaInformacion').hide();
		$('.edicionInformacion').show();
		$('#btnVerInformacion').show();
		$('#btnVerEdicion').hide();
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
					<div class="col-lg-4 col-lg-offset-8">
						<br>
						<div class="alert alert-danger" style="text-align: center;">Estado
							de vehiculo: En revisión</div>
					</div>

					<br></br>
				</div>

			</div>

			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Detalles generales del vehiculo <span id="spnIdVehiculo"><c:out
								value="${idvehiculo}" /></span>
					</div>
					<div class="panel-body">
						<div class="col-lg-6">
							<h4>Datos del vehículo</h4>
							<br>
							<p class="text-primary">Numero de placa:</p>
							<span id="spnNumeroPlacaGeneral"></span>
							<p class="text-primary">Año de Fabricacion:</p>
							<span id="spnFabricacionGeneral"></span>
							<p class="text-primary">Color:</p>
							<span id="spnColorGeneral"></span>
							<p class="text-primary">Marca:</p>
							<span id="spnMarcaGeneral"></span>
							<p class="text-primary">Modelo:</p>
							<span id="spnModeloGeneral"></span>

						</div>
						<div class="col-lg-6">
							<h4>Datos del cliente</h4>
							<br>
							<p class="text-primary">DNI:</p>
							<span id="spnDniCliente"></span>
							<p class="text-primary">Nombre:</p>
							<span id="spnPrimerNombreCliente"></span>
							<p class="text-primary">Apellido Paterno:</p>
							<span id="spnApellidoPatCliente"></span>
							<p class="text-primary">Apellido Materno:</p>
							<span id="spnApellidoMatCliente"></span>
							<p class="text-primary">Telefono:</p>
							<span id="spnTelefonoCliente"></span>
							<p class="text-primary">Celular:</p>
							<span id="spnCelularCliente"></span>
						</div>
					</div>
				</div>
			</div>


			<div class="col-lg-12">
				<div class="panel panel-default">

					<!-- /.panel-heading -->
					<div class="panel-body">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs">
							<li class="active"><a href="#revision" data-toggle="tab">Vehiculo</a></li>
							<li class=""><a href="#fallas" data-toggle="tab">Fallas</a></li>
							<li class=""><a href="#repuestos" data-toggle="tab">Repuestos</a>
							</li>
							<li class=""><a href="#archivos" data-toggle="tab">Archivos</a>
							</li>
							<li class=""><a href="#comentarios" data-toggle="tab">Comentarios</a>
							</li>
						</ul>

						<!-- Tab panes -->


						<div class="tab-content">

							<div class="tab-pane fade active in" id="revision">
								<div class="panel panel-default">
									<div class="panel-heading">
										Datos de vehículo
										<div class="pull-right">
											<div class="btn-group">
												<span id="btnVerEdicion"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="ExtractInformacion();">Editar</span> 
													<span id="btnVerInformacion"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="$('.vistaInformacion').show();$('.edicionInformacion').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();"
													style="display: none">Regresar</span>
											</div>
										</div>
									</div>

									<div class="panel-body">

										<div class="col-lg-12 vistaInformacion">
											<br>
											<div class="col-lg-4">
												<p class="text-primary">Numero de placa:</p>
												<span id="spnNumeroPlaca"></span>
												<p class="text-primary">Marca:</p>
												<span id="spnMarca"></span>
												<p class="text-primary">Modelo:</p>
												<span id="spnModelo"></span>
												<p class="text-primary">Tipo de vehiculo:</p>
												<span id="spnTipoVehiculo"></span>
												<p class="text-primary">Año de fabricacion:</p>
												<span id="spnFabricacion"></span>
												<p class="text-primary">Motor:</p>
												<span id="spnNumeroMotor"></span>
												<p class="text-primary">Color:</p>
												<span id="spnColor"></span>
											</div>
											<div class="col-lg-4">
												<p class="text-primary">Numero de ejes:</p>
												<span id="spnNumeroEjes"></span>
												<p class="text-primary">Numero de ruedas:</p>
												<span id="spnNumeroRuedas"></span>
												<p class="text-primary">Numero de cilindros:</p>
												<span id="spnNumeroCilindros"></span>
												<p class="text-primary">Numero de serie:</p>
												<span id="spnNumeroSerie"></span>
												<p class="text-primary">Numero de pasajeros:</p>
												<span id="spnNumeroPasajeros"></span>
												<p class="text-primary">Numero de asientos:</p>
												<span id="spnNumeroAsientos"></span>
												<p class="text-primary">Peso seco:</p>
												<span id="spnPesoSeco"></span>
											</div>
											<div class="col-lg-4">
												<p class="text-primary">Peso bruto:</p>
												<span id="spnPesoBruto"></span>
												<p class="text-primary">Longitud:</p>
												<span id="spnLongitud"></span>
												<p class="text-primary">Altura:</p>
												<span id="spnAltura"></span>
												<p class="text-primary">Ancho:</p>
												<span id="spnAncho"></span>
												<p class="text-primary">Carga util:</p>
												<span id="spnCargaUtil"></span>
											</div>
										</div>
										<div class="col-lg-12 edicionInformacion" style="display: none;">
										<!-- BORRAR EN CASO DE ERROR -->
										
										<form role="form" id="frmEdicionVehiculo" commandName="vehiculobean" style="width: 90%; padding-left: 10%;">
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
                                        </div>	
                                        
                                        <div class="form-group">
                                            <label>Cliente</label>
                                            <select class="form-control" id="comboCliente" name="idCliente">
                                                 <option value="">Seleccione el cliente</option>
                                            </select>
                                        </div>	-->			
                                        <div class="form-group" style="display:none">
											<label>Cliente</label> 
											<input id="txtCliente" class="form-control"
											 name="idCliente" placeholder="Cliente"></input>
											 <input id="txtVehiculo" class="form-control"
											 name="idVehiculo" placeholder="Vehiculo"></input>
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
											<select class="form-control" id="comboNumeroEjes" name="numeroEjes">
                                            <option value="">Seleccione el Nro. de ejes</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>                                            
                                            </select>
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
																
								
										<span class="btn btn-success" onclick="EditInformacionVehiculo();">Guardar</span>
										<span class="btn btn-danger" onclick="$('.vistaInformacion').show();$('.edicionInformacion').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();">
									    Cancelar</span>
							</fieldset>							
							</form>
										
										
										<!-- FIN  -->																			
										</div>
									</div>
								</div>

							</div>
							<div class="tab-pane fade" id="fallas">
									<p></p>
									<p>Dato 1:</p>
									<p>Dato 2:</p>
									<p>Dato 3:</p>
									<p>Dato 4:</p>
									<p>Continuará ...</p>
									<p>...:</p>
								</div>
								<div class="tab-pane fade" id="repuestos">
									<h4>Repuestos</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
								<div class="tab-pane fade" id="archivos">
									<h4>Archivos</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
								<div class="tab-pane fade" id="comentarios">
									<h4>Comentarios</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>


			</div>

		</div>
</body>
</html>

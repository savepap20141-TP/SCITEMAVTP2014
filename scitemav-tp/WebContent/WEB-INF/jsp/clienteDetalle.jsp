<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cliente Detalle</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
	$(document).ready(function(e) {
		var idcliente = $('#spnIdCliente').text();
		inicioConsulta(idcliente);

	});

	function EditInformacionCliente(){
		$.ajax({
	   		url: 'ajaxEditInformacionCliente',
	   		type: 'post',
	   		dataType: 'json',
	   		data: $('#frmEdicionCliente').serialize(),
	   		success: function(cliente){
	   			IniciarInfoCliente(cliente);
	 			$('.vistaInformacion').show();
	 			$('.edicionInformacion').hide();
	 			$('#btnVerInformacion').hide();
	 			$('#btnVerEdicion').show();
	   		}
	   	});
	}
	
	function inicioConsulta(idcliente) {
		$.ajax({
					url : 'getInformacionCliente-' + idcliente,
					type : 'POST',
					dataType : 'json',
					data : '',
					success : function(cliente) {
						IniciarInfoCliente(cliente);
						removeNulls();
					}
				});
	}
	
	function IniciarInfoCliente(cliente){
		//Vista de Informacion
		
		
		$('#spnNombre').text(cliente.nombre);
		$('#spnApellidoPaterno').text(cliente.apellidopaterno);
		$('#spnApellidoMaterno').text(cliente.apellidomaterno);
		$('#spnDni').text(cliente.dni);
		$('#spnSexo').text(cliente.sexo);
		$('#spnFechaNacimiento').text(cliente.fechanacimiento);
		$('#spnNombreDistrito').text(cliente.nombredistrito);
		
		$('#spnDireccion').text(cliente.direccion);
		$('#spnTelefono').text(cliente.telefono);
		$('#spnCelular').text(cliente.celular);
		$('#spnEmail').text(cliente.email);
		
		//Vista de Edicion
	    $('#txtVehiculo').val(cliente.idVehiculo);
		$('#txtRevision').val(cliente.idRevision);
		$('#txtCostoTotal').val(cliente.costoTotal);
		$('#txtFechaInicio').val(cliente.fechaInicio);
		$('#txtFechaFin').val(cliente.fechaFin);
		$('#txtProximaRevision').val(cliente.fechaProxima);
		$('#txtKilometrajeActual').val(cliente.kilometrajeActual);
		$('#txtKilometrajeProximo').val(cliente.kilometrajeProximo);
	
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
							de revisión: En cliente</div>
					</div>

					<br></br>
				</div>

			</div>

			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Detalles generales del cliente <span id="spnIdCliente"><c:out
								value="${idcliente}" /></span>
					</div>
					<div class="panel-body">
						<div class="col-lg-6">
							<h4>Datos del Cliente</h4>
							<br>
							<p class="text-primary">Nombre:</p>
							<span id="spnNombre"></span>
							<p class="text-primary">Apellido Paterno:</p>
							<span id="spnApellidoPaterno"></span>
							<p class="text-primary">Apellido Materno:</p>
							<span id="spnApellidoMaterno"></span>
							<p class="text-primary">DNI:</p>
							<span id="spnDni"></span>
							<p class="text-primary">Sexo:</p>
							<span id="spnSexo"></span>
							<p class="text-primary">Fecha Nacimiento:</p>
							<span id="spnFechaNacimiento"></span>
							<p class="text-primary">Nombre Distrito:</p>
							<span id="spnNombreDistrito"></span>

						</div>
						<div class="col-lg-6">
							<h4>Datos de referencia Cliente</h4>
							<br>
							<p class="text-primary">Direccion:</p>
							<span id="spnDireccion"></span>
							<p class="text-primary">Telefono:</p>
							<span id="spnTelefono"></span>
							<p class="text-primary">Celular:</p>
							<span id="spnCelular"></span>
							<p class="text-primary">Email:</p>
							<span id="spnEmail"></span>
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
						<li class="active"><a href="#revision" data-toggle="tab">Revisión</a></li>
						<li class=""><a href="#fallas" data-toggle="tab">Vehículo</a></li>		
						<li class=""><a href="#informacion" data-toggle="tab">informacion</a></li>					
						</ul>

						<!-- Tab panes -->


						<div class="tab-content">

							<div class="tab-pane fade active in" id="revision">
								<div class="panel panel-default">
									<div class="panel-heading">
										Datos de la revisión
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
											<p class="text-primary">Costo Total:</p>
						                 	<span id="spnCostoTotal"></span>
						                	<p class="text-primary">Fecha Inicio:</p>
											<span id="spnFechaInicio"></span>
											<p class="text-primary">Fecha Fin:</p>
											<span id="spnFechaFin"></span>
											<p class="text-primary">Fecha Próxima:</p>
											<span id="spnFechaProxima"></span>
											<p class="text-primary">Kilometraje Actual:</p>
											<span id="spnKilometrajeActual"></span>
											<p class="text-primary">Kilometraje Próximo:</p>
											<span id="spnKilometrajeProximo"></span>												
											</div>											
										</div>
										<div class="col-lg-12 edicionInformacion" style="display: none;">
										<!-- BORRAR EN CASO DE ERROR -->
										
										<form role="form" id="frmEdicionCliente" commandName="clientebean" style="width: 90%; padding-left: 10%;">
							<fieldset>						
								<div class="col-lg-6">						
									<div class="form-group" style="display: none;">
											<label> Costo Total </label> <input id="txtCostoTotal"
											class="form-control" name="costoTotal" placeholder="Costo total"></input>
										</div>
										
										<div class="form-group input-group">
											<label> Fecha de Inicio</label> <input id="txtFechaInicio"
												class="form-control" name="fechaInicio"
												placeholder="Fecha de Inicio"></input>
												<span class="input-group-btn">
												    <button class="btn btn-default fa fa-table fa-fw" type="button" style="margin-top:25px; height: 34px;" onclick="$('#txtFechaInicio').datepicker('show')"></button>
												</span>
										</div>
										
									 	<div class="form-group input-group" style="display: none;">
											<label> Fecha de Fin</label> <input id="txtFechaFin"
												class="form-control" name="fechaFin"
												placeholder="Fecha de Fin"></input>
												<span class="input-group-btn">
												    <button class="btn btn-default fa fa-table fa-fw" type="button" style="margin-top:25px; height: 34px;" onclick="$('#txtFechaFin').datepicker('show')"></button>
												</span>
										</div>
										 
										 
										<div class="form-group input-group" style="display: none;">
											<label> Próxima revisión</label> <input id="txtProximaRevision"
												class="form-control" name="fechaProxima"
												placeholder="Fecha próxima"></input>
												<span class="input-group-btn">
												    <button class="btn btn-default fa fa-table fa-fw" type="button" style="margin-top:25px; height: 34px;" onclick="$('#txtProximaRevision').datepicker('show')"></button>
												</span>
										</div>
										<div class="form-group" style="display: none;">
											<label> Kilometraje Actual </label> <input id="txtKilometrajeActual"
											class="form-control" name="kilometrajeActual" placeholder="Kilometraje actual"></input>
										</div>
										<div class="form-group" style="display: none;">
											<label> Kilometraje Próximo </label> <input id="txtKilometrajeProximo"
											class="form-control" name="kilometrajeProximo" placeholder="Kilometraje próximo"></input>
										</div>																				
																																																																				
																																					
									<!-- FINAL SEGUNDA COLUMNA -->
								</div>
																
								
										<span class="btn btn-success" onclick="EditInformacionCliente();">Guardar</span>
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
								<div class="tab-pane fade" id="informacion">
									<h4>Informacion</h4>
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
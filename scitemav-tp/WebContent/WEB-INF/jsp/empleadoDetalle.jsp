<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Revisión Detalle</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
	$(document).ready(function(e) {		
		var idempleado = $('#spnIdEmpleado').text();
		inicioConsulta(idempleado);
		
		
	});

	function EditInformacionEmpleado(){
		$.ajax({
	   		url: 'ajaxEditInformacionEmpleado',
	   		type: 'post',
	   		dataType: 'json',
	   		data: $('#frmEdicionEmpleado').serialize(),
	   		success: function(empleado){
	   			IniciarInfoEmpleado(empleado);
	 			$('.vistaInformacion').show();
	 			$('.edicionInformacion').hide();
	 			$('#btnVerInformacion').hide();
	 			$('#btnVerEdicion').show();
	   		}
	   	});
	}
	function inicioConsulta(idempleado) {
		$.ajax({
					url : 'getInformacionEmpleado-' + idempleado,
					type : 'POST',
					dataType : 'json',
					data : '',
					success : function(empleado) {
						IniciarInfoRevision(empleado);
						removeNulls();
					}
				});
	}
	
	function IniciarInfoEmpleado(empleado){
		//Vista de Informacion
			
		
		$('#spnNombre').text(empleado.nombre);
		$('#spnApellidoPaterno').text(empleado.apellidoPaterno);
		$('#spnApellidoMaterno').text(empleado.apellidoMaterno);
		$('#spnDni').text(empleado.dni);
		$('#spnTelefono').text(empleado.telefono);
		$('#spnCelular').text(empleado.celular);
		
		$('#spnSexo').text(empleado.sexo);
		$('#spnEmail').text(empleado.email);
		$('#spnNombreDistrito').text(empleado.nombreDistrito);
		$('#spnDireccion').text(empleado.direccion);
		$('#spnFechaNacimiento').text(empleado.fechaNacimiento);
		$('#spnCargo').text(empleado.nombreCargo);
		$('#spnNombreEspecialidad').text(empleado.nombreEspecialidad);
		
		//Vista de Edicion
	    $('#txtVehiculo').val(empleado.idVehiculo);
		$('#txtRevision').val(empleado.idRevision);
		$('#txtCostoTotal').val(empleado.costoTotal);
		$('#txtFechaInicio').val(revision.fechaInicio);
		$('#txtFechaFin').val(revision.fechaFin);
		$('#txtProximaRevision').val(revision.fechaProxima);
		$('#txtKilometrajeActual').val(revision.kilometrajeActual);
		$('#txtKilometrajeProximo').val(revision.kilometrajeProximo);

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
						
					</div>

					<br></br>
				</div>

			</div>

			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Detalles generales del empleado <span id="spnIdEmpleado"><c:out
								value="${idempleado}" /></span>
					</div>
					<div class="panel-body">
						<div class="col-lg-6">
							<h4>Datos del empleado</h4>
							<br>
							<p class="text-primary">Nombre:</p>
							<span id="spnNombre"></span>
							<p class="text-primary">Apellido Paterno:</p>
							<span id="spnApellidoPaterno"></span>
							<p class="text-primary">Apellido Materno:</p>
							<span id="spnApellidoMaterno"></span>
							<p class="text-primary">DNI:</p>
							<span id="spnDni"></span>
							<p class="text-primary">Teléfono</p>
							<span id="spnTelefono"></span>
							<p class="text-primary">Celular:</p>
							<span id="spnCelular"></span>
							<p class="text-primary">Sexo:</p>
							<span id="spnSexo"></span>
							<p class="text-primary">Email:</p>
							<span id="spnEmail"></span>

						</div>
						<div class="col-lg-6">
							
							<p class="text-primary">Distrito:</p>
							<span id="spnNombreDistrito"></span>
							<p class="text-primary">Dirección:</p>
							<span id="spnDireccion"></span>
							<p class="text-primary">Fecha de nacimiento:</p>
							<span id="spnFechaNacimiento"></span>
							<p class="text-primary">Cargo:</p>
							<span id="spnCargo"></span>
							<p class="text-primary">Especialidad:</p>
							<span id="spnNombreEspecialidad"></span>

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
										Datos del empleado
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
																	<div class="col-lg-6">
							<h4>Datos del empleado</h4>
							<br>
							<p class="text-primary">Nombre:</p>
							<span id="spnNombre"></span>
							<p class="text-primary">Apellido Paterno:</p>
							<span id="spnApellidoPaterno"></span>
							<p class="text-primary">Apellido Materno:</p>
							<span id="spnApellidoMaterno"></span>
							<p class="text-primary">DNI:</p>
							<span id="spnDni"></span>
							<p class="text-primary">Teléfono</p>
							<span id="spnTelefono"></span>
							<p class="text-primary">Celular:</p>
							<span id="spnCelular"></span>
							<p class="text-primary">Sexo:</p>
							<span id="spnSexo"></span>
							<p class="text-primary">Email:</p>
							<span id="spnEmail"></span>

						</div>
						<div class="col-lg-6">
							
							<p class="text-primary">Distrito:</p>
							<span id="spnNombreDistrito"></span>
							<p class="text-primary">Dirección:</p>
							<span id="spnDireccion"></span>
							<p class="text-primary">Fecha de nacimiento:</p>
							<span id="spnFechaNacimiento"></span>
							<p class="text-primary">Cargo:</p>
							<span id="spnCargo"></span>
							<p class="text-primary">Especialidad:</p>
							<span id="spnNombreEspecialidad"></span>

						</div>
					</div>								
										</div>
										<div class="col-lg-12 edicionInformacion" style="display: none;">
										<!-- BORRAR EN CASO DE ERROR -->
										
										<form role="form" id="frmEdicionEmpleado" commandName="bean" style="width: 90%; padding-left: 10%;">
							<fieldset>						
								<div class="col-lg-6">	
								
								    <div class="form-group">
											<label> DNI</label> <input id="txtDNI"
												class="form-control" name="dni" placeholder="DNI"></input>
										</div>
										<div class="form-group">
											<label> Nombre</label> <input id="txtNombre"
												class="form-control" name="nombre" placeholder="Nombre"></input>
										</div>
										<div class="form-group">
											<label> Apellido Paterno</label> <input id="txtApellPaterno"
												class="form-control" name="apellidoPaterno"
												placeholder="Apellido Paterno"></input>
										</div>
										<div class="form-group">
											<label> Apellido Materno</label> <input id="txtApellMaterno"
												class="form-control" name="apellidoMaterno"
												placeholder="Apellido Materno"></input>
										</div>
										<div class="form-group">
											<label> Telefono</label> <input id="txtTelefono"
												class="form-control" name="telefono" placeholder="Telefono"></input>
										</div>
										<div class="form-group">
											<label> Celular</label> <input id="txtCelular"
												class="form-control" name="celular" placeholder="Celular"></input>
										</div>
										
										<div class="col-lg-6">
									<!-- SEGUNDA COLUMNA -->
										<div class="form-group">
											<label> Sexo</label>
												<select class="form-control" id="txtSexo" name="sexo">
												<option value="">Seleccione su Sexo</option>
												<option value="M">Masculino</option>
												<option value="F">Femenino</option>
											</select>
										</div>		
										
										<div class="form-group">
											<label> Distrito</label> 										
											<select class="form-control" id="comboDistrito" name="idDistrito">
												<option value="">Seleccione su Distrito</option>
											</select>
										</div>
										
										<div class="form-group">
											<label> Dirección</label> <input id="txtDireccion"
												class="form-control" name="direccion"
												placeholder="Dirección"></input>
										</div>
										
										<div class="form-group input-group">
											<label> Fecha de Nacimiento</label> <input id="txtFechaNacimiento"
												class="form-control" name="fechaNacimiento"
												placeholder="Fecha de Nacimiento"></input>
												<span class="input-group-btn">
												    <button class="btn btn-default fa fa-table fa-fw" type="button" style="margin-top:25px; height: 34px;" onclick="$('#txtFechaNacimiento').datepicker('show')"></button>
												</span>
										</div>
										<div class="form-group">
											<label> Cargo</label> 										
											<select class="form-control" id="comboCargo" name="idCargo">												
											</select>
										</div>
										<div class="form-group">
											<label> Especialidad</label> 										
											<select class="form-control" id="comboEspecialidad" name="idEspecialidad">												
											</select>
										</div>
										<div class="form-group">
											<label> Email</label>
											<div class="form-group input-group">
												<span class="input-group-addon">@</span> <input
													id="txtEmail" class="form-control" name="email"
													placeholder="Email"></input>
											</div>
										</div> 
																																					
									<!-- FINAL SEGUNDA COLUMNA -->
								</div>																									
																																																																				
																																					
									<!-- FINAL SEGUNDA COLUMNA -->
									<span class="btn btn-success" onclick="EditInformacionRevision();">Guardar</span>
										<span class="btn btn-danger" onclick="$('.vistaInformacion').show();$('.edicionInformacion').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();">
									    Cancelar</span>
								</div>
																
								
										
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

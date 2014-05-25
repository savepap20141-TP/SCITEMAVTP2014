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
		listarDistritos();
		var idcliente = $('#spnIdCliente').text();
		inicioConsulta(idcliente);
		var nFechaNacimiento = 'txtFechaNacimiento';
		cargarFechaNac(nFechaNacimiento);
		
		

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
		$('#spnApellidoPaterno').text(cliente.apellidoPaterno);
		$('#spnApellidoMaterno').text(cliente.apellidoMaterno);
		$('#spnDni').text(cliente.dni);
		$('#spnSexo').text(cliente.sexo);
		$('#spnFechaNacimiento').text(cliente.fechaNacimiento);
		$('#spnNombreDistrito').text(cliente.nombreDistrito);
		
		$('#spnDireccion').text(cliente.direccion);
		$('#spnTelefono').text(cliente.telefono);
		$('#spnCelular').text(cliente.celular);
		$('#spnEmail').text(cliente.email);
		
		//Vista de Edicion
		$('#txtPassword').val(cliente.password);
		$('#txtEstado').val(cliente.estado);
		$('#txtCliente').val(cliente.idCliente);
		$('#txtPersona').val(cliente.idPersona);
		$('#txtNombre').val(cliente.nombre);
		$('#txtApellidoPaterno').val(cliente.apellidoPaterno);
		$('#txtApellidoMaterno').val(cliente.apellidoMaterno);
		$('#txtDni').val(cliente.dni);
		$('#txtSexo').val(cliente.sexo);
		$('#txtFechaNacimiento').val(cliente.fechaNacimiento);
		$('#comboDistrito').val(cliente.idDistrito);
		
		$('#txtDireccion').val(cliente.direccion);
		$('#txtTelefono').val(cliente.telefono);
		$('#txtCelular').val(cliente.celular);
		$('#txtEmail').val(cliente.email);
	
	}	
	
	function ExtractInformacion(){
		$('.vistaInformacion').hide();
		$('.edicionInformacion').show();
		$('#btnVerInformacion').show();
		$('#btnVerEdicion').hide();
	}
	
	function listarDistritos(){
		
		$.ajax({
	 		url: 'getDistritos',
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(distritos){
	 			$('#comboDistrito').empty();
	 			$('#comboDistrito').append('<option value="">Seleccione su distrito</option>');
	 			$.each(distritos, function(i, distrito){
	 				$('#comboDistrito').append('<option value="'+distrito.idDistrito+'">'+distrito.nombre+'</option>');				
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
					<div class="col-lg-4 col-lg-offset-8">
						<br>
						<div class="alert alert-danger" style="text-align: center;">Estado
							de revisi�n: En cliente</div>
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
						<li class="active"><a href="#revision" data-toggle="tab">Cliente</a></li>
						<li class=""><a href="#fallas" data-toggle="tab">Veh�culo</a></li>		
						<li class=""><a href="#informacion" data-toggle="tab">informacion</a></li>					
						</ul>

						<!-- Tab panes -->


						<div class="tab-content">

							<div class="tab-pane fade active in" id="revision">
								<div class="panel panel-default">
									<div class="panel-heading">
										Datos del cliente
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
										</div>
										<div class="col-lg-12 edicionInformacion" style="display: none;">
										<!-- BORRAR EN CASO DE ERROR -->
										
										<form role="form" id="frmEdicionCliente" commandName="clientebean" style="width: 90%; padding-left: 10%;">
							<fieldset>						
								<div class="col-lg-6">	
								
													
									<!-- PRIMERA COLUMNA -->
									<div class="form-group" style="display:none">
											<label>Cliente</label> 
											<input id="txtCliente" class="form-control"
											 name="idCliente" placeholder="Cliente"></input>
											 <input id="txtPersona" class="form-control"
											 name="idPersona" placeholder="Persona"></input>
											 <input id="txtEstado" class="form-control"
											 name="estado" placeholder="Estado"></input>
											 <input id="txtPassword" class="form-control"
											 name="password" placeholder="Password"></input>
										</div>
										<div class="form-group">
											<label> DNI</label> <input id="txtDni"
												class="form-control" name="dni" placeholder="DNI"></input>
										</div>
										<div class="form-group">
											<label> Nombre</label> <input id="txtNombre"
												class="form-control" name="nombre" placeholder="Nombre"></input>
										</div>
										<div class="form-group">
											<label> Apellido Paterno</label> <input id="txtApellidoPaterno"
												class="form-control" name="apellidoPaterno"
												placeholder="Apellido Paterno"></input>
										</div>
										<div class="form-group">
											<label> Apellido Materno</label> <input id="txtApellidoMaterno"
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
										
									<!-- FINAL PRIMERA COLUMNA -->								
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
											<label> Direcci�n</label> <input id="txtDireccion"
												class="form-control" name="direccion"
												placeholder="Direcci�n"></input>
										</div>
										<div class="form-group">
											<label> Distrito</label> 										
											<select class="form-control" id="comboDistrito" name="idDistrito">
											</select>
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
											<label> Email</label>
											<div class="form-group input-group">
												<span class="input-group-addon">@</span> <input
													id="txtEmail" class="form-control" name="email"
													placeholder="Email"></input>
											</div>
										</div> 
																																																											
																																					
									<!-- FINAL SEGUNDA COLUMNA -->
			                            <span class="btn btn-success" onclick="EditInformacionCliente();">Guardar</span>
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
									<p>Continuar� ...</p>
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
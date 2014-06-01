<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Empleado Detalle</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
$(document).ready(function(e){
	var nfechaNac = 'txtFechaNacimiento';
	cargarFechaNac(nfechaNac);
	listarDistritos();
	listarCargos();
	listarEspecialidades();
});
</script>
<script>
$(document).ready(function(e){
	
	
	$('#frmEdicionEmpleado').validate({
		rules:{
			dni:{
				required:true,
				number:true,				
				maxlength:8,
				minlength:8
			},
			nombre:{
				required: true,
				},
			apellidoPaterno:{
				required: true,
				},
			apellidoMaterno:{
				required: true,
				},
			telefono:{
				required:true,
				number:true,
				maxlength:9,
				minlength:7
				
			},
			celular:{
				required:true,
				number:true,
				maxlength:9,
				minlength:9
				
			},
			direccion:{
				required: true,
				},
			fechaNacimiento:{				
				required: true,
			      dpDate: true,
			      //dpComparedate:'notbefore 1996-01-01'
			},
			email:{
				required: true,
			    email: true			
			},
			sexo:{
				required: true,
			},
			idDistrito:{
				required: true,
			},
			idCargo:{
				required: true,
			},
			idEspecialidad:{
				required: true,
			}
			
		},
		messages:{
			dni:{
				required:"Debe ingresar un DNI",
				number:"Sólo números en el DNI",
				minlength:"Tiene que tener 8 dígitos el DNI",
				maxlength:"Tiene que tener 8 dígitos el DNI"
			},
			nombre:{
				required: "Se debe ingresar un nombre de empleado",
			},
			apellidoPaterno:{
				required: "Se debe ingresar apellido paterno de empleado",
			},
			apellidoMaterno:{
				required: "Se debe ingresar apellido materno de empleado",
			},
			telefono:{
				required:"Debe ingresar un teléfono",
				number:"Sólo números en el teléfono",
				minlength:"Tiene que tener 7 dígitos en el teléfono",
				maxlength:"Tiene que tener 9 dígitos en el teléfono"
			},
			celular:{
				required:"Debe ingresar un celular",
				number:"Sólo números en el celular",
				minlength:"Tiene que tener 9 dígitos en el celular",
				maxlength:"Tiene que tener 9 dígitos en el celular"
				
			},
			direccion:{
				required: "Se debe ingresar dirección de empleado",
			},
			fechaNacimiento:{
				required:"Se debe ingresar una Fecha",
				dpDate:"Solo Fechas",	
				dpComparedate:"Debe ser mayor igual de 18 años"
			},
			email:{
				required:"Debe ingresar un Email",
			    email:"Se necesita ingresar Email"	
			},
			sexo:{
				required: "Seleccione un Tipo Sexo",
			},
			idDistrito:{
				required: "Seleccione un Distrito",
			},
			idCargo:{
				required: "Seleccione un Cargo",
			},
			idEspecialidad:{
				required: "Seleccione una Especialidad",
			}
			
		},			
		submitHandler: function(form){
			$.ajax({
		   		url: 'ajaxEditInformacionEmpleado',
		   		type: 'post',
		   		dataType: 'json',
		   		data: $('#frmEdicionEmpleado').serialize(),
		   		success: function(cliente){
		   			IniciarInfoCliente(cliente);
		 			$('.vistaInformacion').show();
		 			$('.edicionInformacion').hide();
		 			$('#btnVerInformacion').hide();
		 			$('#btnVerEdicion').show();
		   		}
		   	});
		}		
	});
	
		listarCargos();
		listarEspecialidades();
		listarDistritos();
		var idempleado = $('#spnIdEmpleado').text();
		inicioConsulta(idempleado);
		var nFechaNacimiento = 'txtFechaNacimiento';
		cargarFechaNac(nFechaNacimiento);
		
		inicioConsultaVehiculos(idempleado);
		
		
		
	});

	function EditInformacionEmpleado(){
		$('#frmEdicionEmpleado').submit();
	}

	function inicioConsulta(idempleado) {
		$.ajax({
					url : 'getInformacionEmpleado-' + idempleado,
					type : 'POST',
					dataType : 'json',
					data : '',
					success : function(empleado) {
						IniciarInfoEmpleado(empleado);
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
		
		if(empleado.sexo=='M'){
			$('#spnSexo').text("MASCULINO");
		}else{
			$('#spnSexo').text("FEMENINO");
		}
		$('#spnEmail').text(empleado.email);
		$('#spnNombreDistrito').text(empleado.nombreDistrito);
		$('#spnDireccion').text(empleado.direccion);
		$('#spnFechaNacimiento').text(empleado.fechaNacimiento);
		$('#spnCargo').text(empleado.nombreCargo);
		$('#spnNombreEspecialidad').text(empleado.nombreEspecialidad);
		
		//informacion del primer tab
		$('#spnNombreT').text(empleado.nombre);
		$('#spnApellidoPaternoT').text(empleado.apellidoPaterno);
		$('#spnApellidoMaternoT').text(empleado.apellidoMaterno);
		$('#spnDniT').text(empleado.dni);
		$('#spnTelefonoT').text(empleado.telefono);
		$('#spnCelularT').text(empleado.celular);
		
		if(empleado.sexo=='M'){
			$('#spnSexoT').text("MASCULINO");
		}else{
			$('#spnSexoT').text("FEMENINO");
		}
		$('#spnEmailT').text(empleado.email);
		$('#spnNombreDistritoT').text(empleado.nombreDistrito);
		$('#spnDireccionT').text(empleado.direccion);
		$('#spnFechaNacimientoT').text(empleado.fechaNacimiento);
		$('#spnCargoT').text(empleado.nombreCargo);
		$('#spnNombreEspecialidadT').text(empleado.nombreEspecialidad);
		
		
		//Vista de Edicion
		$('#txtPersona').val(empleado.idPersona);
		$('#txtPassword').val(empleado.password);
		$('#txtEstado').val(empleado.estado);
		$('#txtEmpleado').val(empleado.idEmpleado);
	    $('#txtDni').val(empleado.dni);
		$('#txtNombre').val(empleado.nombre);
		$('#txtApellidoPaterno').val(empleado.apellidoPaterno);
		$('#txtApellidoMaterno').val(empleado.apellidoMaterno);
		$('#txtTelefono').val(empleado.telefono);
		$('#txtCelular').val(empleado.celular);
		$('#txtSexo').val(empleado.sexo);
		$('#comboDistrito').val(empleado.idDistrito);
		$('#txtDireccion').val(empleado.direccion);
		$('#txtFechaNacimiento').val(empleado.fechaNacimiento);		
		$('#comboCargo').val(empleado.idCargo);
		$('#comboEspecialidad').val(empleado.idEspecialidad);
		$('#txtEmail').val(empleado.email);

	}	
	
	function ExtractInformacion(){
		$('.vistaInformacion').hide();
		$('.edicionInformacion').show();
		$('#btnVerInformacion').show();
		$('#btnVerEdicion').hide();
	}
	
	function listarEspecialidades(){	
		$.ajax({
	 		url: 'getEspecialidades',
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(especialidades){
	 			$('#comboEspecialidad').empty();
	 			$('#comboEspecialidad').append('<option value="">Seleccione su Especialidad</option>');
	 			$.each(especialidades, function(i, espe){
	 				$('#comboEspecialidad').append('<option value="'+espe.idEspecialidad+'">'+espe.descripcion+'</option>');				
				});
	 		}
	 	});	
		
	}

	function listarCargos(){	
		$.ajax({
	 		url: 'getCargos',
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(cargos){
	 			$('#comboCargo').empty();
	 			$('#comboCargo').append('<option value="">Seleccione su Cargo</option>');
	 			$.each(cargos, function(i, cargo){
	 				$('#comboCargo').append('<option value="'+cargo.idCargo+'">'+cargo.descripcion+'</option>');				
				});
	 		}
	 	});	
		
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
							<h4>Datos de referencia Empleado</h4>
							<br>
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
							<li class="active"><a href="#revision" data-toggle="tab">Empleado</a></li>
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
												<span id="spnNombreT"></span>
												<p class="text-primary">Apellido Paterno:</p>
												<span id="spnApellidoPaternoT"></span>
												<p class="text-primary">Apellido Materno:</p>
												<span id="spnApellidoMaternoT"></span>
												<p class="text-primary">DNI:</p>
												<span id="spnDniT"></span>
												<p class="text-primary">Teléfono</p>
												<span id="spnTelefonoT"></span>
												<p class="text-primary">Celular:</p>
												<span id="spnCelularT"></span>
												<p class="text-primary">Sexo:</p>
												<span id="spnSexoT"></span>
												<p class="text-primary">Email:</p>
												<span id="spnEmailT"></span>
					
											</div>
											<div class="col-lg-6">
												<h4>Datos de referencia Empleado</h4>
												<br>
												<p class="text-primary">Distrito:</p>
												<span id="spnNombreDistritoT"></span>
												<p class="text-primary">Dirección:</p>
												<span id="spnDireccionT"></span>
												<p class="text-primary">Fecha de nacimiento:</p>
												<span id="spnFechaNacimientoT"></span>
												<p class="text-primary">Cargo:</p>
												<span id="spnCargoT"></span>
												<p class="text-primary">Especialidad:</p>
												<span id="spnNombreEspecialidadT"></span>
					
											</div>
											
										</div>
										<div class="col-lg-12 edicionInformacion" style="display: none;">
										<!-- BORRAR EN CASO DE ERROR -->
										
										<form role="form" id="frmEdicionEmpleado" commandName="empleadobean" style="width: 90%; padding-left: 10%;">
							<fieldset>						
								<div class="col-lg-6">						
									<!-- PRIMERA COLUMNA -->
									<div class="form-group" style="display:none">
											<label>Empleado</label> 
											<input id="txtEmpleado" class="form-control"
											 name="idEmpleado" placeholder="Empleado"></input>
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
																	
									<span class="btn btn-success" onclick="EditInformacionEmpleado();">Guardar</span>
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

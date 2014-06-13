<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Pagina Principal</title>

<jsp:include page="componentes/head.jsp" />

</head>
<script>
	$(document).ready(function(e) {
		InitInformacionPerfil();

		$('#frmPersona').validate({
			rules : {
				nombre : {
					required : true,
				},
				apellidoPaterno : {
					required : true,
				},
				apellidoMaterno : {
					required : true,
				},
				telefono : {
					required : true,
					number : true,
					maxlength : 9,
					minlength : 7
				},
				celular:{
					required:true,
					number:true,
					maxlength:9,
					minlength:9	
				},
				dni:{
					required:true,
					number:true,				
					maxlength:8,
					minlength:8
				},
				fechaNacimiento:{				
					required: true,
				      dpDate: true,
				      //dpComparedate:'notbefore 1996-01-01'
				},
				direccion:{
					required: true,
				},
				email : {
					required : true,
					email : true
				}
			},
			messages : {
				telefono : {
					required : "Debe ingresar un teléfono",
					number : "Sólo números en el teléfono",
					minlength : "Tiene que tener 7 dígitos en el teléfono",
					maxlength : "Tiene que tener 9 dígitos en el teléfono"
				},
				email : {
					required : "Debe ingresar un Email",
					email : "Se necesita ingresar Email"
				},
				celular:{
					required:"Debe ingresar un celular",
					number:"Sólo números en el celular",
					minlength:"Tiene que tener 9 dígitos en el celular",
					maxlength:"Tiene que tener 9 dígitos en el celular"
					
				},
				dni:{
					required:"Debe ingresar un DNI",
					number:"Sólo números en el DNI",
					minlength:"Tiene que tener 8 dígitos el DNI",
					maxlength:"Tiene que tener 8 dígitos el DNI"
				},
				direccion:{
					required: "Se debe ingresar una direccion",
				},
				fechaNacimiento:{
					required:"Se debe ingresar una Fecha",
					dpDate:"Solo Fechas",	
					dpComparedate:"Debe ser mayor igual de 18 años"
				},
				nombre : {
					required : "Se debe ingresar un nombre",
				},
				apellidoPaterno : {
					required : "Se debe ingresar un apellido parterno",
				},
				apellidoMaterno : {
					required : "Se debe ingresar un apellido materno",
				}
			},
		});
	});
</script>

<script>
	/* Script para inicializar para Pagina con la informacion*/
	// Ajax para Traer Informacion de Persona
	function InitInformacionPerfil() {
		$.ajax({
			url : 'getInformacionPerfil',
			type : 'post',
			dataType : 'json',
			data : '',
			success : function(personabean) {
				$("#enbNombre").val(personabean.nombre);
				$("#enbApellPaterno").val(personabean.apellidoPaterno);
				$("#enbApellMaterno").val(personabean.apellidoMaterno);
				$("#enbTelefono").val(personabean.telefono);
				$("#enbEmail").val(personabean.email);
				
				$("#enbFechaNacimiento").val(personabean.fechaNacimiento);
				$("#enbDireccion").val(personabean.direccion);
				$("#enbCelular").val(personabean.celular);
				$("#enbDni").val(personabean.dni);
				
				
				
			}
		});
	}
	// Ajax para Editar Persona
	function ExtractInformacion() {
		$('.vistaPerfil').hide();
		$('.edicionPerfil').show();
		$('#btnVerInformacion').show();
		$('#btnVerEdicion').hide();
		//
		$("#txtNombre").val($("#enbNombre").val());
		$("#txtApellPaterno").val($("#enbApellPaterno").val());
		$("#txtApellMaterno").val($("#enbApellMaterno").val());
		$("#txtTelefono").val($("#enbTelefono").val());
		$("#txtEmail").val($("#enbEmail").val());
		
		$("#txtFechaNacimiento").val($("#enbFechaNacimiento").val());
		$("#txtDireccion").val($("#enbDireccion").val());
		$("#txtCelular").val($("#enbCelular").val());
		$("#txtDni").val($("#enbDni").val());
	}
	function EditInformacionPerfil() {
		$.ajax({
			url : 'ajaxEditInformacionPerfil',
			type : 'post',
			dataType : 'json',
			data : $('#frmPersona').serialize(),
			success : function(personabean) {
				$("#enbNombre").val(personabean.nombre);
				$("#enbApellPaterno").val(personabean.apellidoPaterno);
				$("#enbApellMaterno").val(personabean.apellidoMaterno);
				$("#enbTelefono").val(personabean.telefono);
				$("#enbEmail").val(personabean.email);
				
				$("#enbFechaNacimiento").val(personabean.fechaNacimiento);
				$("#enbDireccion").val(personabean.direccion);
				$("#enbCelular").val(personabean.celular);
				$("#enbDni").val(personabean.dni);
				
				$('.vistaPerfil').show();
				$('.edicionPerfil').hide();
				$('#btnVerInformacion').hide();
				$('#btnVerEdicion').show();
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
					<h1 class="page-header">Mi Perfil</h1>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							Mis Datos Personales
							<div class="pull-right">
								<div class="btn-group">
									<span id="btnVerEdicion"
										class="btn btn-default btn-xs dropdown-toggle"
										onclick="ExtractInformacion();">Editar</span> <span
										id="btnVerInformacion"
										class="btn btn-default btn-xs dropdown-toggle"
										onclick="$('.vistaPerfil').show();$('.edicionPerfil').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();"
										style="display: none">Regresar</span>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row vistaPerfil">
								<div class="col-lg-6">
									<div class="form-group">
										<label> Nombre</label> <input id="enbNombre"
											class="form-control" type="text" disabled=""
											placeholder="Nombre"></input>
									</div>
									<div class="form-group">
										<label> Apellido Paterno</label> <input id="enbApellPaterno"
											class="form-control" type="text" disabled=""
											placeholder="Apellido Paterno"></input>
									</div>
									<div class="form-group">
										<label> Apellido Materno</label> <input id="enbApellMaterno"
											class="form-control" type="text" disabled=""
											placeholder="Apellido Materno"></input>
									</div>
									<div class="form-group">
										<label> Telefono</label> <input id="enbTelefono"
											class="form-control" type="text" disabled=""
											placeholder="Telefono"></input>
									</div>
									<div class="form-group">
										<label> Email</label>
										<div class="form-group input-group">
											<span class="input-group-addon">@</span> <input id="enbEmail"
												class="form-control" type="text" disabled=""
												placeholder="Email"></input>
										</div>
									</div>

									<div class="form-group input-group">
										<label> Fecha de Nacimiento</label> 
										<input
											id="enbFechaNacimiento" disabled="" class="form-control"
											name="fechaNacimiento" placeholder="Fecha de Nacimiento"></input>
										<span class="input-group-btn">
											<button disabled="" class="btn btn-default fa fa-table fa-fw"
												type="button" style="margin-top: 25px; height: 34px;"
												onclick="$('#txtFechaNacimiento').datepicker('show')"></button>
										</span>
									</div>

									<div class="form-group">
										<label> Dirección</label> <input id="enbDireccion" disabled=""
											class="form-control" name="direccion" placeholder="Dirección"></input>
									</div>

									<div class="form-group">
										<label> Celular</label> <input id="enbCelular" disabled=""
											class="form-control" name="celular" placeholder="Celular"></input>
									</div>
									
																			<div class="form-group">
											<label> DNI</label> <input id="enbDni"  disabled=""
												class="form-control" name="dni" placeholder="DNI" onchange="validaDNI();"></input>
												<label class="error" id="ValidtxtDNI" style="display:none"></label>
										</div>
								</div>
							</div>
							
							<div class="row edicionPerfil" style="display: none">
								<div class="col-lg-6">
									<form id="frmPersona" role="form" commandName="persona">
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
											<label> Email</label>
											<div class="form-group input-group">
												<span class="input-group-addon">@</span> <input
													id="txtEmail" class="form-control" name="email"
													placeholder="Email"></input>
											</div>
										</div>
										
																			<div class="form-group input-group">
										<label> Fecha de Nacimiento</label> 
										<input
											id="txtFechaNacimiento" class="form-control"
											name="fechaNacimiento" placeholder="Fecha de Nacimiento"></input>
										<span class="input-group-btn">
											<button class="btn btn-default fa fa-table fa-fw"
												type="button" style="margin-top: 25px; height: 34px;"
												onclick="$('#txtFechaNacimiento').datepicker('show')"></button>
										</span>
									</div>

									<div class="form-group">
										<label> Dirección</label> <input id="txtDireccion"
											class="form-control" name="direccion" placeholder="Dirección"></input>
									</div>

									<div class="form-group">
										<label> Celular</label> <input id="txtCelular"
											class="form-control" name="celular" placeholder="Celular"></input>
									</div>
									
																			<div class="form-group">
											<label> DNI</label> <input id="txtDni"
												class="form-control" name="dni" placeholder="DNI" onchange=""></input>
												<label class="error" id="ValidtxtDNI" style="display:none"></label>
										</div>
										
										<span class="btn btn-success"
											onclick="EditInformacionPerfil();">Guardar</span> <span
											class="btn btn-danger"
											onclick="$('.vistaPerfil').show();$('.edicionPerfil').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();">Cancelar</span>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- /#wrapper -->



</body>

</html>

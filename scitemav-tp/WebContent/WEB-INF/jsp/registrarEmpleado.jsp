<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar Empleado</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
$(document).ready(function(e){
	var nfechaNac = 'txtFechaNacimiento';
	cargarFecha(nfechaNac);
	listarDistritos();
	listarCargos();
	listarEspecialidades();
});
</script>
<script>
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
 			$('#comboDistrito').append('<option value="">Seleccione su Distrito</option>');
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
					<br></br>
				</div>
				
			</div>
			
			<!-- FORM -->
			<div class="row">
			
			<div class="col-lg-12" style="width:90%;">
				<div class="panel panel-default">
					<div class="panel-heading">
					<i class="fa fa-bar-chart-o fa-fw"></i>Registro de nuevo Empleado
					</div>
					
					<div class="panel-body">
						<div class="row">
							<form role="form" id="frmRegistroEmpleado" action="registroEmpleado"
									method="post" commandName="trabajadorBean" style="width: 90%; padding-left: 10%;">
							<fieldset>						
								<div class="col-lg-6">						
									<!-- PRIMERA COLUMNA -->
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
											<label> Direcci�n</label> <input id="txtDireccion"
												class="form-control" name="direccion"
												placeholder="Direcci�n"></input>
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
																
								
										<input class="btn btn-lg btn-success btn-block" 
										type="submit" value="Registrar Cliente" style="width: 60%; margin-left: 20%; margin-top: 10%;"/>
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
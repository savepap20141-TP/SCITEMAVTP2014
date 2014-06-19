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
							<li class="active"><a href="#empleado" data-toggle="tab">INFORMACION</a></li>
							<li class=""><a href="#vehiculo" data-toggle="tab">VEHICULO</a></li>
							<li class=""><a href="#revision" data-toggle="tab">REVISIONES</a></li>
							<li class=""><a href="#archivos" data-toggle="tab">ARCHIVOS</a></li>
							<li class=""><a href="#comentarios" data-toggle="tab">COMENTARIOS</a>
							</li>
						</ul>

						<!-- Tab panes -->


						<div class="tab-content">
							<jsp:include page="empleadoDetalle/empleadoInformacion.jsp"/>
							<jsp:include page="empleadoDetalle/empleadoVehiculo.jsp"/>
							<jsp:include page="empleadoDetalle/empleadoRevision.jsp"/>
							<jsp:include page="componentes/Archivos.jsp"/>
							<jsp:include page="componentes/Comentarios.jsp"/>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>


			</div>

		</div>
	</div>
</body>
</html>

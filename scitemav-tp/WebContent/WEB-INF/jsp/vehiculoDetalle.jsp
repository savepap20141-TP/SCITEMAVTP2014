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

<script type="text/javascript">

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
					<div id="imagenMarca" style="float:right;"></div>
					<div id="divReporte"></div>								
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
							<li class="active"><a href="#vehiculo" data-toggle="tab">Información</a></li>
							<li class=""><a href="#revisiones" data-toggle="tab">Revisiones</a></li>
							<li class=""><a href="#repuestos" data-toggle="tab">Repuestos</a></li>
							<li class=""><a href="#archivos" data-toggle="tab">Archivos</a></li>
							<li class=""><a href="#comentarios" data-toggle="tab">Comentarios</a></li>
						</ul>

						<!-- Tab panes -->


						<div class="tab-content">
							<jsp:include page="Vehiculo/vehiculoInformacion.jsp"/>
							<jsp:include page="Vehiculo/vehiculoRevisiones.jsp"/>
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
		</div>
</body>
</html>

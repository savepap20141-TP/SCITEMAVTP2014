<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Revisión Detalle</title>
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
						<div class="alert alert-danger" style="text-align: center;">Estado
							de la revisión: Incompleta</div>
					</div>

					<br></br>
				</div>

			</div>

			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Detalles generales</div>
					<div class="panel-body">
						<div class="col-lg-6">
							<h4>Datos del vehículo</h4>
							<br>
							<p class="text-primary">Numero de placa:</p>
							<p class="text-primary">Año de Fabricacion:</p>
							<p class="text-primary">Color:</p>
							<p class="text-primary">Numero de asientos:</p>
							<p class="text-primary">Marca:</p>
							<p class="text-primary">Modelo:</p>

						</div>
						<div class="col-lg-6">
							<h4>Datos del cliente</h4>
							<br>
							<p class="text-primary">DNI:</p>
							<p class="text-primary">Nombre:</p>
							<p class="text-primary">Apellido Paterno:</p>
							<p class="text-primary">Apellido Materno:</p>
							<p class="text-primary">Telefono:</p>
							<p class="text-primary">Celular:</p>
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
								<div class="col-lg-12">
									<br>
									<h4>Datos de la revisión</h4>
									<br>
									<p class="text-primary">Fecha de inicio:</p>
									<p class="text-primary">Fecha de fin:</p>
									<p class="text-primary">Fecha próxima:</p>
									<p class="text-primary">Kilometraje Actual:</p>
									<p class="text-primary">Kilometraje próximo:</p>
									<p class="text-primary">Costo total:</p>
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
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
									aute irure dolor in reprehenderit in voluptate velit esse
									cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
									cupidatat non proident, sunt in culpa qui officia deserunt
									mollit anim id est laborum.</p>
							</div>
							<div class="tab-pane fade" id="archivos">
								<h4>Archivos</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
									aute irure dolor in reprehenderit in voluptate velit esse
									cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
									cupidatat non proident, sunt in culpa qui officia deserunt
									mollit anim id est laborum.</p>
							</div>
							<div class="tab-pane fade" id="comentarios">
								<h4>Comentarios</h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
									aute irure dolor in reprehenderit in voluptate velit esse
									cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
									cupidatat non proident, sunt in culpa qui officia deserunt
									mollit anim id est laborum.</p>
							</div>
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
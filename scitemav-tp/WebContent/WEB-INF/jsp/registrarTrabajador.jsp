<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Registro de trabajador</title>

<!-- Core CSS - Include with every page -->
<link href="styles/bootstrap.min.css" rel="stylesheet">
<link href="styles/font-awesome/css/font-awesome.css" rel="stylesheet">

<!-- Page-Level Plugin CSS - Dashboard -->
<link href="styles/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
<link href="styles/plugins/timeline/timeline.css" rel="stylesheet">

<!-- SB Admin CSS - Include with every page -->
<link href="styles/sb-admin.css" rel="stylesheet">

<!-- Core Scripts - Include with every page -->
<!-- <script src="js/jquery-1.10.2.js"></script> -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>

<!-- Page-Level Plugin Scripts - Dashboard -->
<script src="js/plugins/morris/raphael-2.1.0.min.js"></script>
<!-- <script src="js/plugins/morris/morris.js"></script> -->

<!-- SB Admin Scripts - Include with every page -->
<script src="js/sb-admin.js"></script>

<!-- Page-Level Demo Scripts - Dashboard - Use for reference -->
<!-- <script src="js/demo/dashboard-demo.js"></script> -->
</head>

<script>

/* Script para inicializar para Pagina con la funcion*/
$(document).ready(function(e){
	listarCargos();
});

function listarCargos(){
	
	$.ajax({
 		url: 'getCargos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(cargos){
 			$('#comboEmpleados').empty();
 			$.each(cargos, function(i, cargo){
 				var cargo = cargos[i];
 				$('#comboEmpleados').append('<option value="'+cargo.idCargo+'">'+cargo.descripcion+'</option>');				
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
			<div class="row">
				<div class="col-lg-12">
					<br></br>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> Registro de nuevo trabajador
							<div class="pull-right">
								<div class="btn-group"></div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">

								<!-- Form de registro -->

								<form role="form" id="frmRegistroTrabajador" action="registro"
									method="post" commandName="personabean"
									style="width: 60%; margin-left: 20%;">

									<fieldset>
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
										
										<!--Cargo -->
										<div class="form-group">
											<label> Posicion</label> 
											<select class="form-control" id="comboEmpleados">


											</select>
										</div>
										<!--  -->										
										
										<div class="form-group">
											<label> Email</label>
											<div class="form-group input-group">
												<span class="input-group-addon">@</span> <input
													id="txtEmail" class="form-control" name="email"
													placeholder="Email"></input>
											</div>
										</div>

										<div class="form-group">
											<label> Password</label> <input class="form-control"
												placeholder="Password" name="password" type="password"
												value="" required>
										</div>


										<label> </label> <input
											class="btn btn-lg btn-success btn-block" type="submit"
											value="Registrar Trabajador" />
										<p>
											<label class="error"><c:out value="${msg}" /></label>
										</p>
									</fieldset>
								</form>


								<!-- fin de Form de registro -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

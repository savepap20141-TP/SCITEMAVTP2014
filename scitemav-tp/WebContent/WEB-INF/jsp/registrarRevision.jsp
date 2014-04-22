<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Revisión</title>
<jsp:include page="componentes/head.jsp" />
</head>

<script>
$(document).ready(function(e){
	var nfechaInicio = 'txtFechaInicio';
	cargarFecha(nfechaInicio);
	//var nfechaFin = 'txtFechaFin';
	//cargarFecha(nfechaFin);
	//var nProximaRev = 'txtProximaRevision';
	//cargarFecha(nProximaRev);
	listarVehiculos();
});
</script>

<script>

function listarVehiculos(){
	
	$.ajax({
 		url: 'getVehiculos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(vehiculos){
 			$('#comboAutomovil').empty();
 			$.each(vehiculos, function(i, vehiculo){
 				$('#comboAutomovil').append('<option value="'+vehiculo.idVehiculo+'">'+vehiculo.numeroPlaca+'</option>');				
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
							<i class="fa fa-bar-chart-o fa-fw"></i> Registro de nueva revisión
							<div class="pull-right">
								<div class="btn-group"></div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">

								<!-- Form de registro -->

								<form role="form" id="frmRegistroRevision" action="registroRevision"
									method="post" commandName="revisionBean"
									style="width: 60%; margin-left: 20%;">

									<fieldset>
									
										<div class="form-group">
											<label> Automóvil</label>
											<select class="form-control" id="comboAutomovil" name="idVehiculo">

                                            </select>
										</div>
										
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
												class="form-control" name="proximaRevision"
												placeholder="Fecha de Inicio"></input>
												<span class="input-group-btn">
												    <button class="btn btn-default fa fa-table fa-fw" type="button" style="margin-top:25px; height: 34px;" onclick="$('#txtProximaRevision').datepicker('show')"></button>
												</span>
										</div>																				
																		
							
										<label> </label> <input
											class="btn btn-lg btn-success btn-block" type="submit"
											value="Registrar Revisión" />
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
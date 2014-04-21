<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Revisión</title>
<jsp:include page="componentes/head.jsp" />
</head>
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

								<form role="form" id="frmRegistroRevision" action="registro"
									method="post" commandName="revisionBean"
									style="width: 60%; margin-left: 20%;">

									<fieldset>
									
										<div class="form-group">
											<label> Automóvil</label>
											<select class="form-control" id="comboAutomovil">

                                            </select>
										</div>
										
										<div class="form-group">
											<label> Costo Total </label> <input id="txtCostoTotal"
											class="form-control" name="costoTotal" placeholder="Costo total"></input>
										</div>
										
										<div class="form-group">
											<label> Fecha de Inicio </label> <input id="txtFechaInicio"
											class="form-control" name="fechaInicio" type="date"></input>
										</div>
										
										<div class="form-group">
											<label> Fecha de Fin </label> <input id="txtFechaFin"
											class="form-control" name="fechaInicio" type="date"></input>
										</div>
										
										<div class="form-group">
											<label> Próxima revisión </label> <input id="txtProximaRevision"
											class="form-control" name="proximaRevision" type="date"></input>
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
</body>
</html>
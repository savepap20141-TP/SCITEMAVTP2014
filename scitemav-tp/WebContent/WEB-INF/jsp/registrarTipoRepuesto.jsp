<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de un tipo de repuesto</title>
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
							<i class="fa fa-bar-chart-o fa-fw"></i> Registro de nuevo tipo de repuesto
							<div class="pull-right">
								<div class="btn-group"></div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">

								<!-- Form de registro -->

								<form role="form" id="frmRegistroTipoRepuesto" action="registro"
									method="post" commandName="tipoRepuestoBean"
									style="width: 60%; margin-left: 20%;">

									<fieldset>
									
										<div class="form-group">
                                            <label>Descripción</label>
                                            <textarea class="form-control" rows="3" id="txtDescripcion" name="descripcion"></textarea>
                                        </div>
										
										
										
										
										<label> </label> <input
											class="btn btn-lg btn-success btn-block" type="submit"
											value="Registrar Tipo de repuesto" />
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
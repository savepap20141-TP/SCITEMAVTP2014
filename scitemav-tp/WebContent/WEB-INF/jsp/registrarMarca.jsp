<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de marca</title>
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
			
				<div class="col-lg-12" style="width:90%;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> Registro de marca
							
						</div>
						<div class="panel-body">
							<div class="row">

								<!-- Form de registro -->

								<form role="form" id="frmRegistroMarca" action="registroMarca"
									method="post" commandName="marcaBean" style="width: 30%; margin-left: 10%;">

									<fieldset>
									
										<div class="form-group">
											<label> Nombre Marca</label> <input id="txtNombre"
											class="form-control" name="nombre" placeholder="Nombre"></input>
										</div>
										
										<label> </label> <input
											class="btn btn-lg btn-success btn-block" type="submit"
											value="Registrar Marca" style="width: 60%; margin-left: 20%; margin-top: 10%;"/>
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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Tipo de Vehiculo</title>
<jsp:include page="componentes/head.jsp" />
</head>
<style>
label.error {
	margin-left: 10px;
	width: auto;
	display: inline;
	color: rgb(255, 0, 0);
	font-weight: bold;
}

label.ok {
	margin-left: 10px;
	width: auto;
	display: inline;
	color: green;
	font-weight: bold;
}
</style>
<script type="text/javascript">
function registrarTipoVehiculo(){
	$.ajax({
   		url: 'registroTipoVehiculo',
   		type: 'post',
   		dataType: 'json',
   		data: $('#frmRegistroTipoVehiculo').serialize(),
   		success: function(result){
   			$('#resultOk').empty();
			$('#resultFalse').empty();			
   			if(result == true){   				
   				$('#resultOk').append('Se ha registrado correctamente');
   				$('#txtNombreTV').val('');
   			}else{
   				$('#resultFalse').append('Se ha producido un error al registrarse');
   			}
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
							<i class="fa fa-bar-chart-o fa-fw"></i> Registro de nuevo tipo de vehículo
							<div class="pull-right">
								<div class="btn-group"></div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">

								<!-- Form de registro -->

								<form role="form" id="frmRegistroTipoVehiculo"
									method="post" commandName="tipovehiculo"
									style="width: 60%; margin-left: 20%;">

									<fieldset>
									
										<div class="form-group">
											<label> Tipo de carrocería: </label> <input required 
											class="form-control" name="nombre"  placeholder="Nombre" id="txtNombreTV"/>
										</div>
										
                                        <div class="form-group">
                                            <label>Imagen de ejemplo: </label>
                                            <input type="file">
                                        </div>
										
									
										
										<label> </label>
										 <span	class="btn btn-lg btn-success btn-block" onclick="registrarTipoVehiculo();">Registrar Tipo Vehiculo</span>
										<p><br>
											<label class="ok" id="resultOk"></label>
											<label class="error" id="resultFalse"></label>
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
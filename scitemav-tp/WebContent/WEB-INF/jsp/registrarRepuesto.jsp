<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Repuesto</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
$(document).ready(function(e){	
	listarTiporepuestos();
});
</script>
<script>

function listarTiporepuestos(){
	
	$.ajax({
 		url: 'getTipoRepuestos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(tiporepuesto){
 			$('#comboTiporepuestos').empty();
 			$.each(tiporepuesto, function(i, tiporepuestos){
 				$('#comboTiporepuestos').append('<option value="'+tiporepuestos.idTipoRepuesto+'">'+tiporepuestos.nombre+'</option>');				
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
			
				<div class="col-lg-12" style="width:90%;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> Registro de nuevo repuesto
							
						</div>
						<div class="panel-body">
							<div class="row">

								<!-- Form de registro -->

								<form role="form" id="frmRegistroRepuesto" action="registroRepuesto"
									method="post" commandName="respuestoBean" style="width: 30%; margin-left: 10%;">

									<fieldset>
									
										<div class="form-group">
											<label> Nombre </label> <input id="txtNombre"
											class="form-control" name="nombre" placeholder="Nombre"></input>
										</div>
										
										<div class="form-group">
											<label> Tipo</label>
											<select class="form-control" id="comboTiporepuestos" name="idTipoRepuesto">
											   <option value="">Seleccione su tipo de repuesto</option>

                                            </select>
										</div>
										
										
										
										
										<label> </label> <input
											class="btn btn-lg btn-success btn-block" type="submit"
											value="Registrar Repuesto" style="width: 60%; margin-left: 20%; margin-top: 10%;"/>
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
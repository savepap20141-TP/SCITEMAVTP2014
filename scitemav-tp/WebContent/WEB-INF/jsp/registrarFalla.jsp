<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Fallas</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
$(document).ready(function(e){

	$('#frmRegistroFalla').validate({
		rules:{
			descripcion:{
			required: true,
			}
		},
	
	messages:{
		descripcion:{
		required: "Se debe ingresar descripcion de falla",
		}
	},			
	submitHandler: function(form){
		form.submit();
	}		
});
});
</script>
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
<script>
$(document).ready(function(e){	
	listarTipofallas();
});
</script>
<script>

function listarTipofallas(){
	
	$.ajax({
 		url: 'getTipoFallas',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(tipofalla){
 			$('#comboTipofallas').empty();
 			$.each(tipofalla, function(i, tipofallas){
 				$('#comboTipofallas').append('<option value="'+tipofallas.idTipoFalla+'">'+tipofallas.nombreTipoFalla+'</option>');				
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
							<i class="fa fa-bar-chart-o fa-fw"></i> Registro de nuevo falla
						</div>
						<div class="panel-body">
							<div class="row">

								<!-- Form de registro -->

								<form role="form" id="frmRegistroFalla" action="registroFalla"
									method="post" commandName="fallasBean" style="width: 60%; margin-left: 10%;">

									<fieldset>
									
										<div class="form-group">
                                            <label>Descripción</label>
                                            <textarea id="txtDescripcion" class="form-control" name="descripcion" placeholder="Descripcion"></textarea>
                                        </div>
										
										<div class="form-group">
											<label> Tipo</label>
											<select class="form-control" id="comboTipofallas" name="idTipoFalla">
											   <option value="">Seleccione su tipo de falla</option>

                                            </select>
										</div>
										
										
										<label> </label> <input
											class="btn btn-lg btn-success btn-block" type="submit"
											value="Registrar Falla" style="width: 60%; margin-left: 20%; margin-top: 10%;"/>
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
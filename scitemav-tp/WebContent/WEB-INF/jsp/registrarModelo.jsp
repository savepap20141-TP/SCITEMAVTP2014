<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de modelo</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
$(document).ready(function(e){
	listarMarcas();
	$('#frmRegistroModelo').validate({
		rules:{
			nombre:{
			required: true,
			},
			idMarca:{
			required: true,
			}
		},
	
	messages:{
		nombre:{
		required: "Se debe ingresar un nombre de modelo",
		},
		idMarca:{
		required: "Seleccione una Marca",	
		}
	},			
	submitHandler: function(form){
		form.submit();
	}		
});
});
</script>
<script>

function listarMarcas(){
	
	$.ajax({
 		url: 'getMarcas',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(marcas){
 			$('#comboMarca').empty();
 			$('#comboMarca').append('<option value="">Seleccione su Marca</option>');
 			$.each(marcas, function(i, marca){
 				$('#comboMarca').append('<option value="'+marca.idMarca+'">'+marca.nombre+'</option>');				
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
							<i class="fa fa-bar-chart-o fa-fw"></i> Registro de nuevo modelo
							<div class="pull-right">
								<div class="btn-group"></div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">

								<!-- Form de registro -->

								<form role="form" id="frmRegistroModelo" action="registroModelo"
									method="post" commandName="modelobean"
									style="width: 60%; margin-left: 20%;">

									<fieldset>
									
										<div class="form-group">
											<label> Nombre</label> <input id="txtNombre"
											class="form-control" name="nombre" placeholder="Nombre"></input>
										</div>
										
										<div class="form-group">
                                            <label>Seleccione Marca</label>
                                            <select class="form-control" id="comboMarca" name=idMarca>
                                            <option value="">Seleccione su Marca</option>

                                            </select>
                                        </div>

										
									
										
										<label> </label> <input
											class="btn btn-lg btn-success btn-block" type="submit"
											value="Registrar Modelo" />
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
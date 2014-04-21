<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Clientes</title>
<jsp:include page="componentes/head.jsp" />
</head>
<style>
.tableGri {
/*     line-height: 30px; */
    background-color: rgb(235, 240, 242);
    font-weight: bold;
    font-size: 12px;
/*     text-align: left; */
    color: rgb(120, 138, 150);
}
</style>
<script>
$(document).ready(function(e){
	inicioConsulta();
});

function inicioConsulta(){
	var filas = '';
	var columnas = '';	
    $.ajax({
 		url: 'getClientes',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(clientes){
 			$.each(clientes, function(i, cliente){
 				filas = filas +'<tr class="">'+
				'<td class="center">'+cliente.dni+'</td>'+
				'<td class="center">'+cliente.nombre+'</td>'+
				'<td class="center">'+cliente.apellidoPaterno+'</td>'+
				'<td class="center">'+cliente.apellidoMaterno+'</td>'+
				'<td class="center">'+cliente.sexo+'</td>'+
				'<td class="center">'+cliente.telefono+'</td>'+
				'<td class="center">'+cliente.celular+'</td>'+
				'<td class="center">'+cliente.nombreDistrito+'</td>'+
				'<td class="center">'+cliente.direccion+'</td>'+
				'<td class="center">'+cliente.fechaNacimiento+'</td>'+
				'<td class="center">'+cliente.email+'</td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 				'<th class="center">DNI</th>'+
				'<th class="center">Nombre Cliente</th>'+
				'<th class="center">Apellido Paterno</th>'+
				'<th class="center">Apellido Materno</th>'+
				'<th class="center">Sexo</th>'+
				'<th class="center">Telefono</th>'+
				'<th class="center">Celular</th>'+
				'<th class="center">Distrito</th>'+
				'<th class="center">Direccion</th>'+
				'<th class="center">Fecha de Nacimiento</th>'+
				'<th class="center">Email</th>';
 			realizarTabla(columnas,filas);
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
                    <h1 class="page-header">Consultar Clientes</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lista de Clientes
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                            	<div id="spnResultList" class="resultBox section summaryPane"></div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
		
		</div>

 </div>
</body>
</html>
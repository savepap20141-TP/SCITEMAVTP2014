<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Empleados</title>
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
 		url: 'getEmpleados',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(empleados){
 			$.each(empleados, function(i, empleado){
 				filas = filas +'<tr class="">'+
 				'<td class="center"><a id="empleado_"'+i+'" href="toEmpleadoDetalle-'+empleado.idEmpleado+'">EMP-'+empleado.idEmpleado+'</a></td>'+
				'<td class="center">'+empleado.dni+'</td>'+
				'<td class="center">'+empleado.nombre+'</td>'+
				'<td class="center">'+empleado.apellidoPaterno+'</td>'+
				'<td class="center">'+empleado.apellidoMaterno+'</td>'+
				'<td class="center">'+empleado.sexo+'</td>'+
				'<td class="center">'+empleado.telefono+'</td>'+
				'<td class="center">'+empleado.celular+'</td>'+
				'<td class="center">'+empleado.nombreDistrito+'</td>'+
				'<td class="center">'+empleado.direccion+'</td>'+
				'<td class="center">'+empleado.fechaNacimiento+'</td>'+
				'<td class="center">'+empleado.email+'</td>'+
				'<td class="center">'+empleado.nombreCargo+'</td>'+
				'<td class="center">'+empleado.nombreEspecialidad+'</td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 				'<th class="center">DNI</th>'+
				'<th class="center">Nombre empleado</th>'+
				'<th class="center">Apellido Paterno</th>'+
				'<th class="center">Apellido Materno</th>'+
				'<th class="center">Sexo</th>'+
				'<th class="center">Telefono</th>'+
				'<th class="center">Celular</th>'+
				'<th class="center">Distrito</th>'+
				'<th class="center">Direccion</th>'+
				'<th class="center">Fecha de Nacimiento</th>'+
				'<th class="center">Email</th>'+
				'<th class="center">Cargo</th>'+
				'<th class="center">Especialidad</th>';
 			realizarTabla(columnas,filas);
 			removeNulls();
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
                    <h1 class="page-header">Consultar empleados</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lista de empleados
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
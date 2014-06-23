<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Vehículos</title>
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
 		url: 'getVehiculos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(vehiculos){
 			$.each(vehiculos, function(i, vehiculo){
 				filas = filas +'<tr class="">'+
				'<td class="center"><a id="vehiculo_'+i+'" href="toVehiculoDetalle-'+vehiculo.idVehiculo+'">VEH-'+vehiculo.idVehiculo+'</a></td>'+
				'<td class="center">'+vehiculo.nombreCliente+'</td>'+
				'<td class="center">'+vehiculo.nombreMarca+'</td>'+
				'<td class="center">'+vehiculo.nombreTipoVehiculo+'</td>'+
				'<td class="center">'+vehiculo.nombreModelo+'</td>'+
				'<td class="center">'+vehiculo.fabricacion+'</td>'+
				'<td class="center">'+vehiculo.color+'</td>'+
				'<td class="center">'+vehiculo.numeroMotor+'</td>'+
				'<td class="center">'+vehiculo.numeroPlaca+'</td>'+
				'<td class="center">'+vehiculo.numeroEjes+'</td>'+
				'<td class="center">'+vehiculo.numeroRuedas+'</td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 				'<th class="center">Codigo</th>'+
				'<th class="center">Cliente</th>'+
				'<th class="center">Marca</th>'+
				'<th class="center">Tipo Vehiculo</th>'+
				'<th class="center">Modelo</th>'+
				'<th class="center">Fabricación</th>'+
				'<th class="center">Color</th>'+
				'<th class="center">Número Motor</th>'+
				'<th class="center">Número Placa</th>'+
				'<th class="center">Número Ejes</th>'+
				'<th class="center">Número Ruedas</th>';
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
                    <h1 class="page-header">Consultar Vehículos</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lista de Vehículos
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
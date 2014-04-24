<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Consultar Tipo Vehiculo</title>
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
 		url: 'getTipoVehiculos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(tipvehiculos){
 			$.each(tipvehiculos, function(i, tipveh){
 				filas = filas +'<tr class="">'+
				'<td class="center">'+tipveh.idTipoVehiculo+'</td>'+
				'<td class="center">'+tipveh.nombre+'</td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + '<th class="center">Id Tipo Vehiculo</th><th class="center">Nombre</th>';
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
                    <h1 class="page-header">Consultar Tipo Vehiculo</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lista de Tipos de Vehiculo
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                            	<div id="spnResultList" class="resultBox section summaryPane"></div>
                                <!-- <table class="table table-striped table-bordered table-hover" id="dataTables-example">        
                                <thead><tr><th>Id Tipo Vehiculo</th><th>Nombre</th></tr></thead><tbody id="resultTipVehiculo"></tbody>                            
                                </table> -->
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
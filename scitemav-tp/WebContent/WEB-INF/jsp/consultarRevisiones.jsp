<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Revisiones</title>
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
 		url: 'getRevisiones',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(revisiones){
 			$.each(revisiones, function(i, revision){
 				filas = filas +'<tr class="">'+
 				'<td class="center"><a id="revision_"'+i+'" href="toRevisionDetalle-'+revision.idRevision+'">REV-'+revision.idRevision+'</a></td>'+
 			//	'<td class="center">'+revision.idRevision+'</td>'+
 				'<td class="center">'+revision.numeroPlaca+'</td>'+
 				'<td class="center">'+revision.fechaInicio+'</td>'+
 				'<td class="center">'+revision.fechaFin+'</td>'+
 				'<td class="center">'+revision.fechaProxima+'</td>'+
 				'<td class="center">'+revision.kilometrajeActual+'</td>'+
 				'<td class="center">'+revision.kilometrajeProximo+'</td>'+ 				
 				'<td class="center">'+revision.costoTotal+'</td>'+
 				'<td class="center"><a target="_blank" href="verPDFRevision-'+revision.idRevision+'"><img width="50" height="50" src="images/pdfReport.jpg"></a></td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 				'<th class="center">Id</th>'+
				'<th class="center">Vehiculo</th>'+
				'<th class="center">Fecha de inicio</th>'+
				'<th class="center">Fecha de fin</th>'+
				'<th class="center">Fecha próxima</th>'+
				'<th class="center">Kilometraje Actual</th>'+
				'<th class="center">Kilometraje Próximo</th>'+
				'<th class="center">Costo total</th>'+
				'<th class="center">Reporte</th>';	
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
                    <h1 class="page-header">Consultar Revisiones</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lista de Revisiones
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

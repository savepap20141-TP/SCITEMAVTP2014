<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Repuesto</title>
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
 		url: 'getRepuesto',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(repuestos){
 			$.each(repuestos, function(i, rep){
 				filas = filas +'<tr class="">'+
				'<td class="center">'+rep.idRepuesto+'</td>'+
				'<td class="center">'+rep.nombre+'</td>'+
				'<td class="center">'+rep.nombreTipoRepuesto+'</td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 			'<th class="center">Codigo</th>'+
 			'<th class="center">Nombre</th>'+
 			'<th class="center">Tipo Repuesto</th>';
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
                    <h1 class="page-header">Consultar Repuestos</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lista de Repuestos
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
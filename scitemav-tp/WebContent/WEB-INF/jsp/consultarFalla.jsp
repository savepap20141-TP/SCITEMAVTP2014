<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Falla</title>
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
 		url: 'getFalla',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(fallas){
 			$.each(fallas, function(i, fal){
 				filas = filas +'<tr class="">'+
				'<td class="center">'+fal.idFalla+'</td>'+
				'<td class="center">'+fal.descripcion+'</td>'+
				'<td class="center">'+fal.nombreTipoFalla+'</td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 			'<th class="center">Codigo</th>'+
 			'<th class="center">Descripcion</th>'+
 			'<th class="center">Tipo Falla</th>';
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
                    <h1 class="page-header">Consultar Fallas</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lista de Fallas
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
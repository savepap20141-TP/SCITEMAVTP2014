<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Página Principal</title>

   	<jsp:include page="componentes/head.jsp" />
</head>
<script>
var arregloReviEnv = [];
$(document).ready(function(){
	IniciarNotificacion();
	cargarContadorRevisiones();
});
function cargarContadorRevisiones(){
	$.ajax({
		   url: 'cargarContadorRevisiones',
		   type: 'post',
		   dataType: 'json',
		   data: '',
		   success: function(contadores){
				  $.each(contadores, function(z, cont){
					  $('#countRev_'+(z+1)).text('('+cont+')');
				  });		
			}
	  });
}
function IniciarNotificacion(){
	var fechaHoy = new Date();
	//alert(fechaHoy);
	//alert(fechaHoy.getMonth()+"-"+fechaHoy.getFullYear()+"-"+fechaHoy.getDate());
	i=0;
	while (i < 10) {
		fechaHoy.setTime(fechaHoy.getTime()+24*60*60*1000); // añadimos 1 día	  		
	    i++;  
		/* if(i==10){
			alert(i+".- "+fechaHoy.getMonth()+"-"+fechaHoy.getFullYear()+"-"+fechaHoy.getDate());
			alert(fechaHoy);
		}	 */    
	}
	var textoFechaHoy = ""+fechaHoy.getFullYear()+"-"+(fechaHoy.getMonth()+1)+"-"+fechaHoy.getDate();
	//alert("FECHA TEMP 2 "+textoFechaHoy);
	var FecArray = textoFechaHoy.split('-');
		
	var fechaTempHoy = new Date();
	fechaTempHoy.setMonth(parseInt(FecArray[1]-1));	
	fechaTempHoy.setYear(parseInt(FecArray[0]));	
	fechaTempHoy.setDate(parseInt(FecArray[2]));
	
	inicioConsultaRevision(fechaTempHoy);
}


function updateStateRev(source,i){
	$('#changeR_'+i).val('true');
}
function inicioConsultaRevision(fechaHoyT){
	var filas = '';
	var columnas = '';	
    $.ajax({
 		url: 'getRevisiones-normal',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(revisiones){
 			$.each(revisiones, function(i, revision){
 				
 				var textoFechaRevProxima = ""+revision.fechaProxima;
 				var revProxArray = textoFechaRevProxima.split('-');
 				
 				var fechaTempProxima = new Date();
 				fechaTempProxima.setMonth(parseInt(revProxArray[1]-1));	
 				fechaTempProxima.setYear(parseInt(revProxArray[0]));	
 				fechaTempProxima.setDate(parseInt(revProxArray[2]));
 				
 				//alert("FECHA TEMP Proxima "+fechaTempProxima.getFullYear()+"-"+fechaTempProxima.getMonth()+"-"+fechaTempProxima.getDate());
 				if(fechaHoyT>=fechaTempProxima){
 					var chckeado = '';
 					if(revision.notificacion==true){
 						chckeado = 'checked';
 						arregloReviEnv.push(revision.idRevision);
 					}
 					
 	 				filas = filas +'<tr class="">'+
 	 				'<td class="center"><input id="chkRev_'+revision.idRevision+'" '+chckeado+' type="checkbox" onclick="updateStateRev(this,'+ i +')"></td>'+
 	 				'<td class="center"><a id="revision_'+i+'" href="toRevisionDetalle-'+revision.idRevision+'">REV-'+revision.idRevision+'</a></td>'+
 	 			//	'<td class="center">'+revision.idRevision+'</td>'+
 	 				'<td class="center"><a id="vehiculo_'+i+'" href="toVehiculoDetalle-'+revision.idVehiculo+'">'+revision.numeroPlaca+'</a><input id="changeR_'+i+'" type="hidden" name="changeR"></td>'+
 	 				'<td class="center"><a id="cliente_'+i+'" href="toClienteDetalle-'+revision.idCliente+'">'+revision.nombreCliente+'</a></td>'+
 	 				'<td class="center">'+revision.fechaInicio+'<input type="hidden" value="'+revision.idRevision+'" id="idRev_'+i+'" name="idrev"/></td>'+
 	 				'<td class="center">'+revision.fechaFin+'</td>'+
 	 				'<td class="center">'+revision.fechaProxima+'</td>'+
 	 				'<td class="center">'+revision.kilometrajeActual+'</td>'+
 	 				'<td class="center">'+revision.kilometrajeProximo+'</td>'+ 				
 	 				'<td class="center">'+revision.costoTotal+'</td>'+
 	 				'<td class="center"><a target="_blank" href="verPDFRevision-'+revision.idRevision+'"><img width="50" height="50" src="images/pdfReport.jpg"></a></td>'+
 					'</tr>';	
 				}else if(fechaHoyT.getFullYear()==fechaTempProxima.getFullYear() && fechaHoyT.getMonth()==fechaTempProxima.getMonth()
 						&& fechaHoyT.getDate()==fechaTempProxima.getDate()){
 					var chckeado = '';
 					if(revision.notificacion==true){
 						chckeado = 'checked';
 						arregloReviEnv.push(revision.idRevision);
 					}
 					
 					filas = filas +'<tr class="">'+
 	 				'<td class="center"><input id="chkRev_'+revision.idRevision+'" '+chckeado+' type="checkbox" onclick="updateStateRev(this,'+ i +')"></td>'+
 	 				'<td class="center"><a id="revision_'+i+'" href="toRevisionDetalle-'+revision.idRevision+'">REV-'+revision.idRevision+'</a></td>'+
 	 			//	'<td class="center">'+revision.idRevision+'</td>'+
 	 				'<td class="center"><a id="vehiculo_'+i+'" href="toVehiculoDetalle-'+revision.idVehiculo+'">'+revision.numeroPlaca+'</a><input id="changeR_'+i+'" type="hidden" name="changeR"></td>'+
 	 				'<td class="center"><a id="cliente_'+i+'" href="toClienteDetalle-'+revision.idCliente+'">'+revision.nombreCliente+'</a></td>'+
 	 				'<td class="center">'+revision.fechaInicio+'<input type="hidden" value="'+revision.idRevision+'" id="idRev_'+i+'" name="idrev" /></td>'+
 	 				'<td class="center">'+revision.fechaFin+'</td>'+
 	 				'<td class="center">'+revision.fechaProxima+'</td>'+
 	 				'<td class="center">'+revision.kilometrajeActual+'</td>'+
 	 				'<td class="center">'+revision.kilometrajeProximo+'</td>'+ 				
 	 				'<td class="center">'+revision.costoTotal+'</td>'+
 	 				'<td class="center"><a target="_blank" href="verPDFRevision-'+revision.idRevision+'"><img width="50" height="50" src="images/pdfReport.jpg"></a></td>'+
 					'</tr>';			
 				}
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 				'<th class="center">Enviado</th>'+
 				'<th class="center">Codigo</th>'+
				'<th class="center">Vehiculo</th>'+
				'<th class="center">Nombre Cliente</th>'+
				'<th class="center">Fecha de inicio</th>'+
				'<th class="center">Fecha de fin</th>'+
				'<th class="center">Fecha próxima</th>'+
				'<th class="center">Kilometraje Actual</th>'+
				'<th class="center">Kilometraje Próximo</th>'+
				'<th class="center">Costo total</th>'+
				'<th class="center">Reporte</th>';	
 			realizarTabla(columnas,filas);
 			
 			for(var x = 0; x < arregloReviEnv.length;x++){
				document.getElementById("chkRev_"+arregloReviEnv[x]).checked=true;
				$("#chkRev_"+arregloReviEnv[x]).attr('disabled','disabled');
			}
 			removeNulls();
  		}
 	});
}

$(document).on('click','#btnEnviarNotificacion', function(e){
	var list_IdRev = '';
	list_isChangedR = document.getElementsByName('changeR');
	list_idRev = document.getElementsByName('idrev');
	//alert(list_isChangedR.length);
	  for (var x=0; x < list_isChangedR.length; x++) {
		  //alert("Valor "+list_isChangedR[x].value);
		  if(list_isChangedR[x].value==true || list_isChangedR[x].value=='true'){
			list_IdRev += list_idRev[x].value+'_';
			//alert("Valor id "+list_idRev[x].value);
			$('#changeR_'+x).val('');
		  }
	 }
	$('#idRevision_list').val(list_IdRev);	
	//alert(list_IdRev);
	  $.ajax({
		   url: 'notificarClientes',
		   type: 'post',
		   dataType: 'json',
		   data: $('#frmAdministrarNotificaciones').serialize(),
		   complete: function() {
			   IniciarNotificacion();
	   	   },
		   success: function(enviados){
			   if(enviados != ""){
				    var msgASR = [];
				    $('#resulNotRev').hide();
				    var contactos = "";
					  $.each(enviados, function(z, env){
						  msgASR.push('Notificacion Revision enviada a: ' + env);
						  contactos += 'Notificacion Revision enviada a: ' +env+'<br>';
						  //alert(env);
					  });		
					if(msgASR.length>0){
						$('#resulNotRev').show();
						$('#mensajeNotificacionRev').empty();
						$('#mensajeNotificacionRev').append(contactos);
					}  
				   }				   
			}
	  });
});

function VerHTML(){
	window.open("verPDF");
}
function revision1(){
	window.open("verPDFRevision-1");
}
</script>
<body>

    <div id="wrapper">
		
		<jsp:include page="componentes/cabecera.jsp" />
		
		<jsp:include page="componentes/menu.jsp" />

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Contenido</h1>
                </div>                
                <!-- /.col-lg-12 -->
            </div>
            <div class="alert alert-danger alert-dismissable" id="resultFalse">
    			<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
				<div class="panel-heading" style="background-color: #F5F5F5;">
				    <i class="fa fa-bell fa-fw"></i>
					Lista de Revisiones Proximas                    
				</div>
				<br>
				<input class="btn btn-lg btn-success btn-block" type="button" style="width: 20%;" value="Notificar Cliente" id="btnEnviarNotificacion"></input><br>
                   	<div class="alert alert-success alert-dismissable" id="resulNotRev" style="display:none">
		    			<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
		    			<span id="mensajeNotificacionRev"></span>
					</div>
				<div id="spnResultList" class="resultBox section summaryPane"></div>
				<form id="frmAdministrarNotificaciones">		
					<input id="idRevision_list" type="hidden" name="idRevisionList"/>
				</form>
			</div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> REVISIONES
                            <div class="pull-right">
                                <div class="btn-group" style="display:none">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a onclick="VerHTML();">Prueba PDF</a>
                                        </li>
                                        <li><a onclick="revision1();">Revision 1</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="toConsultarRevision-Creada" class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> Creada
                                    <span class="pull-right text-muted small" id="countRev_1">(0)</span>
                                </a>
                                <a href="toConsultarRevision-Inspeccionada"  class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> Inspeccionada
                                    <span class="pull-right text-muted small" id="countRev_2">(0)</span>
                                </a>
                                <a href="toConsultarRevision-Supervisada"  class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> Supervisada
                                    <span class="pull-right text-muted small" id="countRev_3">(0)</span>
                                </a>
                                <a href="toConsultarRevision-Deshaprobada"  class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> Verificada por el Cliente - Desaprobada
                                    <span class="pull-right text-muted small" id="countRev_4">(0)</span>
                                </a>
                                <a href="toConsultarRevision-Aprobada"  class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> Verificada por el Cliente - Aprobada
                                    <span class="pull-right text-muted small" id="countRev_5">(0)</span>
                                </a>                                
                                <a href="toConsultarRevision-Ejecutada"  class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> Ejecutada
                                    <span class="pull-right text-muted small" id="countRev_6">(0)</span>
                                </a>
                                <a href="toConsultarRevision-Terminada"  class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> Terminada
                                    <span class="pull-right text-muted small" id="countRev_7">(0)</span>
                                </a>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default" style="display:none">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Timeline
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                                <li>
                                    <div class="timeline-badge"><i class="fa fa-check"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Timeline Event</h4>
                                            <p>
                                                <small class="text-muted"><i class="fa fa-time"></i> 11 hours ago via Twitter</small>
                                            </p>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eu mi scelerisque vulputate. Aliquam in metus eu lectus aliquet egestas.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-badge warning"><i class="fa fa-credit-card"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Timeline Event</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eu mi scelerisque vulputate. Aliquam in metus eu lectus aliquet egestas.</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eu mi scelerisque vulputate. Aliquam in metus eu lectus aliquet egestas.</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-badge danger"><i class="fa fa-credit-card"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Timeline Event</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eu mi scelerisque vulputate. Aliquam in metus eu lectus aliquet egestas.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Timeline Event</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eu mi scelerisque vulputate. Aliquam in metus eu lectus aliquet egestas.</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-badge info"><i class="fa fa-save"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Timeline Event</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eu mi scelerisque vulputate. Aliquam in metus eu lectus aliquet egestas.</p>
                                            <hr>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
                                                    <i class="fa fa-cog"></i> 
                                                    <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#">Action</a>
                                                    </li>
                                                    <li><a href="#">Another action</a>
                                                    </li>
                                                    <li><a href="#">Something else here</a>
                                                    </li>
                                                    <li class="divider"></li>
                                                    <li><a href="#">Separated link</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Timeline Event</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eu mi scelerisque vulputate. Aliquam in metus eu lectus aliquet egestas.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-badge success"><i class="fa fa-thumbs-up"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Timeline Event</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel justo eu mi scelerisque vulputate. Aliquam in metus eu lectus aliquet egestas.</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4" style="display:none">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Notifications Panel
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small"><em>11:32 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                    <span class="pull-right text-muted small"><em>11:13 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                    <span class="pull-right text-muted small"><em>10:57 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                                    <span class="pull-right text-muted small"><em>9:49 AM</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-money fa-fw"></i> Payment Received
                                    <span class="pull-right text-muted small"><em>Yesterday</em>
                                    </span>
                                </a>
                            </div>
                            <!-- /.list-group -->
                            <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="chat-panel panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i>
                            Chat
                            <div class="btn-group pull-right">
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-chevron-down"></i>
                                </button>
                                <ul class="dropdown-menu slidedown">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-refresh fa-fw"></i> Refresh
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-check-circle fa-fw"></i> Available
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-times fa-fw"></i> Busy
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-clock-o fa-fw"></i> Away
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-sign-out fa-fw"></i> Sign Out
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="chat">
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Jack Sparrow</strong> 
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 12 mins ago
                                            </small>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                        <img src="http://placehold.it/50/FA6F57/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 13 mins ago</small>
                                            <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Jack Sparrow</strong> 
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 14 mins ago</small>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                        <img src="http://placehold.it/50/FA6F57/fff" alt="User Avatar" class="img-circle" />
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 15 mins ago</small>
                                            <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                        <div class="panel-footer">
                            <div class="input-group">
                                <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-warning btn-sm" id="btn-chat">
                                        Send
                                    </button>
                                </span>
                            </div>
                        </div>
                        <!-- /.panel-footer -->
                    </div>
                    <!-- /.panel .chat-panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->



</body>

</html>

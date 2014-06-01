<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Revisi�n Detalle</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
var arregloAsignados = [];
	$(document).ready(function(e) {
		
		var nfechaIni = 'txtFechaInicio';
		cargarFechaRevis(nfechaIni);
		
		/* $.validator.addMethod("LetyNumRegex", function(value, element) {
	        return this.optional(element) || /^[A-Z0-9\-\s]+$/i.test(value);
	    }, " ");
		$.validator.addMethod("NumRegex", function(value, element) {
	        return this.optional(element) || /^[0-9\-\s]+$/i.test(value);
	    }, " ");
		$.validator.addMethod("LetRegex", function(value, element) {
	        return this.optional(element) || /^[A-Z]+$/.test(value);
	    }, "");
		$.validator.addMethod("DecRegex", function(value, element) {
	        return this.optional(element) || /^(\d+|\d+.\d{7,4})$/.test(value);
	    }, " ");
		$.validator.addMethod("DecKilRegex", function(value, element) {
	        return this.optional(element) || /^(\d+|\d+.\d{5,3})$/.test(value);
	    }, " ");
		$.validator.addMethod("NumPlacaRegex", function(value, element) {
	        return this.optional(element) || /^[[A-Z0-9]{3}[-]{1}[A-Z0-9]{3}$/.test(value);
	    }, " "); */
		
		$('#frmEdicionRevision').validate({
			rules:{
				costoTotal:{
					required:true,
					DecRegex:true,
					maxlength:12,
					minlength:4
					
				},
				fechaInicio:{
					required: true,
				      dpDate: true,
					
				},
				fechaFin:{
					required: true,
				      dpDate: true,			
				},
				fechaProxima:{
					required: true,
				      dpDate: true,
				},
				kilometrajeActual:{
					required:true,
					DecKilRegex: true,
					maxlength:9,
					minlength:3					
				},
				kilometrajeProximo:{
					required:true,
					DecKilRegex: true,
					maxlength:9,
					minlength:3				
				}
				
			},
			messages:{
				costoTotal:{
					required:"Debe ingresar costo total",
					NumRegex:"S�lo n�meros en el costo total",
					minlength:"Tiene que tener 12 d�gitos en el costototal",
					maxlength:"Tiene que tener 4 d�gitos en el costototal"
				},
				fechaInicio:{
					required:"Se debe ingresar una Fecha de Inicio",
					dpDate:"Solo Fechas",	
					dpComparedate:"Debe ser menor a la fecha de Fin"		
				},
				fechaFin:{
					required:"Se debe ingresar una Fecha de Fin",
					dpDate:"Solo Fechas",	
					dpComparedate:"Debe ser mayor a la fecha de Inicio"
				},			
				fechaProxima:{
					required:"Se debe ingresar una Fecha de Proxima",
					dpDate:"Solo Fechas",	
					dpComparedate:"Debe ser menor a la fecha Fin"				
				},
				kilometrajeActual:{
					required:"Debe ingresar un kilometraje actual",
					DecKilRegex:"S�lo decimales ",
					minlength:"Tiene que tener 9 d�gitos como minimo",
					maxlength:"Tiene que tener 3 d�gitos como maximo",	
				},
				kilometrajeProximo:{
					required:"Debe ingresar un kilometraje proximo",
					DecKilRegex:" Solo decimales",
					maxlength:"Tiene que tener 9 digitos como maximo",
					minlength:"Tiene como minimo 3 digito como minimo"				
				}
				
			},			
			submitHandler: function(form){
				$.ajax({
			   		url: 'ajaxEditInformacionVehiculo',
			   		type: 'post',
			   		dataType: 'json',
			   		data: $('#frmEdicionVehiculo').serialize(),
			   		success: function(vehiculo){
			   			IniciarInfoVehiculo(vehiculo);
			 			$('.vistaInformacion').show();
			 			$('.edicionInformacion').hide();
			 			$('#btnVerInformacion').hide();
			 			$('#btnVerEdicion').show();
			   		}
			   	});
			}		
		});
	});
		</script>
<script type="text/javascript"></script>
<script>
	$(document).ready(function(e) {		
		var idrevision = $('#spnIdRevision').text();
		inicioConsulta(idrevision);
		var nfechaInicio = 'txtFechaInicio';
		cargarFechaRevis(nfechaInicio);
		var nfechaFin = 'txtFechaFin';
		cargarFechaRevis(nfechaFin);
		var nProximaRev = 'txtProximaRevision';
		cargarFechaRevis(nProximaRev);
		inicioConsultaEmpleadosRevision(idrevision);
		inicioConsultaFallasRevision(idrevision);
	});

	function EditInformacionRevision(){
		$.ajax({
	   		url: 'ajaxEditInformacionRevision',
	   		type: 'post',
	   		dataType: 'json',
	   		data: $('#frmEdicionRevision').serialize(),
	   		success: function(revision){
	   			IniciarInfoRevision(revision);
	 			$('.vistaInformacion').show();
	 			$('.edicionInformacion').hide();
	 			$('#btnVerInformacion').hide();
	 			$('#btnVerEdicion').show();
	   		}
	   	});
	}
	function inicioConsulta(idrevision) {
		$.ajax({
					url : 'getInformacionRevision-' + idrevision,
					type : 'POST',
					dataType : 'json',
					data : '',
					success : function(revision) {
						IniciarInfoRevision(revision);
						removeNulls();
					}
				});
	}
	
	function IniciarInfoRevision(revision){
		//Vista de Informacion
		
		
		$('#spnCostoTotal').text(revision.costoTotal);
		$('#spnFechaInicio').text(revision.fechaInicio);
		$('#spnFechaFin').text(revision.fechaFin);
		$('#spnFechaProxima').text(revision.fechaProxima);
		$('#spnKilometrajeActual').text(revision.kilometrajeActual);
		$('#spnKilometrajeProximo').text(revision.kilometrajeProximo);
		
		$('#spnColorGeneral').text(revision.color);
		$('#spnNumeroPlacaGeneral').text(revision.numeroPlaca);
		$('#spnFabricacionGeneral').text(revision.fabricacion);
		$('#spnMarca').text(revision.nombreMarca);
		$('#spnModelo').text(revision.nombreModelo);
		
		$('#spnCostoTotal2').text(revision.costoTotal);
		$('#spnFechaInicio2').text(revision.fechaInicio);
		$('#spnFechaFin2').text(revision.fechaFin);
		$('#spnFechaProxima2').text(revision.fechaProxima);
		$('#spnKilometrajeActual2').text(revision.kilometrajeActual);
		$('#spnKilometrajeProximo2').text(revision.kilometrajeProximo);
		
		$('#spnColorGeneral2').text(revision.color);
		$('#spnNumeroPlacaGeneral2').text(revision.numeroPlaca);
		$('#spnFabricacionGeneral2').text(revision.fabricacion);
		$('#spnMarca2').text(revision.nombreMarca);
		$('#spnModelo2').text(revision.nombreModelo);
		
		//Vista de Edicion
	    $('#txtVehiculo').val(revision.idVehiculo);
		$('#txtRevision').val(revision.idRevision);
		$('#txtCostoTotal').val(revision.costoTotal);
		$('#txtFechaInicio').val(revision.fechaInicio);
		$('#txtFechaFin').val(revision.fechaFin);
		$('#txtProximaRevision').val(revision.fechaProxima);
		$('#txtKilometrajeActual').val(revision.kilometrajeActual);
		$('#txtKilometrajeProximo').val(revision.kilometrajeProximo);

	}	
	
	function ExtractInformacion(){
		$('.vistaInformacion').hide();
		$('.edicionInformacion').show();
		$('#btnVerInformacion').show();
		$('#btnVerEdicion').hide();
	}
	
	function ExtractInformacion2(){
		$('.vistaInformacion2').hide();
		$('.edicionInformacion2').show();
		$('#btnVerInformacion2').show();
		$('#btnVerEdicion2').hide();
	}
	
	
	function ExtractInformacion3(){
		$('.vistaInformacion3').hide();
		$('.edicionInformacion3').show();
		$('#btnVerInformacion3').show();
		$('#btnVerEdicion3').hide();
	} 
	
	function ExtractInformacion3(){
		$('.vistaInformacion4').hide();
		$('.edicionInformacion4').show();
		$('#btnVerInformacion4').show();
		$('#btnVerEdicion4').hide();
	} 
	function inicioConsultaEmpleadosRevision(idRevision){
		var filas = '';
		var columnas = '';	
	    $.ajax({
	 		url: 'getEmpleadoRevision-'+idRevision,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(empleados){
	 			
	 			$.each(empleados, function(i, empleado){
	 				arregloAsignados.push(empleado.idEmpleado);
	 				filas = filas +'<tr class="">'+
	 				'<td class="center"><a id="empleado_"'+i+'" href="toEmpleadoDetalle-'+empleado.idEmpleado+'">EMP-'+empleado.idEmpleado+'</a></td>'+
	 				'<td class="center">'+empleado.nombre+'</td>'+
					'<td class="center">'+empleado.apellidoPaterno+'</td>'+
					'<td class="center">'+empleado.apellidoMaterno+'</td>'+
					'<td class="center">'+empleado.dni+'</td>'+
					'<td class="center">'+empleado.sexo+'</td>'+
					'<td class="center">'+empleado.telefono+'</td>'+
					'<td class="center">'+empleado.nombreCargo+'</td>'+
					'<td class="center">'+empleado.nombreEspecialidad+'</td>'+
					'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+i+'"><i class="fa fa-times"></i></button></td>'+
					'</tr>';
				});		        
	 		},
	 		complete: function() {
	 			columnas = columnas + 
	 				'<th class="center">Id</th>'+
	 				'<th class="center">Nombre</th>'+
	 				'<th class="center">Apellido Paterno</th>'+
					'<th class="center">Apellido Materno</th>'+
					'<th class="center">DNI</th>'+
					'<th class="center">Sexo</th>'+
					'<th class="center">Telefono</th>'+
					'<th class="center">Nombre Cargo</th>'+
					'<th class="center">Nombre Especialidad</th>'+
					'<th class="center">Eliminar</th>';
				//realizarTabla2('EmpRev',columnas,filas);
				//$('#EmpRev').append(filas);
				var id = 'EmpRev';
				var contenido = '';
				$("#spnResultList_"+id).empty();
	
				contenido = contenido + '<table cellpadding="0" cellspacing="0" border="0" class="display dataTable" id="example_'+id+'"> '+
						' <thead class="tableGri"> '+
				            '<tr role="row">'+
				            	columnas+							                            
				            '</tr>'+
				        '</thead> '+
				        '<tbody id="'+id+'">';
				contenido = contenido + filas;   
				contenido = contenido + '</tbody>'+
						'</table> ';
				
				$("#spnResultList_"+id).append(contenido);
				//realizarTabla(columnas,filas);
	 			removeNulls();
	 			inicioConsultaEmpleados();
	  		}
	 	});
	}
	
	function inicioConsultaRepuestoRevision(idRevision){
		var filas = '';
		var columnas = '';	
	    $.ajax({
	 		url: 'getRepuestoRevision-'+idRevision,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(repuestos){
	 			
	 			$.each(repuestos, function(i, repuesto){
	 				arregloAsignados.push(repuesto.idRepuesto);
	 				filas = filas +'<tr class="">'+
	 				//'<td class="center"><a id="revision"'+i+'" href="toRevisionDetalle-'+revision.idRevision+'">REP-'+revision.idRevision+'</a></td>'+
	 				'<td class="center">'+repuesto.nombre+'</td>'+
					'<td class="center">'+repuesto.comentario+'</td>'+
					'<td class="center">'+repuesto.nombreRepuesto+'</td>'+
					'<td class="center">'+repuesto.costoUnitario+'</td>'+
					'<td class="center">'+repuesto.costoTotal+'</td>'+
					'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+i+'"><i class="fa fa-times"></i></button></td>'+
					'</tr>';
				});		        
	 		},
	 		complete: function() {
	 			columnas = columnas + 
	 				'<th class="center">Id</th>'+
	 				'<th class="center">Comentario</th>'+
	 				'<th class="center">Nombre Respuesto</th>'+
	 				'<th class="center">Costo Unitario</th>' +
					'<th class="center">Costo Total</th>';
				
				var id = 'RepRev';
				var contenido = '';
				$("#spnResultList_"+id).empty();
	
				contenido = contenido + '<table cellpadding="0" cellspacing="0" border="0" class="display dataTable" id="example_'+id+'"> '+
						' <thead class="tableGri"> '+
				            '<tr role="row">'+
				            	columnas+							                            
				            '</tr>'+
				        '</thead> '+
				        '<tbody id="'+id+'">';
				contenido = contenido + filas;   
				contenido = contenido + '</tbody>'+
						'</table> ';
				
				$("#spnResultList_"+id).append(contenido);
	 			removeNulls();
	 			inicioConsultaRepuesto();
	  		}
	 	});
		
	}
	function inicioConsultaFallasRevision(idRevision){
		var filas = '';
		var columnas = '';	
	    $.ajax({
	 		url: 'getFallaRevision-'+idRevision,
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(fallas){
	 			$.each(fallas, function(i, falla){
	 				filas = filas +'<tr class="">'+
	 				//'<td class="center"><a id="falla"'+i+'" href="toEmpleadoDetalle-'+empleado.idEmpleado+'">EMP-'+empleado.idEmpleado+'</a></td>'+
	 				'<td class="center">FAL-'+falla.idFalla+'</td>'+
	 				'<td class="center">'+falla.descripcion+'</td>'+
					'<td class="center">'+falla.nombreTipoFalla+'</td>'+					
					'</tr>';
				});		        
	 		},
	 		complete: function() {
	 			columnas = columnas + 
	 				'<th class="center">Id</th>'+
	 				'<th class="center">Nombre</th>'+
	 				'<th class="center">Tipo de falla</th>';
				//realizarTabla2('EmpRev',columnas,filas);
				//$('#EmpRev').append(filas);
				var id = 'FalRev';
				var contenido = '';
				$("#spnResultList1_"+id).empty();
	
				contenido = contenido + '<table cellpadding="0" cellspacing="0" border="0" class="display dataTable" id="example_'+id+'"> '+
						' <thead class="tableGri"> '+
				            '<tr role="row">'+
				            	columnas+							                            
				            '</tr>'+
				        '</thead> '+
				        '<tbody id="'+id+'">';
				contenido = contenido + filas;   
				contenido = contenido + '</tbody>'+
						'</table> ';
				
				$("#spnResultList1_"+id).append(contenido);
				//realizarTabla(columnas,filas);
	 			removeNulls();
	  		}
	 	});
	} 

	
	function inicioConsultaEmpleados(){
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
		 				'<td class="center"><input id="chkEmp_'+empleado.idEmpleado+'" type="checkbox" onclick="updateState(this,'+ i +')"><input type="hidden" name="state"  id="state_'+i+'" value="'+empleado.estado+'" /></td>'+ 		
		 				'<td class="center"><a id="empleado_"'+i+'" href="toEmpleadoDetalle-'+empleado.idEmpleado+'">EMP-'+empleado.idEmpleado+'</a></td>'+
		 				'<td class="center">'+empleado.email+'<input id="change_'+i+'" type="hidden" name="change"></td>'+
						'<td class="center">'+empleado.dni+'<input type="hidden" name="id" value="'+empleado.idEmpleado+'" id="idEmp_'+i+'" /></td>'+
						'<td class="center">'+empleado.nombre+'</td>'+
						'<td class="center">'+empleado.apellidoPaterno+'</td>'+
						'<td class="center">'+empleado.apellidoMaterno+'</td>'+				
						'</tr>';
	 				
				}); 			
 				
	 		},
	 		complete: function() {
	 			columnas = columnas +
	 				'<th class="center">Estado</th>'+ 		
	 				'<th class="center">Id Empleado</th>'+
	 				'<th class="center">Email</th>'+
	 				'<th class="center">DNI</th>'+
					'<th class="center">Nombre</th>'+
					'<th class="center">Apellido Paterno</th>'+
					'<th class="center">Apellido Materno</th>';
				//realizarTabla2('Emp',columnas,filas);
				realizarTabla(columnas,filas);
				for(var x = 0; x < arregloAsignados.length;x++){
 					//alert(arregloAsignados[x]);
 					document.getElementById("chkEmp_"+arregloAsignados[x]).checked=true;
 					$("#chkEmp_"+arregloAsignados[x]).attr('disabled','disabled');
 				}
	 			removeNulls();
	  		}
	 	});
	}

	function updateState(source,i){
		   var state;
		   if(source.checked==true){
		    state="habilitado";
		   }
		   else{
		    state="deshabilitado";
		      }
		   $('#state_'+i).val(state);
		   $('#change_'+i).val(true);
	}

	
</script>

<script>
var contsave = 'first';
var cont ='first';
$(document).on('click','#btnAsignarEmpleados', function(e){
		var list_State = '';
		var list_IdEmp = '';
		list_isChanged = document.getElementsByName('change');
		  for (var x=0; x < list_isChanged.length; x++) {
			  if($('#change_'+x).val()==true || $('#change_'+x).val()=='true'){
				list_State += $('#state_'+x).val()+'_';
				list_IdEmp += $('#idEmp_'+x).val()+'_';
				$('#change_'+x).val('');
			  }
		 }
		$('#isState_list').val(list_State);
		$('#idEmpleado_list').val(list_IdEmp);	
		//alert(list_State);
		//alert(list_IdUsu);
		  var idrevisionAE = $('#spnIdRevision').text();
		  $.ajax({
			   url: 'asignarEmpleadosRevision-'+idrevisionAE,
			   type: 'post',
			   dataType: 'json',
			   data: $('#frmAdministrarEmpleadosRevision').serialize(),
			   complete: function() {
		   			//$.unblockUI();
		   		   idrevision = $('#spnIdRevision').text();
				   inicioConsultaEmpleadosRevision(idrevision);
		   	   },
			   success: function(enviados){
				   if(enviados != ""){
				    var msgASR = [];
				    $('#resultAsigEmp').hide();
				    var contactos = "";
					  $.each(enviados, function(z, env){
						  msgASR.push('Asignacion realizada a: ' + env);
						  contactos += 'Asignacion realizada a: ' +env+'<br>';
						  //alert(env);
					  });		
					if(msgASR.length>0){
						$('#resultAsigEmp').show();
						$('#mensajeAsignadosEmp').empty();
						$('#mensajeAsignadosEmp').append(contactos);
					}  
				   }
				}
		  });
  });
  
var contsave1 = 'first';
var cont1 ='first';
$(document).on('click','#btnEnviarInv2', function(e){
		var list_State1 = '';
		var list_IdFal = '';
		list_isChanged1 = document.getElementsByName('change');
		  for (var x=0; x < list_isChanged1.length; x++) {
			  if($('#change_'+x).val()==true || $('#change_'+x).val()=='true'){
				list_State1 += $('#state_'+x).val()+'_';
				list_IdFal += $('#idFal_'+x).val()+'_';
				$('#change_'+x).val('');
			  }
		 }
		$('#isState_list1').val(list_State1);
		$('#idFalla_list').val(list_IdFal);	
		//alert(list_State);
		//alert(list_IdUsu);
		  var idrevisionAE1 = $('#spnIdRevision').text();
		  $.ajax({
			   url: 'asignarFallasRevision-'+idrevisionAE1,
			   type: 'post',
			   dataType: 'json',
			   data: $('#frmAdministrarFallasRevision').serialize(),
			   complete: function() {
		   			//$.unblockUI();
		   	   },
			   success: function(enviados){
				   if(enviados != ""){
				    var msgASR = [];
				    $('#resultOk').hide();
				    var contactos = "";
					  $.each(enviados, function(z, env){
						  msgASR.push('Asignacion realizada a: ' + env);
						  contactos += 'Asignacion realizada a: ' +env+'<br>';
						  //alert(env);
					  });		
					if(msgASR.length>0){
						$('#resultOk').show();
						$('#mensajeEmails').empty();
						$('#mensajeEmails').append(contactos);
					}  
				   }
				}
		  });
  }); 

</script>

<body>
	<div id="wrapper">

		<jsp:include page="componentes/cabecera.jsp" />

		<jsp:include page="componentes/menu.jsp" />

		<div id="page-wrapper">

			<!-- TITULO -->
			<div class="row">

				<div class="col-lg-12">
					<div class="col-lg-4 col-lg-offset-8">
						<br>
						<div class="alert alert-danger" style="text-align: center;">Estado
							de revisi�n: En revisi�n</div>
					</div>

					<br></br>
				</div>

			</div>

			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Detalles generales de la revisi�n <span id="spnIdRevision"><c:out
								value="${idrevision}" /></span>
					</div>
					<div class="panel-body">
						<div class="col-lg-6">
							<h4>Datos de la revisi�n</h4>
							<br>
							<p class="text-primary">Costo Total:</p>
							<span id="spnCostoTotal"></span>
							<p class="text-primary">Fecha Inicio:</p>
							<span id="spnFechaInicio"></span>
							<p class="text-primary">Fecha Fin:</p>
							<span id="spnFechaFin"></span>
							<p class="text-primary">Fecha Pr�xima:</p>
							<span id="spnFechaProxima"></span>
							<p class="text-primary">Kilometraje Actual:</p>
							<span id="spnKilometrajeActual"></span>
							<p class="text-primary">Kilometraje Pr�ximo:</p>
							<span id="spnKilometrajeProximo"></span>

						</div>
						<div class="col-lg-6">
							<h4>Datos del veh�culo</h4>
							<br>
							<p class="text-primary">Numero de placa:</p>
							<span id="spnNumeroPlacaGeneral"></span>
							<p class="text-primary">A�o de Fabricacion:</p>
							<span id="spnFabricacionGeneral"></span>
							<p class="text-primary">Color:</p>
							<span id="spnColorGeneral"></span>
							<p class="text-primary">Marca:</p>
							<span id="spnMarca"></span>
							<p class="text-primary">Modelo:</p>
							<span id="spnModelo"></span>

						</div>
					</div>
				</div>
			</div>


			<div class="col-lg-12">
				<div class="panel panel-default">

					<!-- /.panel-heading -->
					<div class="panel-body">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs">
							<li class="active"><a href="#revision" data-toggle="tab">Revisi�n</a></li>
							<li class=""><a href="#vehiculo" data-toggle="tab">Veh�culo</a></li>
							<li class=""><a href="#repuestos" data-toggle="tab">Repuestos</a>
							</li>
							<li class=""><a href="#fallas" data-toggle="tab">Fallas</a>
							</li>
							<li class=""><a href="#comentarios" data-toggle="tab">Comentarios</a>
							</li>
							<li class=""><a href="#empleado" data-toggle="tab">Empleado</a>
							</li>
						</ul>

						<!-- Tab panes -->


						<div class="tab-content">

							<div class="tab-pane fade active in" id="revision">
								<div class="panel panel-default">
									<div class="panel-heading">
										Datos de la revisi�n
										<div class="pull-right">
											<div class="btn-group">
												<span id="btnVerEdicion"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="ExtractInformacion();">Editar</span> 
													<span id="btnVerInformacion"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="$('.vistaInformacion').show();$('.edicionInformacion').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();"
													style="display: none">Regresar</span>
											</div>
										</div>
									</div>

									<div class="panel-body">

										<div class="col-lg-12 vistaInformacion">
											<br>
											<div class="col-lg-4">
											<p class="text-primary">Id:</p>
							<span id="spnIdRevision"></span>
											<p class="text-primary">Costo Total:</p>
							<span id="spnCostoTotal2"></span>
							<p class="text-primary">Fecha Inicio:</p>
							<span id="spnFechaInicio2"></span>
							<p class="text-primary">Fecha Fin:</p>
							<span id="spnFechaFin2"></span>
							<p class="text-primary">Fecha Pr�xima:</p>
							<span id="spnFechaProxima2"></span>
							<p class="text-primary">Kilometraje Actual:</p>
							<span id="spnKilometrajeActual2"></span>
							<p class="text-primary">Kilometraje Pr�ximo:</p>
							<span id="spnKilometrajeProximo2"></span>												
											</div>											
										</div>
										<div class="col-lg-12 edicionInformacion" style="display: none;">
										<!-- BORRAR EN CASO DE ERROR -->
										
										<form role="form" id="frmEdicionRevision" commandName="revisionbean" style="width: 90%; padding-left: 10%;">
							<fieldset>						
								<div class="col-lg-6">	
								
								    <div class="form-group" style="display:none">
											<label>Revision</label> 
											<input id="txtRevision" class="form-control"
											 name="idRevision" placeholder="Revision"></input>
											 <input id="txtVehiculo" class="form-control"
											 name="idVehiculo" placeholder="Vehiculo"></input>
										</div> 					
									<div class="form-group" >
											<label> Costo Total </label> <input id="txtCostoTotal"
											class="form-control" name="costoTotal" placeholder="Costo total"></input>
										</div>
										
										<div class="form-group input-group">
											<label> Fecha de Inicio</label> <input id="txtFechaInicio"
												class="form-control" name="fechaInicio"
												placeholder="Fecha de Inicio"></input>
												<span class="input-group-btn">
												    <button class="btn btn-default fa fa-table fa-fw" type="button" style="margin-top:25px; height: 34px;" onclick="$('#txtFechaInicio').datepicker('show')"></button>
												</span>
										</div>
										
									 	<div class="form-group input-group" >
											<label> Fecha de Fin</label> <input id="txtFechaFin"
												class="form-control" name="fechaFin"
												placeholder="Fecha de Fin"></input>
												<span class="input-group-btn">
												    <button class="btn btn-default fa fa-table fa-fw" type="button" style="margin-top:25px; height: 34px;" onclick="$('#txtFechaFin').datepicker('show')"></button>
												</span>
										</div>
										 
										 
										<div class="form-group input-group" >
											<label> Pr�xima revisi�n</label> <input id="txtProximaRevision"
												class="form-control" name="fechaProxima"
												placeholder="Fecha pr�xima"></input>
												<span class="input-group-btn">
												    <button class="btn btn-default fa fa-table fa-fw" type="button" style="margin-top:25px; height: 34px;" onclick="$('#txtProximaRevision').datepicker('show')"></button>
												</span>
										</div>
										<div class="form-group">
											<label> Kilometraje Actual </label> <input id="txtKilometrajeActual"
											class="form-control" name="kilometrajeActual" placeholder="Kilometraje actual"></input>
										</div>
										<div class="form-group">
											<label> Kilometraje Pr�ximo </label> <input id="txtKilometrajeProximo"
											class="form-control" name="kilometrajeProximo" placeholder="Kilometraje pr�ximo"></input>
										</div>																				
																																																																				
																																					
									<!-- FINAL SEGUNDA COLUMNA -->
									<span class="btn btn-success" onclick="EditInformacionRevision();">Guardar</span>
									<span class="btn btn-danger" onclick="$('.vistaInformacion').show();$('.edicionInformacion').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();">Cancelar</span>
								</div>
																
								
										
							</fieldset>							
							</form>
										
										
										<!-- FIN  -->																			
										</div>
									</div>
								</div>

							</div>
							<div class="tab-pane fade" id="vehiculo">
									<p></p>
									<p>Dato 1:</p>
									<p>Dato 2:</p>
									<p>Dato 3:</p>
									<p>Dato 4:</p>
									<p>Continuar� ...</p>
									<p>...:</p>
								</div>
								<div class="tab-pane fade" id="repuestos">
									
									<div class="pull-right">
											<div class="btn-group">
												<span id="btnVerEdicion4"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="ExtractInformacion4();">Editar</span> 
													<span id="btnVerInformacion4"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="$('.edicionInformacion4').hide();$('.vistaInformacion4').show();$('#btnVerInformacion4').hide();$('#btnVerEdicion4').show();"
													style="display: none">Regresar</span>
											</div>
							   </div>
									<br>
								
								<div class="edicionInformacion4" style="display: none">
									<input class="btn btn-lg btn-success btn-block" type="button" style="width: 20%;" value="Asignar Repuesto" id="btnEnviarInv4"></input><br>
									<div id="spnResultList1" class="resultBox section summaryPane" "></div>
									<form id="frmAdministrarRepuestoRevision">		
									<input id="isState_list1" type="hidden" name="isStateList1"/>
									<input id="idRepuesto_list" type="hidden" name="idRepuestoList"/>
									</form>
									</div>
									<br><br>
									<div class="vistaInformacion4">
									<div id="spnResultList1_RepRev" class="resultBox section summaryPane"></div>
								
								</div>
								
								</div>
								<div class="tab-pane fade" id="fallas">
								
									<div class="pull-right">
											<div class="btn-group">
												<span id="btnVerEdicion3"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="ExtractInformacion3();">Editar</span> 
													<span id="btnVerInformacion3"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="$('.edicionInformacion3').hide();$('.vistaInformacion3').show();$('#btnVerInformacion3').hide();$('#btnVerEdicion3').show();"
													style="display: none">Regresar</span>
											</div>
							   </div>
									<br>
								
								<div class="edicionInformacion3" style="display: none">
									<input class="btn btn-lg btn-success btn-block" type="button" style="width: 20%;" value="Asignar Falla" id="btnEnviarInv2"></input><br>
									<div id="spnResultList1" class="resultBox section summaryPane" "></div>
									<form id="frmAdministrarFallasRevision">		
									<input id="isState_list1" type="hidden" name="isStateList1"/>
									<input id="idFalla_list" type="hidden" name="idFallaList"/>
									</form>
									</div>
									<br><br>
									<div class="vistaInformacion3">
									<div id="spnResultList1_FalRev" class="resultBox section summaryPane"></div>
								
								</div>
								</div>
								<div class="tab-pane fade" id="comentarios">
									<h4>Comentarios</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
								<div class="tab-pane fade" id="empleado">
								<div class="pull-right">
								
											<div class="btn-group">
												<span id="btnVerEdicion2"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="ExtractInformacion2();">Editar</span> 
													<span id="btnVerInformacion2"
													class="btn btn-default btn-xs dropdown-toggle"
													onclick="$('.edicionInformacion2').hide();$('.vistaInformacion2').show();$('#btnVerInformacion2').hide();$('#btnVerEdicion2').show();"
													style="display: none">Regresar</span>
											</div>
							   </div>
								
								<br>
								
								<div class="edicionInformacion2" style="display: none">
									<br>
									<input class="btn btn-lg btn-success btn-block" type="button" style="width: 20%;" value="Asignar Empleado" id="btnAsignarEmpleados"></input><br>
									<div class="alert alert-success alert-dismissable" id="resultAsigEmp" style="display:none">
		    							<button class="close" aria-hidden="true" data-dismiss="alert" type="button">�</button>
		    							<span id="mensajeAsignadosEmp"></span>
									</div>
									<br>
									<div id="spnResultList" class="resultBox section summaryPane"></div>
									<form id="frmAdministrarEmpleadosRevision">		
									<input id="isState_list" type="hidden" name="isStateList"/>
									<input id="idEmpleado_list" type="hidden" name="idEmpleadoList"/>
									</form>
									</div>
									<br><br>
									<div class="vistaInformacion2">
									<div id="spnResultList_EmpRev" class="resultBox section summaryPane"></div>
								
								</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
</div>
</div>

			</div>

		</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Revisión Detalle</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>
var arregloAsignadosEmp = [];
var arregloAsignadosFalla = [];
var arregloAsignadosRep = [];
$(function() {
	$('#frmEdicionRevision').validate({
		rules:{
			/* costoTotal:{
				required:true,
				DecRegex:true,
				maxlength:12,
				minlength:4
				
			}, */
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
			kilometrajeActualhdn:{
				required:true,
				number: true,
				maxlength:9,
				minlength:3					
			},
			kilometrajeProximohdn:{
				required:true,
				number: true,
				maxlength:9,
				minlength:3				
			}
			
		},
		messages:{
			costoTotal:{
				required:"Debe ingresar costo total",
				NumRegex:"Sólo números en el costo total",
				minlength:"Tiene que tener 12 dígitos en el costototal",
				maxlength:"Tiene que tener 4 dígitos en el costototal"
			},
			fechaInicio:{
				required:"Se debe ingresar una Fecha de Inicio",
				dpDate:"Solo Fechas",	
				dpComparedate:"Debe ser menor a la fecha de Fin",		
			},
			fechaFin:{
				required:"Se debe ingresar una Fecha de Fin",
				dpDate:"Solo Fechas",	
				dpComparedate:"Debe ser mayor a la fecha de Inicio",
			},			
			fechaProxima:{
				required:"Se debe ingresar una Fecha de Proxima",
				dpDate:"Solo Fechas",	
				dpComparedate:"Debe ser menor a la fecha Fin",				
			},
			kilometrajeActualhdn:{
				required:"Debe ingresar un kilometraje actual",
				DecKilRegex:"Sólo decimales ",
				minlength:"Tiene que tener 9 dígitos como minimo",
				maxlength:"Tiene que tener 3 dígitos como maximo",	
			},
			kilometrajeProximohdn:{
				required:"Debe ingresar un kilometraje proximo",
				DecKilRegex:" Solo decimales",
				maxlength:"Tiene que tener 9 digitos como maximo",
				minlength:"Tiene como minimo 3 digito como minimo",				
			}
			
		},			
		submitHandler: function(form){
			$('#txtKilometrajeActualhdn').val($('#txtKilometrajeActual').val().replace(/,/g, ''));
			$('#txtKilometrajeProximohdn').val($('#txtKilometrajeProximo').val().replace(/,/g, ''));
			//alert($('#txtKilometrajeActualhdn').val($('#txtKilometrajeActual').val().replace(/,/gi, '')));
			//alert($('#txtKilometrajeActualhdn').val());
			if($('#txtKilometrajeProximohdn').val() > $('#txtKilometrajeActualhdn').val()){
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
			}else{
				alert("Introducir un Kilometraje Proximo valido");
			}
			
		}		

});
    jQuery('#txtFechaInicio').datepicker({
    	dateFormat: "yy-mm-dd",  
		    beforeShow : function(){	 
		    	var date = $('#txtFechaFin').datepicker('getDate');
	    		date.setDate(date.getDate()-1);
		    jQuery( this ).datepicker('option','maxDate', date);
	        }
	    });		
    $("#txtFechaFin").datepicker({
    	
        dateFormat: "yy-mm-dd",       
        beforeShow : function(){
        	var date2 = $('#txtFechaInicio').datepicker('getDate');
    		date2.setDate(date2.getDate()+1);
            jQuery( this ).datepicker('option','minDate', date2 );                
        },

    });
    $('#txtProximaRevision').datepicker({
    	dateFormat: "yy-mm-dd",
    	beforeShow : function(){
    		var date3 = $('#txtFechaFin').datepicker('getDate');
    		date3.setDate(date3.getDate()+1);
            jQuery( this ).datepicker('option','minDate', date3 );
        }
    });	
})

</script>
<script>
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
	    }, " ");  */
		
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
		//Empleado por revision Ejemplo ya funcionando
		inicioConsultaEmpleadosRevision(idrevision);
		//Falla por Revision arreglar para que funcione
		inicioConsultaFallasRevision(idrevision);
		//Repuestos por Revision
		inicioConsultaRepuestoRevision(idrevision);
		removeNulls();
		
		tipoEntidad = 'revision';
		idEntidad = idrevision;
		$('#hdnIdEntidadc').val(idEntidad);
		$('#hdnTipoEntidadc').val(tipoEntidad);
		$('#hdnTipoEntidad').val(tipoEntidad);
		$('#hdnIdEntidad').val(idEntidad);
	});

	function EditInformacionRevision(){
		$('#frmEdicionRevision').submit();
		/* $.ajax({
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
	   	}); */
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
		
		$('#divReporte').html("<a target='_blank' href='verPDFRevision-"+revision.idRevision+"' ><img width='50' height='50' src='images/pdfReport.jpg'></a>");
		
		$('#spnidrevision').text(revision.idRevision);
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
	
	function ExtractInformacion3(){
		$('.vistaInformacion3').hide();
		$('.edicionInformacion3').show();
		$('#btnVerInformacion3').show();
		$('#btnVerEdicion3').hide();
		$('#resultOkF').hide();
		$('#resultOkFa3').hide();
		
	} 
	

</script>

<script>  
	//tab Repuesto por revision
	function ExtractInformacion4(){
		$('.vistaInformacion4').hide();
		$('.edicionInformacion4').show();
		$('#btnVerInformacion4').show();
		$('#btnVerEdicion4').hide();
		$('#resultOkR').hide();
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
	 				arregloAsignadosRep.push(repuesto.idRepuesto);
	 				filas = filas +'<tr class="">'+
	 				'<td class="center">REP-'+repuesto.idRepuesto+'</td>'+
	 				'<td class="center" id="filaIdR_'+i+'" style="display:none;">'+repuesto.idRepuesto+'</td>'+	 				
					'<td class="center">'+repuesto.nombre+'</td>'+
					'<td class="center">'+repuesto.nombreTipoRepuesto+'</td>'+
					'<td class="center" id="filaComentarior_'+i+'">'+repuesto.comentario+'</td>'+
					'<td class="center" id="filaCantidad_'+i+'">'+repuesto.cantidad+'</td>'+
					'<td class="center" id="filaCostoUnit_'+i+'">'+repuesto.costoUnitario+'</td>'+
					'<td class="center">'+repuesto.costo+'</td>'+
					'<td class="center"><button class="btn btn-success btn-circle" type="button" id="btnEdit_'+i+'" data-toggle="modal" data-target="#myModalER" onclick="mostrarEditarR('+i+','+idRevision+','+repuesto.idRepuesto+')"><i class="fa fa-list"></i></button></td>'+
					'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+i+'" data-toggle="modal" data-target="#myModalR" onclick="mostrarEliminarR('+i+','+idRevision+')"><i class="fa fa-times"></i></button></td>'+
					'</tr>';
				});		        
	 		},
	 		complete: function() {
	 			columnas = columnas + 
	 				'<th class="center">Codigo</th>'+
	 				'<th class="center" style="display:none;">IdRepuesto</th>'+	 				
	 				'<th class="center">Nombre Respuesto</th>'+
	 				'<th class="center">Tipo Respuesto</th>'+
	 				'<th class="center">Comentario</th>'+
	 				'<th class="center">Cantidad</th>'+
	 				'<th class="center">Costo Unitario</th>'+
	 				'<th class="center">Costo</th>'+
	 				'<th class="center">Editar</th>'+
					'<th class="center">Eliminar</th>';

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
				//realizarTabla(columnas,filas);
	 			removeNulls();
	 			inicioConsultaRepuestos();
	  		}
	 	});
		
	}

	function updateStateRep(source,i){
		$('#changeR_'+i).val(true);
		$("#cantidadS_"+i).attr('disabled',false);
		$("#costoUnitS_"+i).attr('disabled',false);
	}
	
	function inicioConsultaRepuestos(){
		var filas = '';
		var columnas = '';	
	    $.ajax({
	 		url: 'getRepuesto',
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(repuestos){
	 			$.each(repuestos, function(i, repuesto){
		 				filas = filas +'<tr class="">'+
		 				'<td class="center"><input id="chkRep_'+repuesto.idRepuesto+'" type="checkbox" onclick="updateStateRep(this,'+ i +')"></td>'+ 		
						'<td class="center">REP-'+repuesto.idRepuesto+'<input id="changeR_'+i+'" type="hidden" name="changeR"></td>'+
						'<td class="center">'+repuesto.nombre+'<input type="hidden" value="'+repuesto.idRepuesto+'" id="idRep_'+i+'" /></td>'+
						'<td class="center">'+repuesto.nombreTipoRepuesto+'</td>'+				
						'<td class="center"><input type="text" pattern="^[0-9\-\s]+$"  id="cantidadS_'+i+'" disabled="disabled"/></td>'+
						'<td class="center"><input type="number" pattern="[0-9]+([\.|,][0-9]+)?" step="any" id="costoUnitS_'+i+'" disabled="disabled"/></td>'+
						'</tr>';
		 				
				}); 			
 				
	 		},
	 		complete: function() {
	 			columnas = columnas +
	 				'<th class="center">Estado</th>'+ 		
	 				'<th class="center">Codigo</th>'+
	 				'<th class="center">Nombre</th>'+
					'<th class="center">Nombre Tipo Repuesto</th>'+
					'<th class="center">Cantidad</th>'+
					'<th class="center">Costo Unitario</th>';
					//
		 			var id = 'Rep';
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
		 			//
					
				for(var x = 0; x < arregloAsignadosRep.length;x++){
 					//alert(arregloAsignados[x]);
 					document.getElementById("chkRep_"+arregloAsignadosRep[x]).checked=true;
 					$("#chkRep_"+arregloAsignadosRep[x]).attr('disabled','disabled');
 				}
	 			removeNulls();
	  		}
	 	});
	}
		

	function mostrarEliminarR(ind,idRevision){
		$('#myModalLabel').empty();
		$('#myModalLabel').append('Eliminar Repuesto');
		$('#txtIdRep').val($('#filaIdR_'+ind).text());	
		$('#txtIdRev').val(idRevision);
		idRev = idRevision;
	}

	function eliminarRepuestoRevision(){
		
		var formElement = document.getElementById("frmEliminarRepuesto");
		var formData = new FormData(formElement);	
		$.ajax({
	   		url: 'eliminarRepuestoRevision',
	   		type: 'post',
	   		data:  formData,
			mimeType:"multipart/form-data",
			contentType: false,
		    cache: false,
			processData:false,
			beforeSend: function(){
				//$.blockUI({ message: $('#domMessage') });
		    },
	   		success: function(result){
	   			$('#resultOkR').hide();
				$('#resultFalse').hide();	
				//alert(result);
				var res  = ''+result;
	   			if(res == 'true'){   				
	   				//$('#resultOk').append('Se ha registrado correctamente');
	   				$('#resultOkR').show();
	   				$('#txtIdF').val('');
	   				arregloAsignadosRep = [];
	   				inicioConsultaRepuestoRevision(idRev);
	   				//inicioConsultaRepuestos();
	   			}else{
	   				$('#resultFalse').show();
	   				//$('#resultFalse').append('Se ha producido un error al registrarse');
	   			}
	   		}
	   	});

	}

	
	$(document).on('click','#btnAsignarRepuestos', function(e){
		var list_IdRep = '';
		var list_cantidadRep = '';
		var list_costoRepU = '';
		list_isChangedR = document.getElementsByName('changeR');
		  for (var x=0; x < list_isChangedR.length; x++) {
			  if($('#changeR_'+x).val()==true || $('#changeR_'+x).val()=='true'){
				list_IdRep += $('#idRep_'+x).val()+'_';
				list_cantidadRep += $('#cantidadS_'+x).val()+'_';
				list_costoRepU += $('#costoUnitS_'+x).val()+'_';
				$('#changeR_'+x).val('');
			  }
		 }
		$('#idRepuesto_list').val(list_IdRep);	
		$('#cantidadRep_list').val(list_cantidadRep);
		$('#costoRepU_list').val(list_costoRepU);
		  var idrevisionAE2 = $('#spnIdRevision').text();
		  $.ajax({
			   url: 'asignarRepuestoRevision-'+idrevisionAE2,
			   type: 'post',
			   dataType: 'json',
			   data: $('#frmAdministrarRepuestoRevision').serialize(),
			   complete: function() {
				   inicioConsultaRepuestoRevision(idrevisionAE2);
		   	   },
			   success: function(enviados){
				   if(enviados != ""){
					    var msgASR = [];
					    $('#resultAsigRep').hide();
					    var contactos = "";
						  $.each(enviados, function(z, env){
							  msgASR.push('Asignacion Repuesto realizada a: ' + env);
							  contactos += 'Asignacion Repuesto realizada a: ' +env+'<br>';
							  //alert(env);
						  });		
						if(msgASR.length>0){
							$('#resultAsigRep').show();
							$('#mensajeAsignadosRep').empty();
							$('#mensajeAsignadosRep').append(contactos);
						}  
					   }				   
				}
		  });
  }); 
	
</script>

<script>
//tab Fallas por Revisión
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
 				var imagen = '';
 				if(falla.urlImagen!=null){
 					imagen = '<a target="_blank"  href="'+falla.urlImagen+'"><img width="150" height="150" src="'+falla.urlImagen+'"></img></a>';
 				}
 				arregloAsignadosFalla.push(falla.idFalla);
 				filas = filas +'<tr class="">'+
 				'<td class="center">FAL-'+falla.idFalla+'</td>'+
 				'<td class="center" id="filaId_'+i+'" style="display:none;">'+falla.idFalla+'</td>'+
 				'<td class="center">'+falla.descripcion+'</td>'+
				'<td class="center">'+falla.nombreTipoFalla+'</td>'+
				'<td class="center">'+imagen+'</td>'+
				'<td class="center" id="filaComentario_'+i+'">'+falla.comentario+'</td>'+
				'<td class="center"><button class="btn btn-success btn-circle" type="button" id="btnEdit_'+i+'" data-toggle="modal" data-target="#myModalEF" onclick="mostrarEditar('+i+','+idRevision+','+falla.idFalla+')"><i class="fa fa-list"></i></button></td>'+
				'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+falla.idFalla+'" data-toggle="modal" data-target="#myModalF" onclick="mostrarEliminar('+i+','+idRevision+')"><i class="fa fa-times"></i></button></td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 				'<th class="center">Codigo</th>'+
 				'<th class="center" style="display:none;">IdFalla</th>'+
 				'<th class="center">Nombre</th>'+
 				'<th class="center">Tipo de falla</th>'+ 				
 				'<th class="center">Imagen</th>'+
 				'<th class="center">Comentario</th>'+
 				'<th class="center">Editar</th>'+
 				'<th class="center">Eliminar</th>';
			var id = 'FalRev';
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
			inicioConsultaFalla();
 			removeNulls();
  		}
 	});
} 

function mostrarEditarR(ind,idRevision,idRepuesto){
	$('#myModalLabelER').empty();
	$('#myModalLabelER').append('Editar Repuesto');
	$('#txtIdReRe').val($('#filaId_'+ind).text());
	$('#txtComentario1').val($('#filaComentarior_'+ind).text());
	$('#txtCantidad').val($('#filaCantidad_'+ind).text());
	$('#txtCostoUnitario').val($('#filaCostoUnit_'+ind).text());
	$('#txtIdRe4').val(idRevision);	
	$('#txtIdRep3').val(idRepuesto);
	
	idRev = idRevision;
}

function mostrarEditar(ind,idRevision,idFalla){
	$('#myModalLabelEF').empty();
	$('#myModalLabelEF').append('Editar Falla');
	$('#txtIdFaRe').val($('#filaId_'+ind).text());
	$('#txtComentario').val($('#filaComentario_'+ind).text());
	$('#txtIdRe3').val(idRevision);	
	$('#txtIdFa3').val(idFalla);	
	
	$('#fileimagen').val('');
	idRev = idRevision;
}

var idRev;

function mostrarEliminar(ind,idRevision){
	$('#myModalLabel').empty();
	$('#myModalLabel').append('Eliminar Falla');
	$('#txtIdF').val($('#filaId_'+ind).text());	
	$('#txtIdR').val(idRevision);
	idRev = idRevision;
}

function editarFallaRevision(){
	
	var formElement = document.getElementById("frmEditarFallaRevision");
	var formData = new FormData(formElement);	
	$.ajax({
   		url: 'editarFallaRevision',
   		type: 'post',
   		data:  formData,
		mimeType:"multipart/form-data",
		contentType: false,
	    cache: false,
		processData:false,
		beforeSend: function(){
			//$.blockUI({ message: $('#domMessage') });
	    },
   		success: function(result){
   			$('#resultOkFa3').hide();
			$('#resultFalse').hide();	
			//alert(result);
			var res  = ''+result;
   			if(res == 'true'){   				
   				//$('#resultOk').append('Se ha registrado correctamente');
   				$('#resultOkFa3').show();
   				$('#txtIdFaRe').val('');
   				arregloAsignadosFalla = [];
   				inicioConsultaFallasRevision(idRev);
   				//inicioConsultaFalla();
   			}else{
   				$('#resultFalse').show();
   				//$('#resultFalse').append('Se ha producido un error al registrarse');
   			}
   		}
   	});

}

function editarRepuestoRevision(){
	
	var formElement = document.getElementById("frmEditarRepuestoRevision");
	var formData = new FormData(formElement);	
	$.ajax({
   		url: 'editarRepuestoRevision',
   		type: 'post',
   		data:  formData,
		mimeType:"multipart/form-data",
		contentType: false,
	    cache: false,
		processData:false,
		beforeSend: function(){
			//$.blockUI({ message: $('#domMessage') });
	    },
   		success: function(result){
   			$('#resultOkFa3').hide();
			$('#resultFalse').hide();	
			//alert(result);
			var res  = ''+result;
   			if(res == 'true'){   				
   				//$('#resultOk').append('Se ha registrado correctamente');
   				$('#resultOkFa3').show();
   				$('#txtIdReRe').val('');   				
   				inicioConsultaRepuestoRevision(idRev);
   				//inicioConsultaFalla();
   			}else{
   				$('#resultFalse').show();
   				//$('#resultFalse').append('Se ha producido un error al registrarse');
   			}
   		}
   	});

}

function eliminarFallaRevision(){
	
	var formElement = document.getElementById("frmEliminarFalla");
	var formData = new FormData(formElement);	
	$.ajax({
   		url: 'eliminarFallaRevision',
   		type: 'post',
   		data:  formData,
		mimeType:"multipart/form-data",
		contentType: false,
	    cache: false,
		processData:false,
		beforeSend: function(){
			//$.blockUI({ message: $('#domMessage') });
	    },
   		success: function(result){
   			$('#resultOkF').hide();
			$('#resultFalse').hide();	
			//alert(result);
			var res  = ''+result;
   			if(res == 'true'){   				
   				//$('#resultOk').append('Se ha registrado correctamente');
   				$('#resultOkF').show();
   				$('#txtIdF').val('');
   				arregloAsignadosFalla = [];
   				inicioConsultaFallasRevision(idRev);
   				//inicioConsultaFalla();
   			}else{
   				$('#resultFalse').show();
   				//$('#resultFalse').append('Se ha producido un error al registrarse');
   			}
   		}
   	});

}
	
	function updateStateFallas(source,i){
		$('#changeF_'+i).val(true);
	}
	
	function inicioConsultaFalla(){
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
	 				'<td class="center"><input id="chkFalla_'+fal.idFalla+'" type="checkbox" onclick="updateStateFallas(this,'+ i +')"></td>'+
					'<td class="center">FALL-'+fal.idFalla+'<input id="changeF_'+i+'" type="hidden" name="changeF"></td>'+
					'<td class="center">'+fal.descripcion+'<input type="hidden" value="'+fal.idFalla+'" id="idFalla_'+i+'" /></td>'+
					'<td class="center">'+fal.nombreTipoFalla+'</td>'+
					'</tr>';
				});		        
	 		},
	 		complete: function() {
	 			columnas = columnas + 
	 			'<th class="center">Estado</th>'+ 	
	 			'<th class="center">Codigo</th>'+
	 			'<th class="center">Descripcion</th>'+
	 			'<th class="center">Tipo Falla</th>';
	 			
	 			//
	 			var id = 'Fallas';
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
	 			//
				for(var x = 0; x < arregloAsignadosFalla.length;x++){
					//alert(arregloAsignadosEmp[x]);
					document.getElementById("chkFalla_"+arregloAsignadosFalla[x]).checked=true;
					$("#chkFalla_"+arregloAsignadosFalla[x]).attr('disabled','disabled');
				}
	 			//realizarTabla(columnas,filas);
	 			removeNulls();
	  		}
	 	});
	}
	
	$(document).on('click','#btnAsignarFallas', function(e){
		var list_IdFal = '';
		list_isChanged1 = document.getElementsByName('changeF');
		  for (var x=0; x < list_isChanged1.length; x++) {
			  if($('#changeF_'+x).val()==true || $('#changeF_'+x).val()=='true'){
				list_IdFal += $('#idFalla_'+x).val()+'_';
				$('#change_'+x).val('');
			  }
		 }
		$('#idFalla_list').val(list_IdFal);	
		
		  var idrevisionAE1 = $('#spnIdRevision').text();
		  $.ajax({
			   url: 'asignarFallasRevision-'+idrevisionAE1,
			   type: 'post',
			   dataType: 'json',
			   data: $('#frmAdministrarFallasRevision').serialize(),
			   complete: function() {
		   			//$.unblockUI();
		   		   idrevision = $('#spnIdRevision').text();
		   		   inicioConsultaFallasRevision(idrevisionAE1);
		   	   },
			   success: function(enviados){
				   if(enviados != ""){
				    var msgASR = [];
				    $('#resultAsigFalla').hide();
				    var contactos = "";
					  $.each(enviados, function(z, env){
						  msgASR.push('Asignacion realizada a: ' + env);
						  contactos += 'Asignacion realizada a: ' +env+'<br>';
						  //alert(env);
					  });		
					if(msgASR.length>0){
						$('#resultAsigFalla').show();
						$('#mensajeAsignadosFalla').empty();
						$('#mensajeAsignadosFalla').append(contactos);
					}  
				   }
				}
		  });
  }); 
</script>

<script>
//ultimo tab Empleados por Revisión
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
	$("#nHorasE_"+i).attr('disabled',false);
}	
function ExtractInformacion2(){
	$('.vistaInformacion2').hide();
	$('.edicionInformacion2').show();
	$('#btnVerInformacion2').show();
	$('#btnVerEdicion2').hide();
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
 				arregloAsignadosEmp.push(empleado.idEmpleado);
 				filas = filas +'<tr class="">'+
 				'<td class="center"><a id="empleado_"'+i+'" href="toEmpleadoDetalle-'+empleado.idEmpleado+'">EMP-'+empleado.idEmpleado+'</a></td>'+
 				'<td class="center" id="filaIdE_'+i+'" style="display:none;">'+empleado.idEmpleado+'</td>'+
 				'<td class="center">'+empleado.nombre+'</td>'+
				'<td class="center">'+empleado.apellidoPaterno+'</td>'+
				'<td class="center">'+empleado.apellidoMaterno+'</td>'+
				'<td class="center">'+empleado.dni+'</td>'+
				'<td class="center">'+empleado.sexo+'</td>'+
				'<td class="center">'+empleado.telefono+'</td>'+
				'<td class="center">'+empleado.nombreCargo+'</td>'+
				'<td class="center">'+empleado.nombreEspecialidad+'</td>'+
				'<td class="center">'+empleado.nroHoras+'</td>'+
				'<td class="center">'+empleado.costo+'</td>'+
				'<td class="center"><button class="btn btn-danger btn-circle" type="button" id="btnDelete_'+i+'" data-toggle="modal" data-target="#myModalE" onclick="mostrarEliminarE('+i+','+idRevision+')"><i class="fa fa-times"></i></button></td>'+
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas + 
 				'<th class="center">Codigo</th>'+
 				'<th class="center">Nombre</th>'+
 				'<th class="center">Apellido Paterno</th>'+
				'<th class="center">Apellido Materno</th>'+
				'<th class="center">DNI</th>'+
				'<th class="center">Sexo</th>'+
				'<th class="center">Telefono</th>'+
				'<th class="center">Nombre Cargo</th>'+
				'<th class="center">Nombre Especialidad</th>'+
				'<th class="center">Nro. Horas</th>'+
				'<th class="center">Costo</th>'+
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

function mostrarEliminarE(ind,idRevision){
	$('#myModalLabel').empty();
	$('#myModalLabel').append('Eliminar Empleado');
	$('#txtIdEmp').val($('#filaIdE_'+ind).text());	
	$('#txtIdRev1').val(idRevision);
	idRev = idRevision;
}

function eliminarEmpleadoRevision(){
	
	var formElement = document.getElementById("frmEliminarEmpleado");
	var formData = new FormData(formElement);	
	$.ajax({
   		url: 'eliminarEmpleadoRevision',
   		type: 'post',
   		data:  formData,
		mimeType:"multipart/form-data",
		contentType: false,
	    cache: false,
		processData:false,
		beforeSend: function(){
			//$.blockUI({ message: $('#domMessage') });
	    },
   		success: function(result){
   			$('#resultOk1').hide();
			$('#resultFalse').hide();	
			//alert(result);
			var res  = ''+result;
   			if(res == 'true'){   				
   				//$('#resultOk').append('Se ha registrado correctamente');
   				$('#resultOk1').show();
   				$('#txtIdF').val('');
   				arregloAsignadosEmp = [];
   				inicioConsultaEmpleadosRevision(idRev);
   				//inicioConsultaEmpleados();
   			}else{
   				$('#resultFalse').show();
   				//$('#resultFalse').append('Se ha producido un error al registrarse');
   			}
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
					'<td class="center"><input type="text" id="nHorasE_'+i+'" disabled="disabled"/></td>'+
					'</tr>';
 				
			}); 			
				
 		},
 		complete: function() {
 			columnas = columnas +
 				'<th class="center">Estado</th>'+ 		
 				'<th class="center">Codigo</th>'+
 				'<th class="center">Email</th>'+
 				'<th class="center">DNI</th>'+
				'<th class="center">Nombre</th>'+
				'<th class="center">Apellido Paterno</th>'+
				'<th class="center">Apellido Materno</th>'+
				'<th class="center">Nro. Horas</th>';
			//realizarTabla2('Emp',columnas,filas);
			realizarTabla(columnas,filas);
			for(var x = 0; x < arregloAsignadosEmp.length;x++){
					//alert(arregloAsignadosEmp[x]);
					document.getElementById("chkEmp_"+arregloAsignadosEmp[x]).checked=true;
					$("#chkEmp_"+arregloAsignadosEmp[x]).attr('disabled','disabled');
			}
 			removeNulls();
  		}
 	});
}

var contsave = 'first';
var cont ='first';
$(document).on('click','#btnAsignarEmpleados', function(e){
		var list_State = '';
		var list_IdEmp = '';
		var list_Horas = '';
		list_isChanged = document.getElementsByName('change');
		  for (var x=0; x < list_isChanged.length; x++) {
			  if($('#change_'+x).val()==true || $('#change_'+x).val()=='true'){
				list_State += $('#state_'+x).val()+'_';
				list_IdEmp += $('#idEmp_'+x).val()+'_';
				list_Horas += $('#nHorasE_'+x).val()+'_';
				$('#change_'+x).val('');
			  }
		 }
		$('#isState_list').val(list_State);
		$('#idEmpleado_list').val(list_IdEmp);	
		$('#horas_list').val(list_Horas);
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
				   inicioConsultaEmpleadosRevision(idrevisionAE);
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
							de revisión: En revisión</div>
					</div>

					<br></br>
				</div>

			</div>

			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Detalles generales de la revisión <span id="spnIdRevision"><c:out
								value="${idrevision}" /></span>
					<div id="divReporte"></div>
					</div>
					
					<div class="panel-body">
						<div class="col-lg-6">
							<h4>Datos de la revisión</h4>
							<br>
						<!-- <p class="text-primary">Costo Total:</p>
							<span id="spnCostoTotal"></span>  -->
							<p class="text-primary">Fecha Inicio:</p>
							<span id="spnFechaInicio"></span>
							<p class="text-primary">Fecha Fin:</p>
							<span id="spnFechaFin"></span>
							<p class="text-primary">Fecha Próxima:</p>
							<span id="spnFechaProxima"></span>
							<p class="text-primary">Kilometraje Actual:</p>
							<span id="spnKilometrajeActual"></span>
							<p class="text-primary">Kilometraje Próximo:</p>
							<span id="spnKilometrajeProximo"></span>

						</div>
						<div class="col-lg-6">
							<h4>Datos del vehículo</h4>
							<br>
							<p class="text-primary">Numero de placa:</p>
							<span id="spnNumeroPlacaGeneral"></span>
							<p class="text-primary">Año de Fabricacion:</p>
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
							<li class="active"><a href="#revision" data-toggle="tab">INFORMACION</a></li>
							<li class=""><a href="#fallas" data-toggle="tab">FALLAS</a></li>
							<li class=""><a href="#repuestos" data-toggle="tab">REPUESTOS</a></li>							
							<li class=""><a href="#empleado" data-toggle="tab">EMPLEADOS</a></li>
							<li class=""><a href="#archivos" data-toggle="tab">ARCHIVOS</a></li>
							<li class=""><a href="#comentarios" data-toggle="tab">COMENTARIOS</a></li>							
						</ul>

						<!-- Tab panes -->


						<div class="tab-content">
								<jsp:include page="revisionDetalle/revisionInformacion.jsp"/>								
								<jsp:include page="revisionDetalle/revisionFallas.jsp"/>
								<jsp:include page="revisionDetalle/revisionRepuestos.jsp"/>								
								<jsp:include page="revisionDetalle/revisionEmpleado.jsp"/>							
								<jsp:include page="componentes/Archivos.jsp"/>
								<jsp:include page="componentes/Comentarios.jsp"/>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
</div>
</div>
<div class="panel-body">                            
                            <!-- Modal -->
                            <div class="modal fade" id="myModalF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabelF">Eliminar Falla</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<form role="form" id="frmEliminarFalla"
													method="post" commandName="fallarevision"
													style="width: 60%; margin-left: 20%;">				
													<fieldset>
													    <div>¿Eliminar a esta falla?</div>		
														<div class="form-group" style="display:none">
															<label> Id Falla</label> <input 
															class="form-control" name="idFalla" id="txtIdF"/>
														</div>
														<div class="form-group" style="display:none">
															<label> Id Revision</label> <input 
															class="form-control" name="idRevision" id="txtIdR"/>
														</div>
																									
														
														</p>
													</fieldset>
												</form>	
                                        
                                        
                                        </div>
                                        <div class="modal-footer">
                                        	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarFallaRevision();">Eliminar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#txtIdF').val('');$('#txtIdR').val('');">Cancelar</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            
                            
							
                        </div>
                        <div class="panel-body">                            
                            <!-- Modal -->
                            <div class="modal fade" id="myModalR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabelR">Eliminar Repuesto</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<form role="form" id="frmEliminarRepuesto"
													method="post" commandName="repuestorevision"
													style="width: 60%; margin-left: 20%;">				
													<fieldset>
													    <div>¿Eliminar a este repuesto?</div>		
														<div class="form-group" style="display:none">
															<label> Id Repuesto</label> <input 
															class="form-control" name="idRepuesto" id="txtIdRep"/>
														</div>
														<div class="form-group" style="display:none">
															<label> Id Revision</label> <input 
															class="form-control" name="idRevision" id="txtIdRev"/>
														</div>
																									
														
														</p>
													</fieldset>
												</form>	
                                        
                                        
                                        </div>
                                        <div class="modal-footer">
                                        	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarRepuestoRevision();">Eliminar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#txtIdRep').val('');$('#txtIdRev').val('');">Cancelar</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                    
							
                        </div>
                        
                        <div class="panel-body">                            
                            <!-- Modal -->
                            <div class="modal fade" id="myModalE" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabelE">Eliminar Empleado</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<form role="form" id="frmEliminarEmpleado"
													method="post" commandName="empleadorevision"
													style="width: 60%; margin-left: 20%;">				
													<fieldset>
													    <div>¿Eliminar a este empleado?</div>		
														<div class="form-group" style="display:none">
															<label> Id Empleado</label> <input 
															class="form-control" name="idEmpleado" id="txtIdEmp"/>
														</div>
														<div class="form-group" style="display:none">
															<label> Id Revision</label> <input 
															class="form-control" name="idRevision" id="txtIdRev1"/>
														</div>
																									
														
														</p>
													</fieldset>
												</form>	
                                        
                                        
                                        </div>
                                        <div class="modal-footer">
                                        	<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="eliminarEmpleadoRevision();">Eliminar</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#txtIdEmp').val('');$('#txtIdRev1').val('');">Cancelar</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                    
							
                        </div>


			</div>

		</div>
</body>
</html>

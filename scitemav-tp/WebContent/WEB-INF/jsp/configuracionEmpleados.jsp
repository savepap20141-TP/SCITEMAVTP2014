<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Configurar Empleados</title>
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
 				var checkHabilitado = '';
 				var valueCreado = '';
 				var valueHabilitado = '';
 				if(empleado.estado == "habilitado"){
 					checkHabilitado = 'checked';
 					valueHabilitado = 'Habilitado';
 				}
 				if(empleado.estado == "deshabilitado"){
 					checkHabilitado =  '';
 					valueHabilitado = 'Deshabilitado';
 				}
 				if(empleado.estado == "creado"){
 					checkHabilitado = '';
 					valueCreado = 'Nuevo Usuario';
 				}
 				
 				
 				filas = filas +'<tr class="">'+
 				'<td class="center">'+valueCreado+valueHabilitado+' <input type="checkbox" '+checkHabilitado+' onclick="updateState(this,'+ i +')"><input type="hidden" name="state"  id="state_'+i+'" value="'+empleado.estado+'" /></td>'+ 		
 				'<td class="center">'+empleado.email+'<input id="change_'+i+'" type="hidden" name="change"></td>'+
				'<td class="center">'+empleado.dni+'<input type="hidden" name="id" value="'+empleado.idUsuario+'" id="idUsu_'+i+'" /></td>'+
				'<td class="center">'+empleado.nombre+'</td>'+
				'<td class="center">'+empleado.apellidoPaterno+'</td>'+
				'<td class="center">'+empleado.apellidoMaterno+'</td>'+				
				'</tr>';
			});		        
 		},
 		complete: function() {
 			columnas = columnas +
 				'<th class="center">Estado</th>'+ 			
 				'<th class="center">Email</th>'+
 				'<th class="center">DNI</th>'+
				'<th class="center">Nombre Cliente</th>'+
				'<th class="center">Apellido Paterno</th>'+
				'<th class="center">Apellido Materno</th>';
 			realizarTabla(columnas,filas);
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
$(document).on('click','#btnEnviarInv', function(e){
		var list_State = '';
		var list_IdUsu = '';
		list_isChanged = document.getElementsByName('change');
		  for (var x=0; x < list_isChanged.length; x++) {
			  if($('#change_'+x).val()==true || $('#change_'+x).val()=='true'){
				list_State += $('#state_'+x).val()+'_';
				list_IdUsu += $('#idUsu_'+x).val()+'_';
				$('#change_'+x).val('');
			  }
		 }
		$('#isState_list').val(list_State);
		$('#idUsuario_list').val(list_IdUsu);	
		//alert(list_State);
		//alert(list_IdUsu);
		  $.ajax({
			   url: 'enviarInvitaciones',
			   type: 'post',
			   dataType: 'json',
			   data: $('#frmAdministradorLogin').serialize(),
			   complete: function() {
		   			//$.unblockUI();
		   	   },
			   success: function(enviados){
				   if(enviados != ""){
				    var msgASR = [];
				    $('#resultOk').hide();
				    var contactos = "";
					  $.each(enviados, function(z, env){
						  msgASR.push('Invitacion enviada a: ' + env);
						  contactos += 'Invitacion enviada a: ' +env+'<br>';
						  //alert(env);
					  });		
					if(msgASR.length>0){
						$('#resultOk').show();
						$('#mensajeEmails').empty();
						$('#mensajeEmails').append(contactos);
					}  
				   }
				   inicioConsulta();
				}
		  });
  });

</script>

<body>
 <div id="wrapper">

		<jsp:include page="componentes/cabecera.jsp" />
		
		<jsp:include page="componentes/menu.jsp" />
		
		<div id="page-wrapper">
				            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Configurar Empleados</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lista de Empleados
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                            	<input class="btn btn-lg btn-success btn-block" type="button" style="width: 20%;" value="Habilitar Empleado" id="btnEnviarInv"></input><br>
                            	<div class="alert alert-success alert-dismissable" id="resultOk" style="display:none">
	    							<button class="close" aria-hidden="true" data-dismiss="alert" type="button">×</button>
	    							<span id="mensajeEmails"></span>
								</div>
								<br>
                            	<div id="spnResultList" class="resultBox section summaryPane"></div>
                            	<form id="frmAdministradorLogin">		
									<input id="isState_list" type="hidden" name="isStateList"/>
									<input id="idUsuario_list" type="hidden" name="idUsuarioList"/>
								</form>
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
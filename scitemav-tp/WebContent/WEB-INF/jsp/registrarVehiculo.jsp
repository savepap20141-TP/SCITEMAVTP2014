<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar Vehiculo</title>
<jsp:include page="componentes/head.jsp" />
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%></head>
<script>
$(document).ready(function(e){
	listarClientes();
	listarTipoVehiculos();
	listarModelos();
	listarMarcas();
});
</script>
<script>
$(document).ready(function(e){
	$.validator.addMethod("LetyNumRegex", function(value, element) {
        return this.optional(element) || /^[A-Z0-9\-\s]+$/i.test(value);
    }, " ");
	$.validator.addMethod("NumRegex", function(value, element) {
        return this.optional(element) || /^[0-9\-\s]+$/i.test(value);
    }, " ");
	$.validator.addMethod("LetRegex", function(value, element) {
        return this.optional(element) || /^[A-Z]+$/.test(value);
    }, "");
	$.validator.addMethod("DecRegex", function(value, element) {
        return this.optional(element) || /^(\d+|\d+,\d{1,4})$/.test(value);
    }, " ");
	$.validator.addMethod("NumPlacaRegex", function(value, element) {
        return this.optional(element) || /^[[A-Z0-9]{3}[-]{1}[A-Z0-9]{3}$/.test(value);
    }, " ");
	
	$('#frmRegistroVehiculo').validate({
		rules:{
			fabricacion:{
				required:true,
				NumRegex:true,
				maxlength:4,
				minlength:4
				
			},
			numeroMotor:{
				required:true,
				LetyNumRegex: true,
				maxlength:11,
				minlength:11
				
			},
			numeroCilindros:{
				required:true,
				NumRegex: true,
				maxlength:2,
				minlength:1				
			},
			numeroSerie:{
				required:true,
				LetyNumRegex: true,
				maxlength:17,
				minlength:17
			},
			color:{
				required:true,
				LetRegex: true,
				maxlength:25,
				minlength:4					
			},
			numeroPasajeros:{
				required:true,
				NumRegex: true,
				maxlength:2,
				minlength:1				
			},
			numeroAsientos:{
				required:true,
				NumRegex: true,
				maxlength:2,
				minlength:1		
			},
			pesoSeco:{
				required:true,
				NumRegex: true,
				maxlength:6,
				minlength:3	
			},
			numeroEjes:{
				required:true,
			},
			pesoBruto:{
				required:true,
				NumRegex: true,
				maxlength:6,
				minlength:3	
			},
			longitud:{
				required:true,
				DecRegex: true,
				maxlength:6,
				minlength:3				
			},
			altura:{
				required:true,
				DecRegex: true,
				maxlength:6,
				minlength:3		
			},
			ancho:{
				required:true,
				DecRegex: true,
				maxlength:6,
				minlength:3						
			},
			cargaUtil:{
				required:true,
				NumRegex: true,
				maxlength:6,
				minlength:3	
			},
			numeroRuedas:{
				required:true,
				NumRegex: true,
				maxlength:1,
				minlength:1		
			},
			numeroPlaca:{
				required:true,
				NumPlacaRegex: true,
				maxlength:7,
				minlength:7				
			},
			idCliente:{
				required:true,
			},
			idMarca:{
				required:true,
			},
			idModelo:{
				required:true,			
			},
			idTipoVehiculo:{
				required:true,	
			}			
		},
		messages:{
			fabricacion:{
				required:"Debe ingresar un año",
				NumRegex:"Sólo números en el año",
				minlength:"Tiene que tener 4 dígitos en el teléfono",
				maxlength:"Tiene que tener 4 dígitos en el teléfono"
			},
			numeroMotor:{
				required:"Debe ingresar un numero de Motor",
				LetyNumRegex:"Sólo números y letras mayusculas en el numero de Motor",
				minlength:"Tiene que tener 11 dígitos en el numero de Motor",
				maxlength:"Tiene que tener 11 dígitos en el numero de Motor"				
			},
			numeroCilindros:{
				required:"Debe ingresar un numero de Cilindros",
				NumRegex: "Solo numeros en numero de cilindros",
				maxlength:"Tiene que tener 2 digitos como maximo",
				minlength:"Tiene como minimo 1 digito"	
			},			
			numeroSerie:{
				required:"Debe ingresar un numero de serie",
				LetyNumRegex:"Sólo números y letras mayusculas en el numero de serie",
				minlength:"Tiene que tener 17 dígitos en el numero de serie",
				maxlength:"Tiene que tener 17 dígitos en el numero de serie"				
			},
			color:{
				required:"Debe ingresar un color",
				LetRegex:"Sólo letras mayuscula en color",
				minlength:"Tiene que tener 4 dígitos como minimo",
				maxlength:"Tiene que tener 25 dígitos como maximo",	
			},
			numeroPasajeros:{
				required:"Debe ingresar un pasajero",
				NumRegex:" Solo numeros en pasajeros",
				maxlength:"Tiene que tener 2 digitos como maximo",
				minlength:"Tiene como minimo 1 digito"				
			},
			numeroAsientos:{
				required:"Debe ingresar un numero de asientos",
				NumRegex:" Solo numeros en numero de asientos",
				maxlength:"Tiene que tener 2 digitos como maximo",
				minlength:"Tiene como minimo 1 digito"	
				
			},
			pesoSeco:{
				required:"Debe ingresar un peso seco",
				NumRegex: "solo numeros en peso seco",
				maxlength:"Tiene que tener 6 digitos como maximo",
				minlength:"Tiene que tener minimo 3 digitos"
			},
			numeroEjes:{
				required:"Seleccione un numero de eje",
			},
			pesoBruto:{
				required:"Debe ingresar un peso bruto",
				NumRegex: "solo numeros en peso bruto",
				maxlength:"Tiene que tener 6 digitos como maximo",
				minlength:"Tiene que tener minimo 3 digitos"
			},
			longitud:{
				required:"Debe ingresar una longitud",
				DecRegex: "solo numeros en decimales",
				maxlength:"Tiene que tener 6 digitos como maximo",
				minlength:"Tiene que tener minimo 3 digitos"				
			},
			altura:{
				required:"Debe ingresar una altura",
				DecRegex: "solo numeros en decimales",
				maxlength:"Tiene que tener 6 digitos como maximo",
				minlength:"Tiene que tener minimo 3 digitos"				
			},
			ancho:{
				required:"Debe ingresar una ancho",
				DecRegex: "solo numeros en decimales",
				maxlength:"Tiene que tener 6 digitos como maximo",
				minlength:"Tiene que tener minimo 3 digitos"				
			},
			cargaUtil:{
				required:"Debe ingresar una cargaUtil",
				NumRegex: "solo numeros en cargaUtil",
				maxlength:"Tiene que tener 6 digitos como maximo",
				minlength:"Tiene que tener minimo 3 digitos"
			},
			numeroRuedas:{
				required:"Debe ingresar un numero de Ruedas",
				NumRegex:"Solo numeros en numero de Ruedas",
				maxlength:"Tiene que tener 1 digitos",
				minlength:"Tiene que tener 1 digito"	
				
			},
			numeroPlaca:{
				required:"Debe ingresar un numero de Placa",
				NumPlacaRegex:"Solo numeros,letras mayusculas y guión en numero  de Placa",
				maxlength:"Tiene que tener 7 digitos",
				minlength:"Tiene que tener 7 digitos"			        
			},
			idCliente:{
				required:"Seleccione un Cliente",
			},
			idMarca:{
				required:"Seleccione una Marca",
			},
			idModelo:{
				required:"Seleccione un Modelo",				
			},
			idTipoVehiculo:{
				required:"Seleccione un Tipo de Vehiculo",	
			}
			
		},			
		submitHandler: function(form){
			form.submit();
		}		
	});
});

</script>
<script>

function listarClientes(){
	
	$.ajax({
 		url: 'getClientes',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(clientes){
 			$('#comboCliente').empty();
 			$('#comboCliente').append('<option value="">Seleccione su Cliente</option>');
 			$.each(clientes, function(i, cliente){
 				$('#comboCliente').append('<option value="'+cliente.idCliente+'">'+cliente.nombre+' '+cliente.apellidoPaterno+' - '+cliente.dni+'</option>');				
			});
 		}
 	});	
	
}

function listarTipoVehiculos(){
	
	$.ajax({
 		url: 'getTipoVehiculos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(tipovehiculos){
 			$('#comboTipovehiculo').empty();
 			$('#comboTipovehiculo').append('<option value="">Seleccione su Tipo de Vehiculo</option>');
 			$.each(tipovehiculos, function(i, tipovehiculo){
 				$('#comboTipovehiculo').append('<option value="'+tipovehiculo.idTipoVehiculo+'">'+tipovehiculo.nombre+'</option>');				
			});
 		}
 	});	
	
}

function listarModelos(){
	
	$.ajax({
 		url: 'getModelos',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(modelos){
 			$('#comboModelo').empty();
 			$('#comboModelo').append('<option value="">Seleccione su Modelo</option>');
 			$.each(modelos, function(i, modelo){
 				$('#comboModelo').append('<option value="'+modelo.idModelo+'">'+modelo.nombre+'</option>');				
			});
 		}
 	});	
	
}

function listarMarcas(){
	
	$.ajax({
 		url: 'getMarcas',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(marcas){
 			$('#comboMarca').empty();
 			$('#comboMarca').append('<option value="">Seleccione su Marca</option>');
 			$.each(marcas, function(i, marca){
 				$('#comboMarca').append('<option value="'+marca.idMarca+'">'+marca.nombre+'</option>');				
			});
 		}
 	});	
	
}
</script>
<body>
	<div id="wrapper">

		<jsp:include page="componentes/cabecera.jsp" />

		<jsp:include page="componentes/menu.jsp" />

		<div id="page-wrapper">

			<!-- TITULO -->
			<div class="row">
			
				<div class="col-lg-12">
					<br></br>
				</div>
				
			</div>
			
			<!-- FORM -->
			<div class="row">
			
			<div class="col-lg-12" style="width:90%;">
				<div class="panel panel-default">
					<div class="panel-heading">
					<i class="fa fa-bar-chart-o fa-fw"></i>Registro de nuevo vehículo
					</div>
					
					<div class="panel-body">
						<div class="row">
							<form role="form" id="frmRegistroVehiculo" action="registroVehiculo" name="RegistroVehiculo"
									method="post" commandName="vehiculobean" style="width: 90%; padding-left: 10%;">
							<fieldset>						
								<div class="col-lg-6">						
									<!-- PRIMERA COLUMNA -->
									
										<!--   <div class="form-group input-group">
											<label>DNI del cliente</label>
                                            <input type="text" class="form-control" id="txtDniCliente" name="idCliente" placeholder="DNI del Cliente">
                                            <span class="input-group-btn">
                                                <button style="margin-top:25px; height: 34px;" class="btn btn-default" type="button"><i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>	-->	
                                        
                                        <div class="form-group">
                                            <label>Cliente</label>
                                            <select class="form-control" id="comboCliente" name="idCliente">
                                                 <option value="">Seleccione el cliente</option>
                                            </select>
                                        </div>			
                                        
                                        <div class="form-group">
                                            <label>Marca</label>
                                            <select class="form-control" id="comboMarca" name="idMarca">
                                                 <option value="">Seleccione la marca</option>
                                            </select>
                                        </div>         

                                        <div class="form-group">
                                            <label>Modelo</label>
                                            <select class="form-control" id="comboModelo" name="idModelo">
                                                 <option value="">Seleccione el modelo</option>
                                            </select>
                                        </div>           
                                        
                                        <div class="form-group">
                                            <label>Tipo de Vehiculo</label>
                                            <select class="form-control" id="comboTipovehiculo" name="idTipoVehiculo">
                                            <option value="">Seleccione el tipo</option>
                                            </select>
                                        </div>                                                                                                                    																											
										
										<div class="form-group">
											<label>Año de fabricacion</label> 
											<input id="txtAño" class="form-control"
											 name="fabricacion" placeholder="Año"></input>
										</div>
										
										<div class="form-group">
											<label>Número de motor</label> 
											<input id="txtNumMotor" class="form-control"
											 name="numeroMotor" placeholder="Numero de motor"></input>
										</div>
										
										<div class="form-group">
											<label>Número de placa</label> 
											<input id="txtNumPlaca" class="form-control"
											 name="numeroPlaca" placeholder="Numero de placa"></input>
										</div>	
										
										<div class="form-group">
											<label style="margin-top: 7px; margin-bottom: 10px;" for="numeroEjes">Número de ejes</label><br>
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje1" value="1">1</label> 											
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje2" value="2">2</label>
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje3" value="3">3</label>
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje4" value="4">4</label>
											<label class="radio-inline"><input type="radio" name="numeroEjes" id="numEje5" value="5">5</label>
											 <br>
											<label class="error" for="numeroEjes"></label>
										</div>																																
										
										<div class="form-group">
											<label>Número de cilindros</label> 
											<input id="txtNumCilindros" class="form-control"
											 name="numeroCilindros" placeholder="Numero de cilindros"></input>
										</div>	
										
										<div class="form-group">
											<label>Número de serie</label> 
											<input id="txtNumSerie" class="form-control"
											 name="numeroSerie" placeholder="Numero de serie"></input>
										</div>																																																																																																					
											
									<!-- FINAL PRIMERA COLUMNA -->								
								</div>
								<div class="col-lg-6">
									<!-- SEGUNDA COLUMNA -->
									
										<div class="form-group">
											<label>Color</label> 
											<input id="txtColor" class="form-control"
											 name="color" placeholder="Color"></input>
										</div>									
										
										<div class="form-group">
											<label>Número de pasajeros</label> 
											<input id="txtNumPasajeros" class="form-control"
											 name="numeroPasajeros" placeholder="Numero de pasajeros"></input>
										</div>
										
										<div class="form-group">
											<label>Número de asientos</label> 
											<input id="txtNumAsientos" class="form-control"
											 name="numeroAsientos" placeholder="Numero de asientos"></input>
										</div>	
										
										<div class="form-group">
											<label>Peso seco</label> 
											<input id="txtPesoSeco" class="form-control"
											 name="pesoSeco" placeholder="Peso en seco(KG)"></input>
										</div>	
										
										<div class="form-group">
											<label>Peso bruto</label> 
											<input id="txtPesoBruto" class="form-control"
											 name="pesoBruto" placeholder="Peso bruto(KG)"></input>
										</div>	
										
										<div class="form-group">
											<label>Longitud</label> 
											<input id="txtLongitud" class="form-control"
											 name="longitud" placeholder="Longitud(m)"></input>
										</div>	
										
										<div class="form-group">
											<label>Altura</label> 
											<input id="txtAltura" class="form-control"
											 name="altura" placeholder="Altura(m)"></input>
										</div>	
										
										<div class="form-group">
											<label>Ancho</label> 
											<input id="txtAncho" class="form-control"
											 name="ancho" placeholder="Ancho(m)"></input>
										</div>		
										
										<div class="form-group">
											<label>Carga util</label> 
											<input id="txtCargaUtil" class="form-control"
											 name="cargaUtil" placeholder="Carga Util(KG)"></input>
										</div>											
										
										<div class="form-group">
											<label>Número de ruedas</label> 
											<input id="txtNumRuedas" class="form-control"
											 name="numeroRuedas" placeholder="Numero de ruedas"></input>
										</div>																																																										
																																					
									<!-- FINAL SEGUNDA COLUMNA -->
								</div>
																
								
										<input class="btn btn-lg btn-success btn-block" 
										type="submit" value="Registrar Vehiculo" style="width: 60%; margin-left: 20%; margin-top: 10%;"/>
										<p>
											<label class="error"><c:out value="${msg}" /></label>
										</p>
							</fieldset>							
							</form>
						</div>
					</div>
				</div>
			</div>			
			
			</div>

		</div>
	</div>	
</body>
</html>

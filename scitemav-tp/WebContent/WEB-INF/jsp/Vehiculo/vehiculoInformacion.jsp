<script>
	$(document).ready(function(e) {
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
	        return this.optional(element) || /^(\d+|\d+.\d{1,4})$/.test(value);
	    }, " ");
		$.validator.addMethod("NumPlacaRegex", function(value, element) {
	        return this.optional(element) || /^[[A-Z0-9]{3}[-]{1}[A-Z0-9]{3}$/.test(value);
	    }, " ");
		
		$('#frmEdicionVehiculo').validate({
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
				var formElement = document.getElementById("frmEdicionVehiculo");
				var formData = new FormData(formElement);
				$.ajax({
			   		url: 'ajaxEditInformacionVehiculo',
			   		type: "POST",
					data:  formData,
					mimeType:"multipart/form-data",
					contentType: false,
				    cache: false,
					processData:false,
					beforeSend: function(){
						//$.blockUI({ message: $('#domMessage') });
				    },
			   		success: function(vehiculo){
			   			//IniciarInfoVehiculo(vehiculo);
			 			var idvehiculo = $('#spnIdVehiculo').text();
						inicioConsulta(idvehiculo);
			   			$('.vistaInformacion').show();
			 			$('.edicionInformacion').hide();
			 			$('#btnVerInformacion').hide();
			 			$('#btnVerEdicion').show();
			   		}
			   	});
			}		
		});
		
		//
		var idvehiculo = $('#spnIdVehiculo').text();
		inicioConsulta(idvehiculo);
		listarTipoVehiculos();
		listarModelos();
		listarMarcas();
		removeNulls();
	});

	function EditInformacionVehiculo(){
		$('#frmEdicionVehiculo').submit();
	}
	function inicioConsulta(idvehiculo) {
		$.ajax({
					url : 'getInformacionVehiculo-' + idvehiculo,
					type : 'POST',
					dataType : 'json',
					data : '',
					success : function(vehiculo) {
						IniciarInfoVehiculo(vehiculo);
						removeNulls();
					}
				});
	}
	
	function IniciarInfoVehiculo(vehiculo){
		//Vista de Informacion
		$('#divReporte').html("<a target='_blank' href='verPDFVehiculo-"+vehiculo.idVehiculo+"' ><img width='50' height='50' src='images/pdfReport.jpg'></img></a>");
		$('#spnNumeroPlaca').text(vehiculo.numeroPlaca);
		$('#spnMarca').text(vehiculo.nombreMarca);
		$('#spnModelo').text(vehiculo.nombreModelo);
		$('#spnTipoVehiculo').text(vehiculo.nombreTipoVehiculo);
		$('#spnFabricacion').text(vehiculo.fabricacion);
		$('#spnNumeroMotor').text(vehiculo.numeroMotor);
		$('#spnColor').text(vehiculo.color);
		$('#spnNumeroEjes').text(vehiculo.numeroEjes);
		$('#spnNumeroRuedas').text(vehiculo.numeroRuedas);
		$('#spnNumeroCilindros').text(vehiculo.numeroCilindros);
		$('#spnNumeroSerie').text(vehiculo.numeroSerie);
		$('#spnNumeroPasajeros').text(vehiculo.numeroPasajeros);
		$('#spnNumeroAsientos').text(vehiculo.numeroAsientos);
		$('#spnPesoSeco').text(vehiculo.pesoSeco);
		$('#spnPesoBruto').text(vehiculo.pesoBruto);
		$('#spnLongitud').text(vehiculo.longitud);
		$('#spnAltura').text(vehiculo.altura);
		$('#spnAncho').text(vehiculo.ancho);
		$('#spnCargaUtil').text(vehiculo.cargaUtil);

		$('#spnColorGeneral').text(vehiculo.color);
		$('#spnNumeroPlacaGeneral').text(vehiculo.numeroPlaca);
		$('#spnFabricacionGeneral').text(vehiculo.fabricacion);
		$('#spnMarcaGeneral').text(vehiculo.nombreMarca);
		$('#spnModeloGeneral').text(vehiculo.nombreModelo);

		$('#spnDniCliente').text(vehiculo.dniCliente);
		$('#spnPrimerNombreCliente').text(
				vehiculo.primerNombreCliente);
		$('#spnApellidoPatCliente').text(
				vehiculo.apePaternoCliente);
		$('#spnApellidoMatCliente').text(
				vehiculo.apeMaternoCliente);
		$('#spnTelefonoCliente').text(vehiculo.telefonoCliente);
		$('#spnCelularCliente').text(vehiculo.celularCliente);
		
		//Vista de Edicion
		$('#txtCliente').val(vehiculo.idCliente);
		$('#txtVehiculo').val(vehiculo.idVehiculo);
		$('#comboMarca').val(vehiculo.idMarca);
		$('#comboModelo').val(vehiculo.idModelo);
		$('#comboTipovehiculo').val(vehiculo.idTipoVehiculo);
		$('#txtAño').val(vehiculo.fabricacion);
		$('#txtNumMotor').val(vehiculo.numeroMotor);
		$('#txtNumPlaca').val(vehiculo.numeroPlaca);
		$('#comboNumeroEjes').val(vehiculo.numeroEjes);
		$('#txtNumCilindros').val(vehiculo.numeroCilindros);
		$('#txtNumSerie').val(vehiculo.numeroSerie);
		$('#txtColor').val(vehiculo.color);
		$('#txtNumPasajeros').val(vehiculo.numeroPasajeros);
		$('#txtNumAsientos').val(vehiculo.numeroAsientos);
		$('#txtPesoSeco').val(vehiculo.pesoSeco);
		$('#txtPesoBruto').val(vehiculo.pesoBruto);
		$('#txtLongitud').val(vehiculo.longitud);
		$('#txtAltura').val(vehiculo.altura);
		$('#txtAncho').val(vehiculo.ancho);
		$('#txtCargaUtil').val(vehiculo.cargaUtil);
		$('#txtNumRuedas').val(vehiculo.numeroRuedas);
		
		//
		if(vehiculo.urlImagen!=null){
			$('#imagenVehiculo').empty();
			$("#imagenVehiculo").append("<a target='_blank'  href='"+vehiculo.urlImagen+"'><img width='150' height='150' src='"+vehiculo.urlImagen+"'></img></a>");
		}

		if(vehiculo.urlImagenMarca!=null){
			$('#imagenMarca').empty();
			$("#imagenMarca").append("<img width='70' height='70' src='"+vehiculo.urlImagenMarca+"'></img>");
		
		}
		
	}
	function listarTipoVehiculos(){
		
		$.ajax({
	 		url: 'getTipoVehiculos',
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(tipovehiculos){
	 			$('#comboTipovehiculo').empty();
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
	 			$.each(marcas, function(i, marca){
	 				$('#comboMarca').append('<option value="'+marca.idMarca+'">'+marca.nombre+'</option>');				
				});
	 		}
	 	});	
		
	}
	
	function ExtractInformacion(){
		$('.vistaInformacion').hide();
		$('.edicionInformacion').show();
		$('#btnVerInformacion').show();
		$('#btnVerEdicion').hide();
	}
</script>

<div class="tab-pane fade active in" id="vehiculo">
	<div class="panel panel-default">
		<div class="panel-heading">
			Datos de vehículo
			<div class="pull-right">
				<div class="btn-group">
					<span id="btnVerEdicion"
						class="btn btn-default btn-xs dropdown-toggle"
						onclick="ExtractInformacion();">Editar</span> <span
						id="btnVerInformacion"
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
					<p class="text-primary">Numero de placa:</p>
					<span id="spnNumeroPlaca"></span>
					<p class="text-primary">Marca:</p>
					<span id="spnMarca"></span>
					<p class="text-primary">Modelo:</p>
					<span id="spnModelo"></span>
					<p class="text-primary">Tipo de vehiculo:</p>
					<span id="spnTipoVehiculo"></span>
					<p class="text-primary">Año de fabricacion:</p>
					<span id="spnFabricacion"></span>
					<p class="text-primary">Motor:</p>
					<span id="spnNumeroMotor"></span>
					<p class="text-primary">Color:</p>
					<span id="spnColor"></span>
				</div>
				<div class="col-lg-4">
					<p class="text-primary">Numero de ejes:</p>
					<span id="spnNumeroEjes"></span>
					<p class="text-primary">Numero de ruedas:</p>
					<span id="spnNumeroRuedas"></span>
					<p class="text-primary">Numero de cilindros:</p>
					<span id="spnNumeroCilindros"></span>
					<p class="text-primary">Numero de serie:</p>
					<span id="spnNumeroSerie"></span>
					<p class="text-primary">Numero de pasajeros:</p>
					<span id="spnNumeroPasajeros"></span>
					<p class="text-primary">Numero de asientos:</p>
					<span id="spnNumeroAsientos"></span>
					<p class="text-primary">Peso seco:</p>
					<span id="spnPesoSeco"></span>
				</div>
				<div class="col-lg-4">
					<p class="text-primary">Peso bruto:</p>
					<span id="spnPesoBruto"></span>
					<p class="text-primary">Longitud:</p>
					<span id="spnLongitud"></span>
					<p class="text-primary">Altura:</p>
					<span id="spnAltura"></span>
					<p class="text-primary">Ancho:</p>
					<span id="spnAncho"></span>
					<p class="text-primary">Carga util:</p>
					<span id="spnCargaUtil"></span>
				</div>
				<div id="imagenVehiculo"><a target="_blank"  href="images/vehiculo_defecto.jpg"><img width="150" height="150" src="images/vehiculo_defecto.jpg"></img></a></div>
			</div>
			<div class="col-lg-12 edicionInformacion" style="display: none;">
				<!-- BORRAR EN CASO DE ERROR -->

				<form role="form" id="frmEdicionVehiculo" commandName="vehiculobean"
					style="width: 90%; padding-left: 10%;">
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
                                        </div>	
                                        
                                        <div class="form-group">
                                            <label>Cliente</label>
                                            <select class="form-control" id="comboCliente" name="idCliente">
                                                 <option value="">Seleccione el cliente</option>
                                            </select>
                                        </div>	-->
							<div class="form-group" style="display: none">
								<label>Cliente</label> <input id="txtCliente"
									class="form-control" name="idCliente" placeholder="Cliente"></input>
								<input id="txtVehiculo" class="form-control" name="idVehiculo"
									placeholder="Vehiculo"></input>
							</div>
							<div class="form-group">
								<label>Marca</label> <select class="form-control"
									id="comboMarca" name="idMarca">
									<option value="">Seleccione la marca</option>
								</select>
							</div>

							<div class="form-group">
								<label>Modelo</label> <select class="form-control"
									id="comboModelo" name="idModelo">
									<option value="">Seleccione el modelo</option>
								</select>
							</div>

							<div class="form-group">
								<label>Tipo de Vehiculo</label> <select class="form-control"
									id="comboTipovehiculo" name="idTipoVehiculo">
									<option value="">Seleccione el tipo</option>
								</select>
							</div>

							<div class="form-group">
								<label>Año de fabricacion</label> <input id="txtAño"
									class="form-control" name="fabricacion" placeholder="Año"></input>
							</div>

							<div class="form-group">
								<label>Número de motor</label> <input id="txtNumMotor"
									class="form-control" name="numeroMotor"
									placeholder="Numero de motor"></input>
							</div>

							<div class="form-group">
								<label>Número de placa</label> <input id="txtNumPlaca"
									class="form-control" name="numeroPlaca"
									placeholder="Numero de placa"></input>
							</div>

							<div class="form-group">
								<label style="margin-top: 7px; margin-bottom: 10px;">Número
									de ejes</label><br> <select class="form-control"
									id="comboNumeroEjes" name="numeroEjes">
									<option value="">Seleccione el Nro. de ejes</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>

							<div class="form-group">
								<label>Número de cilindros</label> <input id="txtNumCilindros"
									class="form-control" name="numeroCilindros"
									placeholder="Numero de cilindros"></input>
							</div>

							<div class="form-group">
								<label>Número de serie</label> <input id="txtNumSerie"
									class="form-control" name="numeroSerie"
									placeholder="Numero de serie"></input>
							</div>

							<!-- FINAL PRIMERA COLUMNA -->
						</div>
						<div class="col-lg-6">
							<!-- SEGUNDA COLUMNA -->

							<div class="form-group">
								<label>Color</label> <input id="txtColor" class="form-control"
									name="color" placeholder="Color"></input>
							</div>

							<div class="form-group">
								<label>Número de pasajeros</label> <input id="txtNumPasajeros"
									class="form-control" name="numeroPasajeros"
									placeholder="Numero de pasajeros"></input>
							</div>

							<div class="form-group">
								<label>Número de asientos</label> <input id="txtNumAsientos"
									class="form-control" name="numeroAsientos"
									placeholder="Numero de asientos"></input>
							</div>

							<div class="form-group">
								<label>Peso seco</label> <input id="txtPesoSeco"
									class="form-control" name="pesoSeco"
									placeholder="Peso en seco(KG)"></input>
							</div>

							<div class="form-group">
								<label>Peso bruto</label> <input id="txtPesoBruto"
									class="form-control" name="pesoBruto"
									placeholder="Peso bruto(KG)"></input>
							</div>

							<div class="form-group">
								<label>Longitud</label> <input id="txtLongitud"
									class="form-control" name="longitud" placeholder="Longitud(m)"></input>
							</div>

							<div class="form-group">
								<label>Altura</label> <input id="txtAltura" class="form-control"
									name="altura" placeholder="Altura(m)"></input>
							</div>

							<div class="form-group">
								<label>Ancho</label> <input id="txtAncho" class="form-control"
									name="ancho" placeholder="Ancho(m)"></input>
							</div>

							<div class="form-group">
								<label>Carga util</label> <input id="txtCargaUtil"
									class="form-control" name="cargaUtil"
									placeholder="Carga Util(KG)"></input>
							</div>

							<div class="form-group">
								<label>Número de ruedas</label> <input id="txtNumRuedas"
									class="form-control" name="numeroRuedas"
									placeholder="Numero de ruedas"></input>
							</div>
							
							<div class="form-group">
							    <label>Imagen de Vehiculo: </label>
							    <input type="file" name="file" id="fileimagen">
				             </div>

							<!-- FINAL SEGUNDA COLUMNA -->
						</div>


						<span class="btn btn-success" onclick="EditInformacionVehiculo();">Guardar</span>
						<span class="btn btn-danger"
							onclick="$('.vistaInformacion').show();$('.edicionInformacion').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();">
							Cancelar</span>
					</fieldset>
				</form>


				<!-- FIN  -->
			</div>
		</div>
	</div>

</div>
<script>
	$(document).ready(function(e) {
		$('#frmEdicionCliente').validate({
			rules:{
				telefono:{
					required:true,
					number:true,
					maxlength:9,
					minlength:7
					
				},
				celular:{
					required:true,
					number:true,
					maxlength:9,
					minlength:9
					
				},
				dni:{
					required:true,
					number:true,				
					maxlength:8,
					minlength:8
				},		
				email:{
					required: true,
				    email: true
					
				},
				fechaNacimiento:{				
					required: true,
				      dpDate: true,
				      //dpComparedate:'notbefore 1996-01-01'
				},
				nombre:{
					required: true,
				},
				apellidoPaterno:{
					required: true,			
				},
				apellidoMaterno:{
					required: true,
				},
				direccion:{
					required: true,
				},
				idDistrito:{
					required: true,
				},
				sexo:{
					required: true,
				}
			},
			messages:{
				telefono:{
					required:"Debe ingresar un tel�fono",
					number:"S�lo n�meros en el tel�fono",
					minlength:"Tiene que tener 7 d�gitos en el tel�fono",
					maxlength:"Tiene que tener 9 d�gitos en el tel�fono"
				},
				celular:{
					required:"Debe ingresar un celular",
					number:"S�lo n�meros en el celular",
					minlength:"Tiene que tener 9 d�gitos en el celular",
					maxlength:"Tiene que tener 9 d�gitos en el celular"
					
				},
				dni:{
					required:"Debe ingresar un DNI",
					number:"S�lo n�meros en el DNI",
					minlength:"Tiene que tener 8 d�gitos el DNI",
					maxlength:"Tiene que tener 8 d�gitos el DNI"
				},
				email:{
					required:"Debe ingresar un Email",
				    email:"Se necesita ingresar Email"	
				},
				fechaNacimiento:{
					required:"Se debe ingresar una Fecha",
					dpDate:"Solo Fechas",	
					dpComparedate:"Debe ser mayor igual de 18 a�os"
				},
				nombre:{
					required: "Se debe ingresar un nombre",
				},
				apellidoPaterno:{
					required: "Se debe ingresar un apellido parterno",			
				},
				apellidoMaterno:{
					required: "Se debe ingresar un apellido materno",
				},
				direccion:{
					required: "Se debe ingresar una direccion",
				},
				idDistrito:{
					required: "Seleccione un distrito",
				},
				sexo:{
					required: "Seleccione un tipo de sexo",
				}		
			
			},
		submitHandler: function(form){
			$.ajax({
		   		url: 'ajaxEditInformacionCliente',
		   		type: 'post',
		   		dataType: 'json',
		   		data: $('#frmEdicionCliente').serialize(),
		   		success: function(cliente){
		   			IniciarInfoCliente(cliente);
		 			$('.vistaInformacion').show();
		 			$('.edicionInformacion').hide();
		 			$('#btnVerInformacion').hide();
		 			$('#btnVerEdicion').show();
		   		}
		   	});
			
		}
		});
		
			listarDistritos();
			var idcliente = $('#spnIdCliente').text();
			inicioConsulta(idcliente);
			var nFechaNacimiento = 'txtFechaNacimiento';
			cargarFechaNac(nFechaNacimiento);
			tipoEntidad = 'cliente';
			idEntidad = idcliente;
			$('#hdnIdEntidadc').val(idEntidad);
			$('#hdnTipoEntidadc').val(tipoEntidad);
			$('#hdnTipoEntidad').val(tipoEntidad);
			$('#hdnIdEntidad').val(idEntidad);
			//inicioConsultaVehiculos(idcliente);
	});

	function EditInformacionCliente(){
		$('#frmEdicionCliente').submit();
	}
	
	function inicioConsulta(idcliente) {
		$.ajax({
					url : 'getInformacionCliente-' + idcliente,
					type : 'POST',
					dataType : 'json',
					data : '',
					success : function(cliente) {
						IniciarInfoCliente(cliente);
						removeNulls();
					}
				});
	}
	
	function IniciarInfoCliente(cliente){
		//Vista de Informacion		
		
		$('#spnNombre').text(cliente.nombre);
		$('#spnApellidoPaterno').text(cliente.apellidoPaterno);
		$('#spnApellidoMaterno').text(cliente.apellidoMaterno);
		$('#spnDni').text(cliente.dni);
		if(cliente.sexo=='M'){
			$('#spnSexo').text("MASCULINO");
		}else{
			$('#spnSexo').text("FEMENINO");
		}
		
		$('#spnFechaNacimiento').text(cliente.fechaNacimiento);
		$('#spnNombreDistrito').text(cliente.nombreDistrito);
		
		$('#spnDireccion').text(cliente.direccion);
		$('#spnTelefono').text(cliente.telefono);
		$('#spnCelular').text(cliente.celular);
		$('#spnEmail').text(cliente.email);
		
		//Informacion en el Primer Tab
		$('#spnNombreT').text(cliente.nombre);
		$('#spnApellidoPaternoT').text(cliente.apellidoPaterno);
		$('#spnApellidoMaternoT').text(cliente.apellidoMaterno);
		$('#spnDniT').text(cliente.dni);
		if(cliente.sexo=='M'){
			$('#spnSexoT').text("MASCULINO");
		}else{
			$('#spnSexoT').text("FEMENINO");
		}
		$('#spnFechaNacimientoT').text(cliente.fechaNacimiento);
		$('#spnNombreDistritoT').text(cliente.nombreDistrito);
		
		$('#spnDireccionT').text(cliente.direccion);
		$('#spnTelefonoT').text(cliente.telefono);
		$('#spnCelularT').text(cliente.celular);
		$('#spnEmailT').text(cliente.email);
		
		//Vista de Edicion
		$('#txtPassword').val(cliente.password);
		$('#txtEstado').val(cliente.estado);
		$('#txtCliente').val(cliente.idCliente);
		$('#txtPersona').val(cliente.idPersona);
		$('#txtNombre').val(cliente.nombre);
		$('#txtApellidoPaterno').val(cliente.apellidoPaterno);
		$('#txtApellidoMaterno').val(cliente.apellidoMaterno);
		$('#txtDni').val(cliente.dni);
		$('#txtSexo').val(cliente.sexo);
		$('#txtFechaNacimiento').val(cliente.fechaNacimiento);
		$('#comboDistrito').val(cliente.idDistrito);
		
		$('#txtDireccion').val(cliente.direccion);
		$('#txtTelefono').val(cliente.telefono);
		$('#txtCelular').val(cliente.celular);
		$('#txtEmail').val(cliente.email);
	
	}	
	
	function ExtractInformacion(){
		$('.vistaInformacion').hide();
		$('.edicionInformacion').show();
		$('#btnVerInformacion').show();
		$('#btnVerEdicion').hide();
	}
	
	function listarDistritos(){
		
		$.ajax({
	 		url: 'getDistritos',
	 		type: 'post',
	 		dataType: 'json',
	 		data: '',
	 		success: function(distritos){
	 			$('#comboDistrito').empty();
	 			$('#comboDistrito').append('<option value="">Seleccione su distrito</option>');
	 			$.each(distritos, function(i, distrito){
	 				$('#comboDistrito').append('<option value="'+distrito.idDistrito+'">'+distrito.nombre+'</option>');				
				});
	 		}
	 	});	
		
	}

</script>
<div class="tab-pane fade active in" id="cliente">
	<div class="panel panel-default">
		<div class="panel-heading">
			Datos del cliente
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
				<div class="col-lg-6">

					<h4>Datos del Cliente</h4>
					<br>
					<p class="text-primary">Nombre:</p>
					<span id="spnNombreT"></span>
					<p class="text-primary">Apellido Paterno:</p>
					<span id="spnApellidoPaternoT"></span>
					<p class="text-primary">Apellido Materno:</p>
					<span id="spnApellidoMaternoT"></span>
					<p class="text-primary">DNI:</p>
					<span id="spnDniT"></span>
					<p class="text-primary">Sexo:</p>
					<span id="spnSexoT"></span>
					<p class="text-primary">Fecha Nacimiento:</p>
					<span id="spnFechaNacimientoT"></span>
					<p class="text-primary">Nombre Distrito:</p>
					<span id="spnNombreDistritoT"></span>
				</div>
				<div class="col-lg-6">
					<h4>Datos de referencia Cliente</h4>
					<br>
					<p class="text-primary">Direccion:</p>
					<span id="spnDireccionT"></span>
					<p class="text-primary">Telefono:</p>
					<span id="spnTelefonoT"></span>
					<p class="text-primary">Celular:</p>
					<span id="spnCelularT"></span>
					<p class="text-primary">Email:</p>
					<span id="spnEmailT"></span>
				</div>
			</div>


			<div class="col-lg-12 edicionInformacion" style="display: none;">
				<!-- BORRAR EN CASO DE ERROR -->

				<form role="form" id="frmEdicionCliente" commandName="clientebean"
					style="width: 90%; padding-left: 10%;">
					<fieldset>
						<div class="col-lg-6">


							<!-- PRIMERA COLUMNA -->
							<div class="form-group" style="display: none">
								<label>Cliente</label> <input id="txtCliente"
									class="form-control" name="idCliente" placeholder="Cliente"></input>
								<input id="txtPersona" class="form-control" name="idPersona"
									placeholder="Persona"></input> <input id="txtEstado"
									class="form-control" name="estado" placeholder="Estado"></input>
								<input id="txtPassword" class="form-control" name="password"
									placeholder="Password"></input>
							</div>
							<div class="form-group">
								<label> DNI</label> <input id="txtDni" class="form-control"
									name="dni" placeholder="DNI"></input>
							</div>
							<div class="form-group">
								<label> Nombre</label> <input id="txtNombre"
									class="form-control" name="nombre" placeholder="Nombre"></input>
							</div>
							<div class="form-group">
								<label> Apellido Paterno</label> <input id="txtApellidoPaterno"
									class="form-control" name="apellidoPaterno"
									placeholder="Apellido Paterno"></input>
							</div>
							<div class="form-group">
								<label> Apellido Materno</label> <input id="txtApellidoMaterno"
									class="form-control" name="apellidoMaterno"
									placeholder="Apellido Materno"></input>
							</div>
							<div class="form-group">
								<label> Telefono</label> <input id="txtTelefono"
									class="form-control" name="telefono" placeholder="Telefono"></input>
							</div>
							<div class="form-group">
								<label> Celular</label> <input id="txtCelular"
									class="form-control" name="celular" placeholder="Celular"></input>
							</div>

							<!-- FINAL PRIMERA COLUMNA -->
						</div>
						<div class="col-lg-6">
							<!-- SEGUNDA COLUMNA -->
							<div class="form-group">
								<label> Sexo</label> <select class="form-control" id="txtSexo"
									name="sexo">
									<option value="">Seleccione su Sexo</option>
									<option value="M">Masculino</option>
									<option value="F">Femenino</option>
								</select>
							</div>

							<div class="form-group">
								<label> Direcci�n</label> <input id="txtDireccion"
									class="form-control" name="direccion" placeholder="Direcci�n"></input>
							</div>
							<div class="form-group">
								<label> Distrito</label> <select class="form-control"
									id="comboDistrito" name="idDistrito">
								</select>
							</div>
							<div class="form-group input-group">
								<label> Fecha de Nacimiento</label> <input
									id="txtFechaNacimiento" class="form-control"
									name="fechaNacimiento" placeholder="Fecha de Nacimiento"></input>
								<span class="input-group-btn">
									<button class="btn btn-default fa fa-table fa-fw" type="button"
										style="margin-top: 25px; height: 34px;"
										onclick="$('#txtFechaNacimiento').datepicker('show')"></button>
								</span>
							</div>
							<div class="form-group">
								<label> Email</label>
								<div class="form-group input-group">
									<span class="input-group-addon">@</span> <input id="txtEmail"
										class="form-control" name="email" placeholder="Email"></input>
								</div>
							</div>

						</div>
						<!-- FINAL SEGUNDA COLUMNA -->
						<span class="btn btn-success" onclick="EditInformacionCliente();">Guardar</span>
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
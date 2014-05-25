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
	$(document).ready(function(e) {
		
		var nfechaIni = 'txtFechaInicio';
		cargarFechaRevis(nfechaIni);
		
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
	        return this.optional(element) || /^(\d+|\d+.\d{7,4})$/.test(value);
	    }, " ");
		$.validator.addMethod("DecKilRegex", function(value, element) {
	        return this.optional(element) || /^(\d+|\d+.\d{5,3})$/.test(value);
	    }, " ");
		$.validator.addMethod("NumPlacaRegex", function(value, element) {
	        return this.optional(element) || /^[[A-Z0-9]{3}[-]{1}[A-Z0-9]{3}$/.test(value);
	    }, " ");
		
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
							<li class=""><a href="#fallas" data-toggle="tab">Veh�culo</a></li>
							<li class=""><a href="#repuestos" data-toggle="tab">Repuestos</a>
							</li>
							<li class=""><a href="#archivos" data-toggle="tab">Archivos</a>
							</li>
							<li class=""><a href="#comentarios" data-toggle="tab">Comentarios</a>
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
									<span class="btn btn-danger" onclick="$('.vistaInformacion').show();$('.edicionInformacion').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();">
									    Cancelar</span>
								</div>
																
								
										
							</fieldset>							
							</form>
										
										
										<!-- FIN  -->																			
										</div>
									</div>
								</div>

							</div>
							<div class="tab-pane fade" id="fallas">
									<p></p>
									<p>Dato 1:</p>
									<p>Dato 2:</p>
									<p>Dato 3:</p>
									<p>Dato 4:</p>
									<p>Continuar� ...</p>
									<p>...:</p>
								</div>
								<div class="tab-pane fade" id="repuestos">
									<h4>Repuestos</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
								<div class="tab-pane fade" id="archivos">
									<h4>Archivos</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
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
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>


			</div>

		</div>
</body>
</html>

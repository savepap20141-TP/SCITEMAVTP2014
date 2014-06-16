<div class="tab-pane fade active in" id="revision">
	<div class="panel panel-default">
		<div class="panel-heading">
			Datos de la revisión
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
					<p class="text-primary" style="display: none">Id:</p>
					<span id="spnidrevision" style="display: none"></span>
					<!--<p class="text-primary">Costo Total:</p> 
							<span id="spnCostoTotal2"></span>-->
					<p class="text-primary">Fecha Inicio:</p>
					<span id="spnFechaInicio2"></span>
					<p class="text-primary">Fecha Fin:</p>
					<span id="spnFechaFin2"></span>
					<p class="text-primary">Fecha Próxima:</p>
					<span id="spnFechaProxima2"></span>
					<p class="text-primary">Kilometraje Actual:</p>
					<span id="spnKilometrajeActual2"></span>
					<p class="text-primary">Kilometraje Próximo:</p>
					<span id="spnKilometrajeProximo2"></span>
				</div>
			</div>
			<div class="col-lg-12 edicionInformacion" style="display: none;">
				<!-- BORRAR EN CASO DE ERROR -->

				<form role="form" id="frmEdicionRevision" commandName="revisionbean"
					style="width: 90%; padding-left: 10%;">
					<fieldset>
						<div class="col-lg-6">

							<div class="form-group" style="display: none">
								<label>Revision</label> <input id="txtRevision"
									class="form-control" name="idRevision" placeholder="Revision"></input>
								<input id="txtVehiculo" class="form-control" name="idVehiculo"
									placeholder="Vehiculo"></input>
							</div>
							<!-- 	<div class="form-group" >
											<label> Costo Total </label> <input id="txtCostoTotal"
											class="form-control" name="costoTotal" placeholder="Costo total"></input>
										</div>  
										-->
							<div class="form-group input-group">
								<label> Fecha de Inicio</label> <input id="txtFechaInicio"
									class="form-control" name="fechaInicio"
									placeholder="Fecha de Inicio"></input> <span
									class="input-group-btn">
									<button class="btn btn-default fa fa-table fa-fw" type="button"
										style="margin-top: 25px; height: 34px;"
										onclick="$('#txtFechaInicio').datepicker('show')"></button>
								</span>
							</div>

							<div class="form-group input-group">
								<label> Fecha de Fin</label> <input id="txtFechaFin"
									class="form-control" name="fechaFin" placeholder="Fecha de Fin"></input>
								<span class="input-group-btn">
									<button class="btn btn-default fa fa-table fa-fw" type="button"
										style="margin-top: 25px; height: 34px;"
										onclick="$('#txtFechaFin').datepicker('show')"></button>
								</span>
							</div>


							<div class="form-group input-group">
								<label> Próxima revisión</label> <input id="txtProximaRevision"
									class="form-control" name="fechaProxima"
									placeholder="Fecha próxima"></input> <span
									class="input-group-btn">
									<button class="btn btn-default fa fa-table fa-fw" type="button"
										style="margin-top: 25px; height: 34px;"
										onclick="$('#txtProximaRevision').datepicker('show')"></button>
								</span>
							</div>
							<div class="form-group">
								<label> Kilometraje Actual </label> <input
									id="txtKilometrajeActual" class="form-control"
									name="kilometrajeActualhdn" placeholder="Kilometraje actual"></input>
								<input id="txtKilometrajeActualhdn" style="display: none"
									class="form-control" name="kilometrajeActual"
									placeholder="Kilometraje actual Hidden"></input>
							</div>
							<div class="form-group">
								<label> Kilometraje Próximo </label> <input
									id="txtKilometrajeProximo" class="form-control"
									name="kilometrajeProximohdn" placeholder="Kilometraje próximo"></input>
								<input id="txtKilometrajeProximohdn" style="display: none"
									class="form-control" name="kilometrajeProximo"
									placeholder="Kilometraje próximo"></input>
							</div>


							<!-- FINAL SEGUNDA COLUMNA -->
							<span class="btn btn-success"
								onclick="EditInformacionRevision();">Guardar</span> <span
								class="btn btn-danger"
								onclick="$('.vistaInformacion').show();$('.edicionInformacion').hide();$('#btnVerInformacion').hide();$('#btnVerEdicion').show();">Cancelar</span>
						</div>



					</fieldset>
				</form>


				<!-- FIN  -->
			</div>
		</div>
	</div>

</div>
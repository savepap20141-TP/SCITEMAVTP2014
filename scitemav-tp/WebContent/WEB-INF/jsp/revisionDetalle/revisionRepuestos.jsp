<div class="tab-pane fade" id="repuestos">
<div class="modal fade" id="myModalER" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabelER">Editar Repuesto</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="frmEditarRepuestoRevision" method="post"
						commandName="repuestorevisionbean" enctype="multipart/form-data"
						style="width: 30%; margin-left: 10%;">

						<fieldset>
							<div class="form-group" style="display: none">
								<label> Id RepuestoRevision</label> <input class="form-control"
									name="idRepuestoRevision" id="txtIdReRe" />
							</div>

							<div class="form-group" style="display: none">
								<label> Id Repuesto</label> <input class="form-control"
									name="idRepuesto" id="txtIdRep3" />
							</div>

							<div class="form-group" style="display: none">
								<label> Id Revision</label> <input class="form-control"
									name="idRevision" id="txtIdRe4" />
							</div>

							<div class="form-group">
								<label>Comentario</label>
								<textarea id="txtComentario1" class="form-control"
									name="comentario" placeholder="Comentario"></textarea>
							</div>
							
							<div class="form-group">
								<label>Cantidad</label>
								<textarea id="txtCantidad" class="form-control"
									name="cantidad" placeholder="Cantidad"></textarea>
							</div>
							
							<div class="form-group">
								<label>Costo unitario</label>
								<textarea id="txtCostoUnitario" class="form-control"
									name="costoUnitario" placeholder="Costo Unitario"></textarea>
							</div>


						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="editarRepuestoRevision();">Guardar</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="$('#txtIdReRe').val('');$('#txtComentario1').val('');$('#txtCantidad').val('');$('#txtCostoUnitario').val('');">Cancelar</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<br>
	<div class="alert alert-success alert-dismissable" id="resultOkR"
		style="display: none">
		<button class="close" aria-hidden="true" data-dismiss="alert"
			type="button">×</button>
		Se ha eliminado correctamente
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			Repuestos por Revisión
			<div class="pull-right">
				<div class="btn-group">
					<span id="btnVerEdicion4"
						class="btn btn-default btn-xs dropdown-toggle"
						onclick="ExtractInformacion4();">Editar</span> <span
						id="btnVerInformacion4"
						class="btn btn-default btn-xs dropdown-toggle"
						onclick="$('.edicionInformacion4').hide();$('.vistaInformacion4').show();$('#btnVerInformacion4').hide();$('#btnVerEdicion4').show();$('#resultOkR').hide();$('#resultAsigRep').hide();"
						style="display: none">Regresar</span>
				</div>
			</div>
		</div>

		<div class="panel-body">
			<div class="edicionInformacion4" style="display: none">
				<br> <input class="btn btn-lg btn-success btn-block"
					type="button" style="width: 20%;" value="Asignar Respuestos"
					id="btnAsignarRepuestos"></input><br>
				<div class="alert alert-success alert-dismissable"
					id="resultAsigRep" style="display: none">
					<button class="close" aria-hidden="true" data-dismiss="alert"
						type="button">×</button>
					<span id="mensajeAsignadosRep"></span>
				</div>
				<br>
				<div id="spnResultList_Rep" class="resultBox section summaryPane"
					style="overflow: auto;"></div>
				<form id="frmAdministrarRepuestoRevision">
					<input id="idRepuesto_list" type="hidden" name="idRepuestoList" />
					<input id="cantidadRep_list" type="hidden" name="cantidadRepuestoList" />
					<input id="costoRepU_list" type="hidden" name="costoRepuestoList" />
				</form>
			</div>
			<br>
			<br>
			<div class="vistaInformacion4">
				<div id="spnResultList_RepRev" class="resultBox section summaryPane"
					style="overflow: auto;"></div>
			</div>
		</div>

	</div>

</div>
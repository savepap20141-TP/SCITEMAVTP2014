
<div class="tab-pane fade" id="fallas">
	<div class="modal fade" id="myModalEF" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabelEF">Editar Falla</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="frmEditarFallaRevision" method="post"
						commandName="fallarevisionbean" enctype="multipart/form-data"
						style="width: 30%; margin-left: 10%;">

						<fieldset>
							<div class="form-group" style="display: none">
								<label> Id FallaRevision</label> <input class="form-control"
									name="idFallaRevision" id="txtIdFaRe" />
							</div>

							<div class="form-group" style="display: none">
								<label> Id Falla</label> <input class="form-control"
									name="idFalla" id="txtIdFa3" />
							</div>

							<div class="form-group" style="display: none">
								<label> Id Revision</label> <input class="form-control"
									name="idRevision" id="txtIdRe3" />
							</div>

							<div class="form-group">
								<label>Comentario</label>
								<textarea id="txtComentario" class="form-control"
									name="comentario" placeholder="Comentario"></textarea>
							</div>

							<div class="form-group">
								<label>Imagen de Falla: </label> <input type="file" name="file"
									id="fileimagen">
							</div>

						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="editarFallaRevision();">Guardar</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="$('#txtIdFaRe').val('');$('#txtComentario').val('');$('#fileimagen').val('');">Cancelar</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<br>
	<div class="alert alert-success alert-dismissable" id="resultOkFa3"
		style="display: none">
		<button class="close" aria-hidden="true" data-dismiss="alert"
			type="button">×</button>
		Se ha editado correctamente
	</div>
	<div class="alert alert-success alert-dismissable" id="resultOkF"
		style="display: none">
		<button class="close" aria-hidden="true" data-dismiss="alert"
			type="button">×</button>
		Se ha eliminado correctamente
	</div>

	<div class="panel panel-default">
		<div class="panel-heading">
			Fallas por Revisión
			<div class="pull-right">
				<div class="btn-group">
					<span id="btnVerEdicion3"
						class="btn btn-default btn-xs dropdown-toggle"
						onclick="ExtractInformacion3();">Editar</span> <span
						id="btnVerInformacion3"
						class="btn btn-default btn-xs dropdown-toggle"
						onclick="$('.edicionInformacion3').hide();$('.vistaInformacion3').show();$('#btnVerInformacion3').hide();$('#btnVerEdicion3').show();$('#resultOk1').hide();$('#resultAsigFalla').hide();"
						style="display: none">Regresar</span>
				</div>
			</div>
		</div>

		<div class="panel-body">
			<div class="edicionInformacion3" style="display: none">
				<br> <input class="btn btn-lg btn-success btn-block"
					type="button" style="width: 20%;" value="Asignar Falla"
					id="btnAsignarFallas"></input><br>
				<div class="alert alert-success alert-dismissable"
					id="resultAsigFalla" style="display: none">
					<button class="close" aria-hidden="true" data-dismiss="alert"
						type="button">×</button>
					<span id="mensajeAsignadosFalla"></span>
				</div>
				<br>
				<div id="spnResultList_Fallas" class="resultBox section summaryPane"
					style="overflow: auto;"></div>
				<form id="frmAdministrarFallasRevision">
					<input id="idFalla_list" type="hidden" name="idFallaList" />
				</form>
			</div>
			<br>
			<br>
			<div class="vistaInformacion3">
				<div id="spnResultList_FalRev" class="resultBox section summaryPane"
					style="overflow: auto;"></div>
			</div>
		</div>

	</div>

</div>
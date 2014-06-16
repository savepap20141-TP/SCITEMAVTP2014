<div class="tab-pane fade" id="repuestos">

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
				<div id="spnResultList_Rep" class="resultBox section summaryPane"></div>
				<form id="frmAdministrarRepuestoRevision">
					<input id="idRepuesto_list" type="hidden" name="idRepuestoList" />
					<input id="cantidadRep_list" type="hidden" name="cantidadRepuestoList" />
					<input id="costoRepU_list" type="hidden" name="costoRepuestoList" />
				</form>
			</div>
			<br>
			<br>
			<div class="vistaInformacion4">
				<div id="spnResultList_RepRev" class="resultBox section summaryPane"></div>
			</div>
		</div>

	</div>

</div>
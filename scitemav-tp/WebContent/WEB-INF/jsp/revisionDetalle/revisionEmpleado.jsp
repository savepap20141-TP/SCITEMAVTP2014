<div class="tab-pane fade" id="empleado">
<div class="modal fade" id="myModalEE" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabelER">Editar Empleado</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="frmEditarEmpleadoRevision" method="post"
						commandName="empleadorevisionbean" enctype="multipart/form-data"
						style="width: 30%; margin-left: 10%;">

						<fieldset>
							<div class="form-group" style="display: none">
								<label> Id EmpleadoRevision</label> <input class="form-control"
									name="idEmpleadoRevision" id="txtIdEmRe" />
							</div>

							<div class="form-group" style="display: none">
								<label> Id Empleado</label> <input class="form-control"
									name="idEmpleado" id="txtIdEmp3" />
							</div>

							<div class="form-group" style="display: none">
								<label> Id Revision</label> <input class="form-control"
									name="idRevision" id="txtIdRe5" />
							</div>

							<div class="form-group">
								<label>Nro. Horas</label>
								<textarea id="txtNroHoras" class="form-control"
									name="nroHoras" placeholder="Nro Horas"></textarea>
							</div>
							
							


						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="editarEmpleadoRevision();">Guardar</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="$('#txtIdEmRe').val('');$('#txtNroHoras').val('');">Cancelar</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			Empleados por Revisión
			<div class="pull-right">
				<div class="btn-group">
					<span id="btnVerEdicion2"
						class="btn btn-default btn-xs dropdown-toggle"
						onclick="ExtractInformacion2();">Editar</span> <span
						id="btnVerInformacion2"
						class="btn btn-default btn-xs dropdown-toggle"
						onclick="$('.edicionInformacion2').hide();$('.vistaInformacion2').show();$('#btnVerInformacion2').hide();$('#btnVerEdicion2').show();"
						style="display: none">Regresar</span>
				</div>
			</div>
		</div>

		<br>

		<div class="edicionInformacion2" style="display: none">
			<br> <input class="btn btn-lg btn-success btn-block"
				type="button" style="width: 20%;" value="Asignar Empleado"
				id="btnAsignarEmpleados"></input><br>
			<div class="alert alert-success alert-dismissable" id="resultAsigEmp"
				style="display: none">
				<button class="close" aria-hidden="true" data-dismiss="alert"
					type="button">×</button>
				<span id="mensajeAsignadosEmp"></span>
			</div>
			<br>
			<div id="spnResultList" class="resultBox section summaryPane"></div>
			<form id="frmAdministrarEmpleadosRevision">
				<input id="isState_list" type="hidden" name="isStateList" /> <input
					id="idEmpleado_list" type="hidden" name="idEmpleadoList" />
					<input id="horas_list" type="hidden" name="nroHorasList" />
			</form>
		</div>
		<br>
		<br>
		<div class="vistaInformacion2">
			<div id="spnResultList_EmpRev" class="resultBox section summaryPane"></div>

		</div>
	</div>
</div>
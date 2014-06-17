<div class="tab-pane fade" id="empleado">
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
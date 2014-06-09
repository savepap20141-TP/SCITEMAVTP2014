<script>
	$(document).ready(function(e) {
		var idvehiculo = $('#spnIdVehiculo').text();

	});
</script>
<div class="tab-pane fade" id="archivos">
	<h4>Archivos</h4>
	<p>
	<form role="form" id="frmArchivos" commandName="archivosbean"
					style="width: 90%;">
	<table id="tblArchivos" class="display dataTable"
		style="border: 1px; border-radius: 3px; box-shadow: 0px 1px 1px rgb(245, 245, 245); width: 100%; clear: both;">
		<thead
			style="background-color: #808080; line-height: 30px; text-align: left;"
			class="tableGri">
			<tr style="color: rgb(255, 255, 255);">
				<th style="width: 450px; padding-left: 10px">Nombre Archivo</th>
				<th style="width: 250px;">Visibilidad</th>
				<th style="width: 80px;">Tamaño</th>
				<th style="">Estado</th>
			</tr>
		</thead>
		<tbody id="tblTagArchivos" style="overflow-y: scroll;">

		</tbody>
		<tbody id="tblTagArchivos2" style="">
			<tr>
				<td style="padding-left: 10px"><br></td>
				<td><br></td>
				<td><br></td>
				<td><br></td>
			</tr>
			<tr>
				<td style="padding-left: 10px"><br></td>
				<td><br></td>
				<td><br></td>
				<td><br></td>
			</tr>
		</tbody>

	</table>
	<div class="detailHeader"
		style="background-color: #808080; padding-bottom: 2px; padding-left: 4px;height: 50px;">
		<div id="divUpload"></div>
		<br>
		<input type=button value="Agregar Archivo" onclick="clickFile()"> <input
			type=button value="Iniciar la Carga" onclick="clickUpload()">
		<input type="button" value="Limpiar Archivos"
			onclick="cleanFilesUpload()" />
		<input id="hdnIdEntidad" name="idEntidad" type="hidden" /> 
		<input id="hdnTipoEntidad" name="tipoEntidad" type="hidden" />
		<br>
	</div>
	</form>
	</p>

</div>
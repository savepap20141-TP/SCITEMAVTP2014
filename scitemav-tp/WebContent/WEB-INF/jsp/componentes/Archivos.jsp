<script>
var tipoEntidad;
var idEntidad;
var countArchivo = 0;
	$(document).ready(function(e) {
		//Metodo para consultar Archivos
		listarArchivos()
	});
	function listarArchivos(){
		var filas = '';
		var columnas = '';	
	    $.ajax({
	 		url: 'getArchivos',
	 		type: 'post',
	 		dataType: 'json',
	 		data:  $('#frmArchivos').serialize(),
	 		success: function(archs){
	 			$.each(archs, function(i, arch){
	 				
				});		        
	 		},
	 		complete: function() {	 			
	 			//realizarTabla(columnas,filas);
	 			removeNulls();
	  		}
	 	});
	}
	
	function clickAgregarArchivos(){
		$('#divUpload').append('<input style="display:none" type="file" name="filesbean['+countArchivo+'].filesb" multiple="multiple" id="filesToUpload_'+countArchivo+'" onchange ="countFile();"/>');
		var obj=document.getElementById('filesToUpload_'+countArchivo);
		obj.click();
	}	
	
	function countFile(){
		var input = document.getElementById('filesToUpload_'+countArchivo);
		$('#hdnTipoEntidad').val(tipoEntidad);
		$('#hdnIdEntidad').val(idEntidad);
		var miArray = input.files;
		var con = 0;
		$.each(miArray, function(i, fileA){
			con++;
	 		var row = '<tr>'+
			'<td class="center">'+fileA.name+'</td>'+
	        '<td class="center"><textarea class="form-control" name="descripcion" placeholder="Escribir nueva descripcion"></textarea></td>'+
	        '<td class="center">'+Math.floor((fileA.size)/1024)+' KB</td>'+
	        '<td class="center">Click Iniciar la Carga </td>'+
			'</tr>';
			$('#tblTagArchivos').append(row);
		});	
		if(con>0){
			countArchivo++;
		}
	}
	
	function clickCargarArchivos(){
		var formElement = document.getElementById("frmArchivos");
		var formData = new FormData(formElement);
		$.ajax({
	   		url: 'cargarArchivosFile',
	   		type: "POST",
			data:  formData,
			mimeType:"multipart/form-data",
			contentType: false,
		    cache: false,
			processData:false,
	   		success: function(result){
	   			
	   		},complete: function(){
	   			LimpiarArchivosSubidos();
	   		}
	   	});
	}
	function LimpiarArchivosSubidos(){
		countArchivo = 0;
		$('#tblTagArchivos').empty();
		$('#divUpload').empty();
	}
	
</script>
<div class="tab-pane fade" id="archivos">
	<h4>Archivos</h4>
	<p>
	<div style="border: 1px solid #808080;">
	<form role="form" id="frmArchivos" commandName="archivosbean">
	<table id="tblArchivos" class="display dataTable"
		style="border: 1px; border-radius: 3px; box-shadow: 0px 1px 1px rgb(245, 245, 245); width: 100%; clear: both;">
		<thead class="tableGri">
			<tr>
				<th class="center" style="width: 450px; padding-left: 10px">Nombre Archivo</th>
				<th class="center" style="width: 250px;">Descripción</th>
				<th class="center" style="width: 80px;">Tamaño</th>
				<th class="center" style="">Estado</th>
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
		style="background-color: #EBF0F2; padding-bottom: 2px; padding-left: 4px;height: 50px;">
		<div id="divUpload"></div>
		<br>
		<input type=button value="Agregar Archivo" onclick="clickAgregarArchivos()"> 
		<input type=button value="Iniciar la Carga" onclick="clickCargarArchivos()">
		<input type="button" value="Limpiar Archivos" onclick="LimpiarArchivosSubidos()" />
		<input id="hdnIdEntidad" name="idEntidad" type="hidden" /> 
		<input id="hdnTipoEntidad" name="tipoEntidad" type="hidden" />
		<br>
	</div>
	</form>
	</div>
	</p>

</div>
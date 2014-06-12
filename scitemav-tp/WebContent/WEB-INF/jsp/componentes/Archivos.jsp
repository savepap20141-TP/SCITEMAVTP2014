<script>
var tipoEntidad;
var idEntidad;
var countArchivo = 0;
	$(document).ready(function(e) {
		//Metodo para consultar Archivos
		listarArchivos();
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
	 				filas = filas +'<tr class="">'+
	 				'<td class="center">ARCH-'+arch.idArchivo+'</td>'+
	 				'<td class="center" id="filaIdA_'+i+'" style="display:none;">'+arch.idArchivo+'</td>'+
	 				'<td class="center">'+arch.descripcion+'</td>'+
					'<td class="center">'+arch.creado+'</td>'+
					'<td class="center">'+timeStampFormatted(arch.fechaCreacion)+'</td>';
					var tipo = arch.fileType.split("/")[0];
					if(tipo=='image'){
						filas = filas +'<td class="center"><a target="_blank"  href="'+arch.url+'"><img width="150" height="150" src="'+arch.url+'"></img></a></td>';
					}else{
						filas = filas +'<td class="center"><a target="_blank"  href="'+arch.url+'"><img width="150" height="150" src="images/ArchivoLogo.jpg"></img></a></td>';
					}
									
					filas = filas + '<td class="center">'+arch.fileType+'</td>'+
					'<td class="center">'+arch.size+'</td>'+
					'<td class="center">'+
						'<button Title="Editar" class="btn btn-success btn-circle" type="button" id="btnEditA_'+i+'" data-toggle="modal" data-target="#myModal" onclick="mostrarEditar('+i+')"><i class="fa fa-list"></i></button>'+
						'<button Title="Eliminar" class="btn btn-danger btn-circle" type="button" id="btnDeleteA_'+i+'" data-toggle="modal" data-target="#myModalR" onclick="mostrarEliminarR('+i+','+arch.idArchivo+')"><i class="fa fa-times"></i></button>'+
					'</td>'+
					'</tr>';
				});		        
	 		},
	 		complete: function() {	 			
	 			columnas = columnas + 
 				'<th class="center">Codigo </th>'+
 				'<th class="center" style="display:none;">IdArchivo</th>'+
 				'<th class="center">Descripci�n </th>'+
 				'<th class="center">Creado por </th>'+
 				'<th class="center">Fecha Creaci�n </th>'+
				'<th class="center">Archivo </th>'+
				'<th class="center">Tipo Archivo </th>'+
				'<th class="center">Tama�o </th>'+
				'<th class="center">Acciones</th>';
	 			var id = 'Arch';
				var contenido = '';
				$("#spnResultList_"+id).empty();
	
				contenido = contenido + '<table cellpadding="0" cellspacing="0" border="0" class="display dataTable" id="example_'+id+'"> '+
						' <thead class="tableGri"> '+
				            '<tr role="row">'+
				            	columnas+							                            
				            '</tr>'+
				        '</thead> '+
				        '<tbody id="'+id+'">';
				contenido = contenido + filas;   
				contenido = contenido + '</tbody>'+
						'</table> ';
				
				$("#spnResultList_"+id).append(contenido);
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
		$('#resultCargaArch').hide();
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
	   			listarArchivos();
	   			$('#resultCargaArch').show();
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
				<th class="center" style="width: 250px;">Descripci�n</th>
				<th class="center" style="width: 80px;">Tama�o</th>
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
	<br>
	<div class="alert alert-success alert-dismissable" id="resultCargaArch" style="display:none">
		<button class="close" aria-hidden="true" data-dismiss="alert" type="button">�</button>
		<span id="mensajeCarga">Archivos subidos correctamente</span>
	</div>
	</br>
	<div id="spnResultList_Arch" class="resultBox section summaryPane" style="overflow: auto;height: 500px"></div>
	
	</p>

</div>
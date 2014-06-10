<script>

$(document).ready(function(e) {
	$('#hdnIdEntidadc').val(idEntidad);
	$('#hdnTipoEntidadc').val(tipoEntidad);

});
function registrarComentarios(){
	$.ajax({
 		url: 'registrarComentario',
 		type: 'post',
 		dataType: 'json',
 		data: $('#frmComentario').serializable(),
 		success: function(resultado){
 			
 		}
 	});	
}
function consultarComentarios(typoentidad,identidad){
	
}

</script>

<div class="tab-pane fade" id="comentarios">
	<h4>Comentarios</h4>
	<p>
	<form role="form" id="frmComentario" commandName="comentariobean"
					style="width: 90%;">
		<textarea id="txtNComment" class="form-control" name="comentario"
			placeholder="Escribir nuevo comentario"></textarea>
		<br>
		<input id="btnEnviarComentario" onclick="registrarComentarios();"
			class="btn btn-lg btn-success btn-block" type="button" value="Enviar"
			style="width: 20%;"></input> <span>Visibilidad: <select
			id="visibilidadComentario" class="form-control" name="visibilidad"
			style="width: 222px;">
			<option value="Privado (Empleados)">Privado (Empleados)</option>
			<option value="Privado (Cliente)">Privado (Cliente)</option>
			<option value="Privado (Empleados & Clientes)">Privado
				(Empleados & Clientes)</option>
		</select>
		<input id="hdnIdEntidadc" name="idEntidadC" type="hidden" /> 
		<input id="hdnTipoEntidadc" name="tipoEntidadC" type="hidden" />
		</span>
	</form>
	</p>
</div>
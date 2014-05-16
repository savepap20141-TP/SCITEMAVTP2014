<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Envio de email</title>

</head>
<script>
function enviarEmail(){
	$.ajax({
 		url: 'EnviarMensaje',
 		type: 'post',
 		dataType: 'json',
 		data: '',
 		success: function(result){
 			alert(result);
 		}
 	});	
}
</script>

<body>
	<input type="button" value="Enviar" onclick="enviarEmail();" />
</body>
</html>
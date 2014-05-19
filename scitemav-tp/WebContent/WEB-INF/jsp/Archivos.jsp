<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Default</title>
<jsp:include page="componentes/head.jsp" />
</head>
<script>function UploadFileIE(){
	var formElement = document.getElementById("frmUploadFile");
	var formData = new FormData(formElement);		
	$.ajax({
 		url: '../loadFileAjaxNewIE',
 		type: "POST",
		data:  formData,
		mimeType:"multipart/form-data",
		contentType: false,
	    cache: false,
		processData:false,
		beforeSend: function(){
			//$.blockUI({ message: $('#domMessage') });
	    },
 		success: function(result){
	    	alert('Grabo :) '+result);	    	
	    },
	    complete: function() {
// 			var errorU = ''+xhr.status;
// 			if(errorU!='500'){
// 				status.html(xhr.responseText);
// 			}
			//$.unblockUI();
		}		
 	});
}



</script>
<body>
 <div id="wrapper">

		<jsp:include page="componentes/cabecera.jsp" />
		
		<jsp:include page="componentes/menu.jsp" />
		
		<div id="page-wrapper">
			<form id="frmUploadFile" name="frmUploadFile" enctype="multipart/form-data" method="post">
			    <input type="file" name="file" id="filesToUpload_0"/>
			    <select id="sltFileType_0" name="type">
			    </select>
			    <input id="upload" type="button" value="Uploading" onclick="UploadFileIE();"/>
			    <input id="hdnIdEntity" name="idEntity" type="hidden"/>
				<input id="hdnTypeEntity" name="typeEntity" type="hidden"/>
		    </form>
		
		</div>

 </div>
</body>
</html>
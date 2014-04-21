<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Revisión Detalle</title>
<jsp:include page="componentes/head.jsp" />
</head>
<body>
 <div id="wrapper">

		<jsp:include page="componentes/cabecera.jsp" />
		
		<jsp:include page="componentes/menu.jsp" />
		
		<div id="page-wrapper">
		
		<!-- TITULO -->
			<div class="row">
			
				<div class="col-lg-12">
					<br></br>
				</div>
				
			</div>
		
		<div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Detalle de la Revisión
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class=""><a href="#home" data-toggle="tab">Fallas</a>
                                </li>
                                <li class=""><a href="#profile" data-toggle="tab">Repuestos</a>
                                </li>
                                <li class=""><a href="#messages" data-toggle="tab">Archivos</a>
                                </li>
                                <li class="active"><a href="#settings" data-toggle="tab">Comentarios</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade" id="home">
                                    <p></p>                                    
                                    <p>Dato 1:</p>
                                    <p>Dato 2:</p>
                                    <p>Dato 3:</p>
                                    <p>Dato 4:</p>
                                    <p>Continuará ...</p>
                                    <p>...:</p>
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <h4>Repuestos</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade" id="messages">
                                    <h4>Archivos</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                                <div class="tab-pane fade active in" id="settings">
                                    <h4>Comentarios</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
		
		
		</div>

 </div>
</body>
</html>
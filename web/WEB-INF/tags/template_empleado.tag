<!DOCTYPE html>
<%@tag description="AFE Template-Empleado" pageEncoding="UTF-8"%>
<%@attribute name="page_title"%> 

<html>
    <body>
        <!-- Top Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark" 
        style="padding-top:20px; padding-bottom:20px; padding-left:60px; 
        background-color:#1f1f1f">
            
            <a class="navbar-brand" href="empleado.jsp">SIMÓN S.A.</a>
            <div class="navbar-nav">
                <a class="nav-item nav-link" 
                   href="empleado.jsp">Planilla de pagos</a>
                <a class="nav-item nav-link"
                   href="index.jsp">Cerrar sesión</a>
            </div>
        </nav>

        <!-- Header -->
        <div class="container" style="padding-top:25px; padding-bottom:20px;">
            <header class="text-center border" style="padding-top:20px;
            padding-bottom:15px; background-color: #dfdede;">   
                <h4>Constructora SIMÓN S.A.</h4>                
                <h5>Panel de Empleado</h5>
                <h5>Aplicación de Frameworks Empresariales</h5>  
            </header>
        </div>

        <!-- Page title -->
        <div class="container" style="padding-bottom: 20px;">
            <h5 class="text-center" style="padding-top:15px; color:#dfdede;
                padding-bottom:15px; background-color: #1f1f1f;">
                <b>${page_title}</b>
            </h5>
        </div>

    </body>
</html>
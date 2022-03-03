<%-- 
    Document   : ModifyUser
    Created on : Mar 2, 2022, 1:32:31 PM
    Author     : bryan
--%>

<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% int id = Integer.parseInt((request.getParameter("Id").toString())); 
    Usuario item = Usuario.GetById(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AFE: Planilla de empleados</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"      
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              rel="stylesheet" crossorigin="anonymous">
    </head>

    <body>
        <!-- Implementando template -->
        <%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
        <t:template_admin page_title="Planilla de empleados"></t:template_admin>

            <!-- Registro de empleados -->
            <div class="container border" 
                 style="padding-top: 10px; margin-bottom: 20px;">

                <div class="container border bg-light" style="padding-top: 15px;">
                    <p class="text-left" style="padding-left:10px;">
                        <b>1 - Registro de trabajadores</b>    
                    </p>
                </div>

                <form class="border" method="POST" action="${pageContext.request.contextPath}/UsuarioServlet" style="padding: 20px;">
                <div class="row">

                    <div class="col-4">                    
                        <label class="mb-2">Nombre:</label>
                        <input type="text" name="txt_nombre" class="form-control"
                               placeholder="Ingreso de nombre..." value="<% out.print(item.nombre); %>">
                    </div>  

                    <div class="col-4">                    
                        <label class="mb-2">Apellido:</label>
                        <input type="text" name="txt_apellido"  value="<% out.print(item.apellido); %>" class="form-control"
                               placeholder="Ingreso de apellido...">
                    </div>  

                    <div class="col-4">                    
                        <label class="mb-2">Correo electrónico:</label>
                        <input type="text" name="txt_email"  value="<% out.print(item.username); %>" class="form-control"
                               placeholder="Ingreso de e-mail...">
                    </div> 
                </div>               
                <div class="row">
                    <div class="col-4">                    
                        <label class="mb-2">Password:</label>
                        <input type="password" name="txt_password"  value="<% out.print(item.clave); %>" class="form-control"
                               placeholder="Ingreso de contraseña...">
                    </div> 
                    <div class="col-4">                    
                        <label class="mb-2">Salario:</label>
                        <input type="number"  value="<% out.print(item.salario); %>" name="txt_salario" class="form-control"
                               placeholder="Ingrese el salario">
                    </div> 
                    <div class="col-6" style="padding-top:20px;">   
                        <button type="submit" name="action" value="Update-<% out.print(id); %>" 
                                class="btn btn-dark btn-md btn-block">
                            Guardar cambios
                        </button>
                    </div>
                </div>


            </form><br>             
        </div><br>
    </body>
</html>

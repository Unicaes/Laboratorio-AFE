<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            
            <form class="border" method="POST" style="padding: 20px;">
                <div class="row">
                    
                    <div class="col-3">                    
                        <label class="mb-2">Nombre:</label>
                        <input type="text" name="txt_nombre" class="form-control"
                        placeholder="Ingreso de nombre...">
                    </div>  
                    
                    <div class="col-3">                    
                        <label class="mb-2">Apellido:</label>
                        <input type="text" name="txt_apellido" class="form-control"
                        placeholder="Ingreso de apellido...">
                    </div>  
                    
                    <div class="col-3">                    
                        <label class="mb-2">Correo electrónico:</label>
                        <input type="text" name="txt_email" class="form-control"
                        placeholder="Ingreso de e-mail...">
                    </div> 
                    
                    <div class="col-3">                    
                        <label class="mb-2">Password:</label>
                        <input type="password" name="txt_password" class="form-control"
                        placeholder="Ingreso de contraseña...">
                    </div> 
                    
                    <div class="col-6" style="padding-top:20px;">   
                        <button type="submit" name="btn_registrar_empleado" 
                        class="btn btn-dark btn-md btn-block">
                            Registrar usuario | Guardar cambios
                        </button>
                    </div>
                    
                </div>               
            </form><br>             
        </div><br>
        
        <!-- Planilla de empleados -->
        <div class="container border" 
        style="padding-top: 10px; margin-bottom: 20px;">
        
            <div class="container border bg-light" style="padding-top: 15px;">
                <p class="text-left" style="padding-left:10px;">
                    <b>2 - Planilla de trabajadores</b>    
                </p>
            </div>
            
            <!-- Tabla de empleados -->
            <div style="padding: 20px">  
                <table class="table table-striped table-bordered" 
                style="text-align: center;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Correo electrónico</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- INICIO - Iterar Aquí -->
                        <tr>
                            <td><b>0</b></td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> 
                                <a name="btn_editar" 
                                class="btn btn-outline-dark btn-md btn-block" 
                                href="#">
                                    Editar
                                </a>
                                
                                <a name="btn_remover" 
                                class="btn btn-outline-dark btn-md btn-block" 
                                href="#">
                                    Remover
                                </a>
                            </td>
                        </tr>
                        
                        <tr>
                            <td><b>0</b></td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> 
                                <a name="btn_editar" 
                                class="btn btn-outline-dark btn-md btn-block" 
                                href="#">
                                    Editar
                                </a>
                                
                                <a name="btn_remover" 
                                class="btn btn-outline-dark btn-md btn-block" 
                                href="#">
                                    Remover
                                </a>
                            </td>
                        </tr>
                        
                        <tr>
                            <td><b>0</b></td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> 
                                <a name="btn_editar" 
                                class="btn btn-outline-dark btn-md btn-block" 
                                href="#">
                                    Editar
                                </a>
                                
                                <a name="btn_remover" 
                                class="btn btn-outline-dark btn-md btn-block" 
                                href="#">
                                    Remover
                                </a>
                            </td>
                        </tr>
                        
                        <tr>
                            <td><b>0</b></td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> 
                                <a name="btn_editar" 
                                class="btn btn-outline-dark btn-md btn-block" 
                                href="#">
                                    Editar
                                </a>
                                
                                <a name="btn_remover" 
                                class="btn btn-outline-dark btn-md btn-block" 
                                href="#">
                                    Remover
                                </a>
                            </td>
                        </tr>
                        
                        <!-- FIN - Iterar Aquí -->
                    </tbody>
                </table>   
                
            </div>                 
        </div><br><br>   
    </body>
</html>
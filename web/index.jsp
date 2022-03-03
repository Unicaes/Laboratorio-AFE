<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AFE: Login</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"      
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        rel="stylesheet" crossorigin="anonymous">
    </head>
    
    <body>
        <!-- Implementando template -->
        <%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
        <t:template_login page_title="Inicio de sesión"></t:template_login>
        
        <div class="container">
            <div class="row">  
                <div class="col col-xl-6">      
                <div class="card" style="border-radius: 2rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                          <img src="https://www.skyscrapercity.com/attachments/15_data_inv_bdx_ph_04-jpg.1504425/"
                            alt="" class="img-fluid" style="border-radius: 1rem 0 0 1rem"/>
                        </div>

                        <div class="col-md-4 col-lg-7 d-flex ">
                          <div class="card-body p-4 p-lg-5">

                            <!-- Formulario - Inicio de sesión -->
                            <form method="POST" action="${pageContext.request.contextPath}/LoginServlet">
                                <div class="col-12 mb-4">
                                    <label class="mb-2">Correo electrónico:</label>
                                    <input type="text" name="txt_email" 
                                           class="form-control"
                                    placeholder="Ingreso de e-mail...">
                                </div>

                                <div class="col-12 mb-4">
                                    <label class="mb-2">Password:</label>
                                    <input type="password" name="txt_password" 
                                    class="form-control"
                                    placeholder="Ingreso de contraseña...">
                                </div>

                                <div class="mb-4">
                                    <button type="submit" name="btn_login" style="width:100%"
                                    class="btn btn-dark btn-md btn-block">
                                        Iniciar sesión
                                    </button>
                                </div>
                            </form>

                          </div>
                        </div>                                       
                    </div>
                </div>             
                </div>
                
                <div class="col col-xl-6">      
                <div class="card" style="border-radius: 2rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                          <img src="https://payload.cargocollective.com/1/20/643149/13849285/5S5A9177_1280.jpg"
                            alt="" class="img-fluid" style="border-radius: 1rem 0 0 1rem"/>
                        </div>

                        <div class="col-md-4 col-lg-7 d-flex ">
                          <div class="card-body p-4 p-lg-5">
                                <p><b>ORGANIZACIÓN, DEDICACIÓN Y CONFIANZA</b><br><br>                 
                                Construcción de obras y viviendas de excelencia, con el 
                                respaldo de una trayectoria basada en la calidad y 
                                servicio responsable hacia nuestros clientes.
                                </p>
                          </div>
                        </div>                                       
                    </div>
                </div>             
                </div>
            </div>
        </div><br><br>
    
    </body>
</html>

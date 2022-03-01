<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AFE: Planilla de pagos</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"      
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        rel="stylesheet" crossorigin="anonymous">
    </head>
    
    <body>
        <!-- Implementando template -->
        <%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
        <t:template_empleado page_title="Planilla de pagos - 2022"></t:template_empleado>
        
        <!-- 1.0 Planilla de horas/pagos mensual/semanal -->
        <div class="container border" 
        style="padding-top: 10px; margin-bottom: 20px;">
        
           <!-- 1.1 Formulario - Planilla de horas/pagos mensual/semanal -->
            <div class="container border bg-light" style="padding-top: 15px;">
                <p class="text-left" style="padding-left:10px;">
                    <b>1 - Planilla Mensual | Semanal</b>    
                </p>
            </div>
            
            <form class="border" method="POST" style="padding: 20px;">
                <div class="row">
                    <div class="col-3">                    
                        <select class="form-control text-center" name="select_mes">
                            <option selected>Seleccione un mes</option>
                            <option>Enero</option>
                            <option>Febrero</option>
                            <option>Marzo</option>
                            <option>Abril</option>
                            <option>Mayo</option>
                            <option>Junio</option>
                            <option>Julio</option>
                            <option>Agosto</option>
                            <option>Septiembre</option>
                            <option>Octubre</option>
                            <option>Noviembre</option>
                            <option>Diciembre</option>
                        </select>
                    </div>  
                    
                    <div class="col-8">   
                        <button type="submit" name="btn_consultar_planilla" 
                        class="btn btn-dark btn-md btn-block">
                            Consultar planilla de pagos
                        </button>
                    </div>
                </div>                    
            </form>

            <!-- 1.2 Tabla - Planilla de horas/pagos mensual/semanal -->
            <div style="padding: 20px">  
                
                <!-- Mes/Nombre de trabajador - Datos de planilla -->
                <table class="table table-bordered" 
                style="text-align: center;">
                    <thead>
                        <tr>
                            <th>Mes</th>
                            <th>Nombre de trabajador</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>⠀⠀⠀⠀</td>
                            <td>⠀⠀⠀⠀</td>
                        </tr> 
                    </tbody>
                </table>   
                
                <!-- Planilla de pagos y horas de trabajo -->
                <table class="table table-striped table-bordered" 
                style="text-align: center;">
                    <thead>
                        <tr>
                            <th>Semana</th>
                            <th>Lunes</th>
                            <th>Martes</th>
                            <th>Miércoles</th>
                            <th>Jueves</th>
                            <th>Viernes</th>
                            <th>Sábado</th>
                            <th>Horas totales</th>
                            <th>Salario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- INICIO - Iterar Aquí -->
                        <tr>
                            <td><b>1</b></td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>2</b></td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>3</b></td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>4</b></td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <!-- FIN - Iterar Aquí -->
                        
                        <tr><td></td><td></td><td></td><td></td><td></td>
                        <td></td><td></td><td></td><td></td></tr>   
                        
                        <tr>
                            <td><b>Total horas por día</b></td>
                            <td style="background-color:#7bd0aa;">
                               
                            </td>
                            <td style="background-color:#7bd0aa;">
                                
                            </td>
                            <td style="background-color:#7bd0aa;">
                               
                            </td>
                            <td style="background-color:#7bd0aa;">
                               
                            </td>
                            <td style="background-color:#7bd0aa;">
                                
                            </td>
                            <td style="background-color:#7bd0aa;">
                              
                            </td>
                            <td><b>TOTAL HORAS</b></td>
                            <td><b>TOTAL A PAGAR</b></td>
                        </tr>
                        <tr>
                            <td><b>Total a pagar por día</b></td>
                            <td style="background-color:#7bb9d0;">
                               
                            </td>
                            <td style="background-color:#7bb9d0;">
                              
                            </td>
                            <td style="background-color:#7bb9d0;">
                              
                            </td>
                            <td style="background-color:#7bb9d0;">
                              
                            </td>
                            <td style="background-color:#7bb9d0;">
                              
                            </td>
                            <td style="background-color:#7bb9d0;">
                              
                            </td>
                            <td style="background-color:#bcacff;">
                             
                            </td>
                            <td style="background-color:#bcacff;">
                                
                            </td>
                        </tr>
                    </tbody>
                </table>                     
            </div>                 
        </div><br>
           
        <!-- 2.0 Planilla de horas/pagos anual -->
        <div class="container border" 
        style="padding-top: 10px; margin-bottom: 20px;">
            
            <div class="container border bg-light" style="padding-top: 15px;">
                <p class="text-left" style="padding-left:10px;">
                    <b>2 - Planilla Anual</b>    
                </p>
            </div>
            
            <!-- 2.1 Tabla - Planilla de horas/pagos anual -->
            <div style="padding: 20px">  
                
                <!-- Año/Nombre de trabajador - Datos de planilla -->
                <table class="table table-bordered" 
                style="text-align: center;">
                    <thead>
                        <tr>
                            <th>Año</th>
                            <th>Nombre de trabajador</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2022</td>
                            <td>⠀⠀⠀⠀</td>
                        </tr> 
                    </tbody>
                </table>   
                
                <!-- Planilla de pagos y horas de trabajo -->
                <table class="table table-striped table-bordered" 
                style="text-align: center;">
                    <thead>
                        <tr>
                            <th>Mes</th>
                            <th>Horas totales</th>
                            <th>Salario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- INICIO - Iterar Aquí -->
                        <tr>
                            <td><b>Enero</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Febrero</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Marzo</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Abril</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Mayo</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Junio</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Julio</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Agosto</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Septiembre</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Octubre</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Noviembre</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr>
                            <td><b>Diciembre</b></td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <!-- FIN - Iterar Aquí -->
                        
                        <tr><td></td><td></td><td></td></tr>   
                        
                        <tr>
                            <td></td>
                            <td><b>TOTAL HORAS</b></td>
                            <td><b>TOTAL A PAGAR</b></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="background-color:#bcacff;">
                             ⠀⠀⠀
                            </td>
                            <td style="background-color:#bcacff;">
                                ⠀⠀⠀
                            </td>
                        </tr>
                    </tbody>
                </table>                     
            </div>                 
        </div><br><br>
        
    </body>
</html>
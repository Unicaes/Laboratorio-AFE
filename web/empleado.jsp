<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.horas_usuario"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    horas_usuario horasusuario = new horas_usuario();
    Usuario usuario = new Usuario();
    int id_usuario = usuario.LoggedUser.id_usuario;
    String username = usuario.LoggedUser.nombre + " " + usuario.LoggedUser.apellido;
%>

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

            <% 
                String mes = "";
                if (request.getParameter("btn_consultar_planilla") != null) {
                    mes = request.getParameter("select_mes").toLowerCase();}
            %>
            
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
                            <td><%= mes.toUpperCase() %></td>
                            <td><%= username %></td>
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
                            <th>Mi??rcoles</th>
                            <th>Jueves</th>
                            <th>Viernes</th>
                            <th>S??bado</th>
                            <th>Horas totales</th>
                            <th>Salario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  
                            double total_horas_semanal = 0;
                            double total_salario_semanal = 0;
                            double total_horas_mes = 0;
                            double total_salario_mes = 0;
                            double th_lun=0, th_mar=0, th_mie=0, th_jue=0, th_vie=0, th_sab=0;
                            
                            if (!(mes.equals(""))) {
                            
                            // Iterar por 4 semanas
                            for (int s = 1; s <= 4; s++) {
                                     
                            ArrayList<horas_usuario> lHoras = horasusuario.GetHorasByUsuario(id_usuario);
                            float h_lun=0, h_mar=0, h_mie=0, h_jue=0, h_vie=0, h_sab=0;
                            
                            for (int j = 0; j < lHoras.size(); j++) {  
                                if (lHoras.get(j).fecha.equals("s"+s+"-1-" + mes)) {
                                   h_lun = lHoras.get(j).HorasTrabajadas;
                                }
                                else if (lHoras.get(j).fecha.equals("s"+s+"-2-" + mes)) {
                                   h_mar = lHoras.get(j).HorasTrabajadas;
                                }
                                else if (lHoras.get(j).fecha.equals("s"+s+"-3-" + mes)) {
                                   h_mie = lHoras.get(j).HorasTrabajadas;
                                }
                                else if (lHoras.get(j).fecha.equals("s"+s+"-4-" + mes)) {
                                   h_jue = lHoras.get(j).HorasTrabajadas;
                                }
                                else if (lHoras.get(j).fecha.equals("s"+s+"-5-" + mes)) {
                                   h_vie = lHoras.get(j).HorasTrabajadas;
                                }
                                else if (lHoras.get(j).fecha.equals("s"+s+"-6-" + mes)) {
                                   h_sab = lHoras.get(j).HorasTrabajadas;
                                }
                            }
                            
                            // Totales semanales
                            total_horas_semanal = h_lun+h_mar+h_mie+h_jue+h_vie+h_sab;
                            total_salario_semanal = total_horas_semanal * 10;
                            
                            // Totales mensuales
                            total_horas_mes += total_horas_semanal;
                            total_salario_mes += total_salario_semanal;
                            
                            // Total de horas por d??a
                            th_lun += h_lun; th_mar += h_mar;
                            th_mie += h_mie; th_jue += h_jue;
                            th_vie += h_vie; th_sab += h_sab;
                            
                        %>  
                        <!-- INICIO - Iterar Aqu?? -->
                        <tr>
                            <td><b><%= s%></b></td>
                            <td><%= h_lun + " hrs" %></td>
                            <td><%= h_mar + " hrs"%></td>
                            <td><%= h_mie + " hrs"%></td>
                            <td><%= h_jue + " hrs"%></td>
                            <td><%= h_vie + " hrs"%></td>
                            <td><%= h_sab + " hrs"%></td>
                            <td><%= total_horas_semanal + " hrs" %> </td>
                            <td><%= "$ " + total_salario_semanal%></td>
                        </tr>
                        <% }}%> 
                      
                        <!-- FIN - Iterar Aqu?? -->
                        
                        <tr><td></td><td></td><td></td><td></td><td></td>
                        <td></td><td></td><td></td><td></td></tr>   
                        
                        <tr>
                            <td><b>Total horas por d??a</b></td>
                            <td style="background-color:#7bd0aa;">
                               <%= th_lun + " hrs" %>
                            </td>
                            <td style="background-color:#7bd0aa;">
                                <%= th_mar + " hrs" %>
                            </td>
                            <td style="background-color:#7bd0aa;">
                                <%= th_mie + " hrs" %>
                            </td>
                            <td style="background-color:#7bd0aa;">
                                <%= th_jue + " hrs" %>
                            </td>
                            <td style="background-color:#7bd0aa;">
                                <%= th_vie + " hrs" %>
                            </td>
                            <td style="background-color:#7bd0aa;">
                               <%= th_sab + " hrs" %>
                            </td>
                            <td><b>TOTAL HORAS</b></td>
                            <td><b>TOTAL A PAGAR</b></td>
                        </tr>
                        <tr>
                            <td><b>Total a pagar por d??a</b></td>
                            <td style="background-color:#7bb9d0;">
                               <%= "$ " + th_lun * 10 %>
                            </td>
                            <td style="background-color:#7bb9d0;">
                               <%= "$ " + th_mar * 10 %>
                            </td>
                            <td style="background-color:#7bb9d0;">
                               <%= "$ " + th_mie * 10 %>
                            </td>
                            <td style="background-color:#7bb9d0;">
                               <%= "$ " + th_jue * 10 %>
                            </td>
                            <td style="background-color:#7bb9d0;">
                               <%= "$ " + th_vie * 10 %>
                            </td>
                            <td style="background-color:#7bb9d0;">
                               <%= "$ " + th_sab * 10 %>
                            </td>
                            <td style="background-color:#bcacff;">
                                <%= total_horas_mes + " hrs" %>
                            </td>
                            <td style="background-color:#bcacff;">
                                <%= "$ " + total_salario_mes%>
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
                
                <!-- A??o/Nombre de trabajador - Datos de planilla -->
                <table class="table table-bordered" 
                style="text-align: center;">
                    <thead>
                        <tr>
                            <th>A??o</th>
                            <th>Nombre de trabajador</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2022</td>
                            <td><%= username %></td>
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
                        <!-- INICIO - Iterar Aqu?? -->
                        
                        <%  
                            ArrayList<String> lmeses = new ArrayList<>(
                            Arrays.asList("Enero","Febrero","Marzo", "Abril", "Mayo", 
                                    "Junio", "Julio", "Agosto", "Septiembre",
                                    "Octubre", "Noviembre", "Diciembre"));
                            

                            ArrayList<horas_usuario> lHoras = horasusuario.GetHorasByUsuario(id_usuario);
                            double horas_anual = 0;
                            
                            for (int i = 0; i < lmeses.size(); i++) {
                                String mes_trabajado = lmeses.get(i).toLowerCase();
                                double horas_mes = 0;
                                         
                                for (int j = 0; j < lHoras.size(); j++) {  
                                    if (lHoras.get(j).fecha.substring(5).equals(mes_trabajado)) {
                                        horas_mes += lHoras.get(j).HorasTrabajadas;
                                    }
                            }
                            
                            // Totales anuales
                            horas_anual += horas_mes;
                        %>  
                        
                        <tr>
                            <td><b><%= lmeses.get(i) %></b></td>
                            <td><%= horas_mes + " hrs" %></td>
                            <td><%= "$ " + horas_mes * 10 %></td>
                        </tr>
                        
                        <% }%> 
                        
                        <!-- FIN - Iterar Aqu?? -->
                        
                        <tr><td></td><td></td><td></td></tr>   
                        
                        <tr>
                            <td></td>
                            <td><b>TOTAL HORAS</b></td>
                            <td><b>TOTAL A PAGAR</b></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="background-color:#bcacff;">
                             ?????????<%= horas_anual + " hrs" %>
                            </td>
                            <td style="background-color:#bcacff;">
                                ??????<%= "$ " + horas_anual * 10 %>???
                            </td>
                        </tr>
                    </tbody>
                </table>                     
            </div>                 
        </div><br><br>
        
    </body>
</html>
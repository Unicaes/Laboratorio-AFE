<%@page import="Model.horas_usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario usuario = new Usuario();
    horas_usuario horasusuario = new horas_usuario();
    double fh_lu=0, fh_ma=0, fh_mi=0, fh_ju=0, fh_vi=0, fh_sa=0;
    double final_horas_totales = 0;
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
        <t:template_admin page_title="Planilla de pagos - 2022"></t:template_admin>

            <!-- 1.0 Planilla de horas/pagos mensual/semanal -->
            <div class="container border" 
                 style="padding-top: 10px; margin-bottom: 20px;">

                <div class="container border bg-light" style="padding-top: 15px;">
                    <p class="text-left" style="padding-left:10px;">
                        <b>1 - Planilla Mensual | Semanal</b>    
                    </p>
                </div>

                <form class="border" method="POST" style="padding: 20px;">
                    <div class="row">
                        <div class="col-3">                    
                            <select class="form-control text-center" name="select_mes_ver">
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

                <%   String mes_ver = "";
                    if (request.getParameter("btn_consultar_planilla") != null) {
                        mes_ver = request.getParameter("select_mes_ver").toLowerCase();
                    }
                %>
                <!-- Tabla - Planilla de horas/pagos mensual/semanal -->
                <%    
                    if (!(mes_ver.equals(""))) {
                    fh_lu=0; fh_ma=0; fh_mi=0; fh_ju=0; fh_vi=0; fh_sa=0;
                    final_horas_totales = 0;
    
                    for (int se = 1; se <= 4; se++) {
                %>
                <div style="padding: 20px">  

                    <table class="table table-bordered" 
                           style="text-align: center;">
                        <thead>
                            <tr>
                                <th>Mes</th>
                                <th>Semana</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= mes_ver.toUpperCase() %></td>
                                <td style="background-color:#bcacff;"><%= se %></td>
                            </tr> 
                        </tbody>
                    </table>   

                    <!-- Planilla de pagos y horas de trabajo -->
                    <table class="table table-striped table-bordered" 
                           style="text-align: center;">
                        <thead>
                            <tr>
                                <th>Trabajador</th>
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

                            <%          
                                ArrayList<Usuario> lUser = usuario.GetAll();
                                               
                                double horas_semanal = 0;
                                double total_horas_semanales = 0;
                                double th_lun=0, th_mar=0, th_mie=0, th_jue=0, th_vie=0, th_sab=0;
                                
                                for (int i = 0; i < lUser.size(); i++) {

                                    ArrayList<horas_usuario> lHor = horasusuario.GetHorasByUsuario(lUser.get(i).id_usuario);
                                    float h_lun = 0, h_mar = 0, h_mie = 0, h_jue = 0, h_vie = 0, h_sab = 0;

                                    for (int j = 0; j < lHor.size(); j++) {
                                        if (lHor.get(j).fecha.equals("s" + se + "-1-" + mes_ver)) {
                                            h_lun = lHor.get(j).HorasTrabajadas;
                                        } else if (lHor.get(j).fecha.equals("s" + se + "-2-" + mes_ver)) {
                                            h_mar = lHor.get(j).HorasTrabajadas;
                                        } else if (lHor.get(j).fecha.equals("s" + se + "-3-" + mes_ver)) {
                                            h_mie = lHor.get(j).HorasTrabajadas;
                                        } else if (lHor.get(j).fecha.equals("s" + se + "-4-" + mes_ver)) {
                                            h_jue = lHor.get(j).HorasTrabajadas;
                                        } else if (lHor.get(j).fecha.equals("s" + se + "-5-" + mes_ver)) {
                                            h_vie = lHor.get(j).HorasTrabajadas;
                                        } else if (lHor.get(j).fecha.equals("s" + se + "-6-" + mes_ver)) {
                                            h_sab = lHor.get(j).HorasTrabajadas;
                                        }
                                    }

                                // Totales semanales
                                horas_semanal = h_lun+h_mar+h_mie+h_jue+h_vie+h_sab;
                                total_horas_semanales += horas_semanal;

                                // Total de horas por día
                                th_lun += h_lun; th_mar += h_mar;
                                th_mie += h_mie; th_jue += h_jue;
                                th_vie += h_vie; th_sab += h_sab;   
                            %>  
                            <tr>
                                <td><%= lUser.get(i).nombre + " " + lUser.get(i).apellido %></td>
                                <td><%= h_lun + " hrs" %></td>
                                <td><%= h_mar + " hrs" %></td>
                                <td><%= h_mie + " hrs" %></td>
                                <td><%= h_jue + " hrs" %></td>
                                <td><%= h_vie + " hrs" %></td>
                                <td><%= h_sab + " hrs" %></td>           
                                <td><%= horas_semanal + " hrs" %></td>
                                <td><%= "$ " + horas_semanal * 10%></td>
                            </tr>
                            <% }%> 
                            
                            <!-- FIN - Iterar Aquí -->

                            <tr><td></td><td></td><td></td><td></td><td></td>
                                <td></td><td></td><td></td><td></td></tr>   

                            <tr>
                                <td><b>Total horas por día</b></td>
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
                                <td><b>Total a pagar por día</b></td>
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
                                    <%= total_horas_semanales + " hrs" %>
                                </td>
                                <td style="background-color:#bcacff;">
                                    <%= "$ " + total_horas_semanales * 10 %>
                                </td>
                            </tr>
                        </tbody>
                    </table>                     
                </div>  
                <%  // Total final
                    fh_lu += th_lun; fh_ma += th_mar;
                    fh_mi += th_mie; fh_ju += th_jue;
                    fh_vi += th_vie; fh_sa += th_sab;

                    final_horas_totales += total_horas_semanales;}%>
               
                <!-- TOTAL Mnesual - Tabla - Planilla de horas/pagos mensual/semanal -->
                <div style="padding: 20px">  

                    <table class="table table-bordered" 
                           style="text-align: left;">
                        <thead>
                            <tr>
                                <th style="padding-left: 20px;">Mes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="padding-left: 20px;"><%= mes_ver.toUpperCase() %></td>
                            </tr> 
                        </tbody>
                    </table>   

                    <!-- Planilla de pagos y horas de trabajo -->
                    <table class="table table-striped table-bordered" 
                           style="text-align: center;">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Lunes</th>
                                <th>Martes</th>
                                <th>Miércoles</th>
                                <th>Jueves</th>
                                <th>Viernes</th>
                                <th>Sábado</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr><td></td><td></td><td></td><td></td><td></td>
                                <td></td><td></td><td></td><td></td></tr>   

                            <tr>
                                <td><b>Total horas por día</b></td>
                                <td style="background-color:#7bd0aa;">
                                    <%= fh_lu + " hrs" %>
                                </td>
                                <td style="background-color:#7bd0aa;">
                                    <%= fh_ma + " hrs" %>
                                </td>
                                <td style="background-color:#7bd0aa;">
                                    <%= fh_mi + " hrs" %>
                                </td>   
                                <td style="background-color:#7bd0aa;">
                                    <%= fh_ju+ " hrs" %>
                                </td>
                                <td style="background-color:#7bd0aa;">
                                    <%= fh_vi + " hrs" %>
                                </td>
                                <td style="background-color:#7bd0aa;">
                                    <%= fh_sa + " hrs" %>
                                </td>
                                <td><b>TOTAL HORAS</b></td>
                                <td><b>TOTAL A PAGAR</b></td>
                            </tr>
                            <tr>
                                <td><b>Total a pagar por día</b></td>
                                <td style="background-color:#7bb9d0;">
                                    <%= "$ " + fh_lu * 10%>
                                </td>
                                <td style="background-color:#7bb9d0;">
                                    <%= "$ " + fh_ma * 10%>
                                </td>
                                <td style="background-color:#7bb9d0;">
                                    <%= "$ " + fh_mi * 10%>
                                </td>
                                <td style="background-color:#7bb9d0;">
                                    <%= "$ " + fh_ju * 10%>
                                </td>
                                <td style="background-color:#7bb9d0;">
                                    <%= "$ " + fh_vi * 10%>
                                </td>
                                <td style="background-color:#7bb9d0;">
                                    <%= "$ " + fh_sa * 10%>
                                </td>
                                <td style="background-color:#bcacff;">
                                    <%= final_horas_totales + " hrs" %>
                                </td>
                                <td style="background-color:#bcacff;">
                                    <%= "$ " + final_horas_totales * 10 %>
                                </td>
                            </tr>
                        </tbody>
                    </table>                     
                </div>  

            </div><%}%><br>

        <!-- 2.0 Ingreso de horas de trabajo mensual/semanal -->
        <div class="container border" 
        style="padding-top: 10px; margin-bottom: 20px;">
        
            <div class="container border bg-light" style="padding-top: 15px;">
                <p class="text-left" style="padding-left:10px;">
                    <b>2 - Registro de horas de trabajo Mensual | Semanal</b>    
                </p>
            </div>
            
            <form class="border" method="POST" style="padding: 20px;">
                <div class="row">
                    <div class="col-3">                    
                        <select class="form-control text-center" name="select_mes_editar">
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
                        <button type="submit" name="btn_editar_planilla" 
                        class="btn btn-dark btn-md btn-block">
                            Editar planilla de horas
                        </button>
                    </div>
                </div>                    
            </form>
            <%   String mes = "";
                if (request.getParameter("btn_editar_planilla") != null) {
                    mes = request.getParameter("select_mes_editar").toLowerCase();
                }
            %>
            <div style="padding: 20px">  

                <table class="table table-bordered" 
                       style="text-align: left;">
                    <thead>
                        <tr>
                            <th style="padding-left:20px">Mes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="padding-left:20px"><%= mes.toUpperCase() %></td>
                        </tr> 
                    </tbody>
                </table>  
                <form method="POST" action="${pageContext.request.contextPath}/HorasServlet">
                    <!-- Planilla de pagos y horas de trabajo -->
                    <table class="table table-striped table-bordered" 
                           style="text-align: center;">
                        <thead>
                            <tr>
                                <th>Semana</th>
                                <th>Trabajador</th>
                                <th>Lunes</th>
                                <th>Martes</th>
                                <th>Miércoles</th>
                                <th>Jueves</th>
                                <th>Viernes</th>
                                <th>Sábado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- INICIO - Iterar Aquí -->
                            <input type="hidden" name="month" value="<% out.print(mes); %>">
                            <%  if (!(mes.equals(""))) {

                                    // Iterar por 4 semanas
                                    for (int s = 1; s <= 4; s++) {

                                        ArrayList<Usuario> lUsuarios = usuario.GetAll();

                                        for (int i = 0; i < lUsuarios.size(); i++) {
                                            ArrayList<horas_usuario> lHoras = horasusuario.GetHorasByUsuario(lUsuarios.get(i).id_usuario);
                                            float h_lun = 0, h_mar = 0, h_mie = 0, h_jue = 0, h_vie = 0, h_sab = 0;

                                            for (int j = 0; j < lHoras.size(); j++) {
                                                if (lHoras.get(j).fecha.equals("s" + s + "-1-" + mes)) {
                                                    h_lun = lHoras.get(j).HorasTrabajadas;
                                                } else if (lHoras.get(j).fecha.equals("s" + s + "-2-" + mes)) {
                                                    h_mar = lHoras.get(j).HorasTrabajadas;
                                                } else if (lHoras.get(j).fecha.equals("s" + s + "-3-" + mes)) {
                                                    h_mie = lHoras.get(j).HorasTrabajadas;
                                                } else if (lHoras.get(j).fecha.equals("s" + s + "-4-" + mes)) {
                                                    h_jue = lHoras.get(j).HorasTrabajadas;
                                                } else if (lHoras.get(j).fecha.equals("s" + s + "-5-" + mes)) {
                                                    h_vie = lHoras.get(j).HorasTrabajadas;
                                                } else if (lHoras.get(j).fecha.equals("s" + s + "-6-" + mes)) {
                                                    h_sab = lHoras.get(j).HorasTrabajadas;
                                                }
                                            }
                            %>  
                            <tr>
                                <td><b><%= s%></b></td>
                                <td><%= lUsuarios.get(i).nombre + " " + lUsuarios.get(i).apellido%></td>
                                <td>
                                    
                                    <input class="text-center" type="text"
                                           style="width: 35px;" value="<%= h_lun%>"
                                           name="<%= "hrs_s" + s + "_1_" + lUsuarios.get(i).id_usuario%>"> hrs
                                </td>
                                <td>
                                    <input class="text-center" type="text"
                                           style="width: 35px;" value="<%= h_mar%>"
                                           name="<%= "hrs_s" + s + "_2_" + lUsuarios.get(i).id_usuario%>"> hrs
                                </td>
                                <td>
                                    <input class="text-center" type="text"
                                           style="width: 35px;" value="<%= h_mie%>"
                                           name="<%= "hrs_s" + s + "_3_" + lUsuarios.get(i).id_usuario%>"> hrs
                                </td>
                                <td>
                                    <input class="text-center" type="text"
                                           style="width: 35px;" value="<%= h_jue%>"
                                           name="<%= "hrs_s" + s + "_4_" + lUsuarios.get(i).id_usuario%>"> hrs
                                </td>
                                <td>
                                    <input class="text-center" type="text"
                                           style="width: 35px;" value="<%= h_vie%>"
                                           name="<%= "hrs_s" + s + "_5_" + lUsuarios.get(i).id_usuario%>"> hrs
                                </td>
                                <td>
                                    <input class="text-center" type="text"
                                           style="width: 35px;" value="<%= h_sab%>"
                                           name="<%= "hrs_s" + s + "_6_" + lUsuarios.get(i).id_usuario%>"> hrs
                                </td>
                            </tr>
                            <% }
                                }
                            }%> 

                            <!-- FIN - Iterar Aquí -->

                        </tbody>
                    </table>  


                    <button type="submit" name="btn_guardar_cambios" 
                            class="btn btn-dark btn-md btn-block">
                        Guardar cambios
                    </button>                         
                </form>

                <% if (request.getParameter("btn_guardar_cambios") != null) {

                    }%>
            </div> 

        </div><br><br>

    </body>
</html>
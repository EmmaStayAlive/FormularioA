<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambios</title>
    </head>

    <body>
        <h1>Rutina de Cambios</h1>
        <%@page import="java.sql.*"%>

        <%
        String clave;
        Connection con = null; 
        Statement sta = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emps?autoReconnect=true&useSSL=false", "root", "n0m3l0");
            sta = con.createStatement();
        } catch (SQLException error) {
            out.print("Error: " + error.toString());
        }

        clave = request.getParameter("clave");
        rs = sta.executeQuery("SELECT * FROM datos WHERE clave = '" + clave + "'");  
        if (rs.next()) {
            String contra = rs.getString("contra");
            String nombre = rs.getString("nombre");
            String estado = rs.getString("estado");
            String sexo = rs.getString("sexo");
            out.print(clave); 
            out.println("<h1>Datos del registro</h1>");
            
        out.println("<form action='cambios.jsp' method='post'>");
        out.println("Contraseña:");
        out.println("<input type='password' name='contra' value='" + contra + "' required><br>"); 
        out.println("Nombre:");
        out.println("<input type='text' name='nombre' value='" + nombre + "' required><br>");
        
        out.println("Estado:");
        out.println("<select name='estado'>");
        out.println("<option value = 'selecciona uno'> Cual opcion </option>);  
        out.println("<option value = 'Aguascalientes'> Aguascalientes</option>");    
        out.println("<option value = 'CDMX'> CDMX</option>");                      
        out.println("<option value = 'EDOMEX'> EDOMEX</option>");                  
        out.println("<option value = 'Guadalajara'> Guadalajara</option>");        
        out.println("</select><br>");

        out.println("Sexo:");
        out.println("<input type='radio' name='sexo' value='Hombre'"> Hombre<br>");  
        out.println("<input type='radio' name='sexo' value='Mujer'"> Mujer<br>");   
        }
        else {
            out.println("<script>alert('No existe el registro');</script>");
        }

        out.println("<input type='submit' value='Actualizar'>");
        out.println("</form>");
        %>
    </body>
</html>
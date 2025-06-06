<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bajas</title>
    </head>

    <body> 
        <h1>Rutina de Bajas</h1>

        <%page import="java.sql.*"%>
        <%
        String nomb;
        Connection con = null;
        Statement sta = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emps?autoReconnect=true&useSSL=false", "root", "n0m3l0");
            sta = con.createStatement();
        }

        catch (SQLException error) {
            out.print("Error: " + error.toString());
        }
        String clave = request.getParameter("clave");
        r = sta.executeQuery("SELECT * FROM datos WHERE clave = '" + clave + "'");
        if (!r.next()) { 
            out.println("<script>alert('No existe el registro');</script>");
        } else {
            try {
                out.println(contra);
                sta.executeUpdate("DELETE FROM datos WHERE clave = '" + clave + "'");
                out.println("<script>alert('Registro dado de baja');</script>");

            }
            catch (SQLException error) {
                out.print("Error: " + error.toString());
            }
            sta.close();
            con.close();
            rs.close();
        }
        %>
            
        <br><br><br><br>

        <a href="index.html">Regresar</a>
    </body>
</html>
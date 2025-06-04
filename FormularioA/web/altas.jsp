<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Altas</title>
        <script>
            function mensaje() {
                alert("Registro dado de Alta");
            }
        </script>
    </head>
    <body>
        <%
        String contra = request.getParameter("contra");
        String nombre = request.getParameter("nombre");
        String estado = request.getParameter("estado");
        String sexo = request.getParameter("sexo");
        Connection con = null;
        Statement sta = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emps?autoReconnect=true&useSSL=false", "root", "n0m3l0");
            sta = con.createStatement();
            sta.executeUpdate("INSERT INTO datos VALUES('" + contra + "', '" + nombre + "', '" + estado + "', '" + sexo + "')");
            out.print("<script> mensaje(); </script>");
        } catch (SQLException error) {
            out.print("Error: " + error.toString());
        } finally {
            if (sta != null) sta.close();
            if (con != null) con.close();
        }
        %>

        <a href="index.html" target="todos">Regresar</a>
    </body>
</html>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir clintes</title>
    </head>
    <body>
        <%
            int codigo;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");
                
                st = conecta.prepareStatement("DELETE FROM clientes WHERE id_clientes=?");
                st.setInt(1, codigo);
                //Executa o comando Delete.
                int resultado = st.executeUpdate();

                if (resultado == 0) {
                   out.print("<p>Este cliente não está cadastrado</p>");
                } else {
                   out.print("<p>O cliente de codigo " + codigo + " foi excluído com sucesso.</p>");
                }
            } catch (Exception e){
                out.print("Mensagem de erro: " + e.getMessage());
            }
        %>
    </body>
</html>

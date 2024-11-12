<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Excluir clintes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            String codigo = request.getParameter("codigo");
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conecta.prepareStatement("DELETE FROM clientes WHERE id_clientes=?");
                st.setString(1, codigo);
                //Executa o comando Delete.
                int resultado = st.executeUpdate();

                if (resultado == 0) {
                    out.print("<p class='resposta'>Este cliente não está cadastrado</p>");
                } else {
                    out.print("<p class='resposta'>O cliente de codigo " + codigo + " foi excluído com sucesso</p>");
                }
            } catch (Exception e) {
                out.print("Mensagem de erro: " + e.getMessage());
            }
        %>
        <div class="voltar">
            <a href="../pagesClientes/excluir_clientes.html">Voltar</a>
        </div>
    </body>
</html>

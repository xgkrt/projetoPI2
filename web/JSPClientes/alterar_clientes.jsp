<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Alterar produtos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            int codigo;
            String nome, telefone, email;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            telefone = request.getParameter("telefone");
            email = request.getParameter("email");

            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conecta.prepareStatement("UPDATE clientes SET nome=?, telefone=?, email=? WHERE id_clientes=?");
                st.setString(1, nome);
                st.setString(2, telefone);
                st.setString(3, email);
                st.setInt(4, codigo);
                st.executeUpdate();

                out.print("<p class='resposta'>Os dados do cliente " + codigo + " foram alterados com sucesso</p>");

            } catch (Exception x) {
                out.print("<p class='resposta'>Error: " + x.getMessage() + "<p>");
            }

        %>
        <div class="voltar">
            <a href="../pagesClientes/alterar_clientes.html">Voltar</a>
        </div>
    </body>
</html>

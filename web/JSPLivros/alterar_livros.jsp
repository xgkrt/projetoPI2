<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar livros</title>
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            int codigo;
            String titulo, autor, genero;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            titulo = request.getParameter("titulo");
            autor = request.getParameter("autor");
            genero = request.getParameter("genero");
            
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conecta.prepareStatement("UPDATE livros SET titulo=?, autor=?, genero=? WHERE id_livros=?");
                st.setString(1, titulo);
                st.setString(2, autor);
                st.setString(3, genero);
                st.setInt(4, codigo);
                st.executeUpdate();
                
                out.print("<p class='resposta'>Os dados do livro: " + codigo + " foram alterados com sucesso.</p>" );

            } catch (Exception x) {
                out.print("<p class='mensagem'>Error: " + x.getMessage() + "</p>");
            }

        %>
        <div class="voltar">
            <a href="../pagesLivros/alterar_livros.html">Voltar</a>
        </div>
    </body>
</html>

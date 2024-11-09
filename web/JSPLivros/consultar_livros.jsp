<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar livros</title>
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            String titulo;
            titulo = request.getParameter("titulo");
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");
                
                st = conecta.prepareStatement("SELECT * FROM livros WHERE titulo LIKE ? ORDER BY titulo");
                st.setString(1, "%" + titulo + "%");
                ResultSet resultado = st.executeQuery();
        %>
            <table border="1">
                <tr>
                    <th>Código</th><th>Titulo</th><th>Autor</th><th>Genêro</th><th>Exclusão</th><th>Alteração</th>
                </tr>
        <%
            while (resultado.next()) {                        
        %>
            <tr>
                <td><%= resultado.getString("id_livros") %></td>
                <td><%= resultado.getString("titulo") %></td>
                <td><%= resultado.getString("autor") %></td>
                <td><%= resultado.getString("genero") %></td>
                <td><a href="../JSPLivros/excluir_livros.jsp?codigo=<%= resultado.getString("id_livros") %>">Excluir</a></td>
                <td><a href="../JSPLivros/carrega_livros.jsp?codigo=<%= resultado.getString("id_livros") %>">Alterar</a></td>-
            </tr>
            <%
                }
        %>
            </table>
        <%        
            } catch(Exception e){
                out.print("Mensagem de erro: " + e.getMessage());
            }
        %>
    </body>
</html>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Listar livros</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");
                
                st = conecta.prepareStatement("SELECT * FROM livros ORDER BY titulo");
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
                <td><a href="../JSPLivros/carrega_livros.jsp?codigo=<%= resultado.getString("id_livros") %>">Alterar</a></td>
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

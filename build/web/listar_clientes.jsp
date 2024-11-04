<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar clientes</title>
    </head>
    <body>
        <%
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");
                
                st = conecta.prepareStatement("SELECT * FROM clientes ORDER BY nome");
                ResultSet resultado = st.executeQuery();
        %>
                <table border="1">
                            <tr>
                                <th>Código</th><th>Nome</th><th>Telefone</th><th>Email</th><th>Exclusão</th><th>Alteração</th>
                            </tr>
        <%
                while (resultado.next()) {                        
        %>
                            <tr>
                                <td><%= resultado.getString("id_clientes") %></td>
                                <td><%= resultado.getString("nome") %></td>
                                <td><%= resultado.getString("telefone") %></td>
                                <td><%= resultado.getString("email") %></td>
                                <td><a href="clientes.jsp?id_clientes=<%= resultado.getString("id_clientes") %>">Excluir</a></td>
                                <td><a href="carrega_alunos.jsp?id_clientes=<%= resultado.getString("id_clientes") %>">Alterar</a></td>
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

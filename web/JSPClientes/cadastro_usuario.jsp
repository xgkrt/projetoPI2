<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Cadastro Usuário</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <% 
            String u, s, n;
            Connection conn;
            PreparedStatement st;
            u = request.getParameter("usuario");
            s = request.getParameter("senha");
            n = request.getParameter("nome");
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conn.prepareStatement("INSERT INTO users value(?,?,?)");
                st.setString(1,u);
                st.setString(2,s);
                st.setString(3,n);
                st.executeUpdate();
                out.print("<p class='resposta'>Usuário Cadastrado com Sucesso</p>");
            }catch(Exception x) {
                out.print("Error: " + x.getMessage());
            }
        %>
        <div id="logar">
            <a href="../pagesClientes/inicio.html">Logar</a>
        </div>
    </body>
</html>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvar clientes</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <%
            int codigo;
            String nome, telefone, email;

            codigo = Integer.parseInt(request.getParameter("codigoCli"));
            telefone = request.getParameter("telefoneCli");
            nome = request.getParameter("nomeCli");
            email = request.getParameter("emailCli");
            
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conecta.prepareStatement("INSERT INTO clientes VALUES(?,?,?,?)");
                st.setInt(1, codigo);
                st.setString(2, nome);
                st.setString(3, telefone);
                st.setString(4, email);
                st.executeUpdate();

                out.print("<p>Cliente cadastrado com sucesso</p>");
            } catch (Exception x) {
                String error = x.getMessage();
                if (error.contains("Duplicate entry")) {
                    out.print("<p>Este cliente já está cadastrado</p>");
                } else {
                    out.print("<p class='mensagem'>Mensagem de erro: " + x.getMessage() + "</p>");
                }
            }
        %>
    </body>
</html>

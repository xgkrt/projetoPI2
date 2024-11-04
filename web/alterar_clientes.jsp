<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>alterar clientes</title>
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
                
                st = conecta.prepareStatement("UPDATE clientes SET nome=?, telefone=?, disciplina=?, nota=? WHERE matricula=?");
                st.setString(1, nome);
                st.setString(2, nome);
                st.setString(3, telefone);
                st.setString(4, email);
                st.executeUpdate();
                
                out.print("Os dados do aluno " + nome + " foram alterados com sucesso.");
            } catch (Exception e) {
                out.print("Erro: " + e.getMessage());
            }
        %>
    </body>
</html>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvar livros</title>
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body>
        <%
            int codigo;
            String titulo, autor, genero;

            codigo = Integer.parseInt(request.getParameter("codigoli"));
            titulo = request.getParameter("titulo");
            autor = request.getParameter("autor");
            genero = request.getParameter("genero");
            
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conecta.prepareStatement("INSERT INTO livros VALUES(?,?,?,?)");
                st.setInt(1, codigo);
                st.setString(2, titulo);
                st.setString(3, autor);
                st.setString(4, genero);
                st.executeUpdate();

                out.print("<p class='resposta'>Livro cadastrado com sucesso</p>");
            } catch (Exception x) {
                String error = x.getMessage();
                if (error.contains("Duplicate entry")) {
                    out.print("<p class='resposta'>Este livro já está cadastrado</p>");
                } else {
                    out.print("<p class='resposta'>Mensagem de erro: " + x.getMessage() + "</p>");
                }
            }
        %>
    </body>
</html>

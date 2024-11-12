<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Salvar clientes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
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

                    out.print("<p class='resposta'>Cliente cadastrado com sucesso</p>");
                } catch (Exception x) {
                    String error = x.getMessage();
                    if (error.contains("Duplicate entry")) {
                        out.print("<p class='resposta'>Este cliente já está cadastrado</p>");
                    } else {
                        out.print("<p class='resposta'>Mensagem de erro: " + x.getMessage() + "</p>");
                    }
                }
            %>
            <div class="voltar">
                <a href="../pagesClientes/cadastro_clientes.html">Voltar</a>
            </div>
    </body>
</html>

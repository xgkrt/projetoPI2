<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>altera clientes</title>
    </head>
    <body>
        <%
            String codigo;
            codigo = request.getParameter("codigo");

            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conecta.prepareStatement("SELECT * FROM aluno WHERE id_clientes=?");
                st.setString(1, codigo);

                ResultSet resultado = st.executeQuery();
                if (!resultado.next()) {
                    out.print("<p> Este cliente não está cadastrado</p>");
                } else {
        %>
                <form method="post" action="alterar_clientes.jsp">
                        <div>
                            <label for="codigo">Código</label>
                            <input type="number" name="codigo" id="codigo" size="20" readonly value="<%= resultado.getString("codigoCli") %>">
                        </div>
                        <div>
                            <label for="nome">Nome</label>
                            <input type="text" name="nome" id="nome" size="50" value="<%= resultado.getString("nomeCli") %>" maxlength="50">
                        </div>
                        <p>
                            <label for="telefone">Telefone:</label>
                            <input type="number" name="telefone" value="<%= resultado.getString("telefoneCli") %>" id="telefone">
                        </p>
                        <p>
                            <label for="email">Email</label>
                            <input type="email" name="email" value="<%= resultado.getString("emailCli") %>" id="email">
                        </p>
                        <p>
                            <input type="submit" value="Salvar Alterações">
                        </p>
                    </form>
        <%
                }

            } catch (Exception x) {
                out.print("<p>Error: " + x.getMessage() + "<p>");
            }

        %>
    </body>
</html>

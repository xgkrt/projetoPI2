<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Enumeration" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrega Clientes</title>
        <link rel="stylesheet" href="cadastro_produtos_style.css"/>
    </head>
    <body>
        <%
            String codigo = request.getParameter("codigo");
            //out.println("<p>Valor do código recebido: " + codigo + "</p>");

            if (codigo == null || codigo.trim().isEmpty()) {
                out.println("<p style='color: red'>ERRO: Código não foi recebido corretamente!</p>");
                return;
            }

            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");
                st = conecta.prepareStatement("SELECT * FROM clientes WHERE id_clientes=?");
                st.setString(1, codigo);

                ResultSet resultado = st.executeQuery();

                if (!resultado.next()) {
                    out.print("<p>Este cliente não está cadastrado</p>");
                } else {
        %>
        <div>
            <form method="post" action="alterar_clientes.jsp">
                <p>
                    <label for="codigo">Código:</label>
                    <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("id_clientes")%>" readonly>
                </p>
                <p>
                    <label for="nome">Nome do Cliente:</label>
                    <input type="text" name="nome" id="nome" value="<%= resultado.getString("nome")%>" size="50" maxlength="50">
                </p>
                <p>
                    <label for="telefone">Telefone:</label>
                    <input type="text" name="telefone" id="telefone" value="<%= resultado.getString("telefone")%>" maxlength="50">
                </p>
                <p>
                    <label for="email">Email:</label>
                    <input type="text" name="email" value="<%= resultado.getString("email")%>" id="email">
                </p>
                <p>
                    <input type="submit" value="Salvar Alterações" class="submit-button">
                </p>
            </form>
        </div>                    
        <%
                }
            } catch (Exception x) {
                out.print("<p style='color: red'>Error: " + x.getMessage() + "</p>");
                x.printStackTrace(new java.io.PrintWriter(out));
            }
        %>
    </body>
</html>
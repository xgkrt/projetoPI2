<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Enumeration" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Carrega Clientes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            String codigo = request.getParameter("codigo");
            //out.println("<p>Valor do código recebido: " + codigo + "</p>");

            if (codigo == null || codigo.trim().isEmpty()) {
                out.println("<p class='resposta' style='color: red'>ERRO: Código não foi recebido corretamente!</p>");
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
                    out.print("<p class='resposta'>Este cliente não está cadastrado</p>");
                } else {
        %>
        <form method="post" action="../JSPClientes/alterar_clientes.jsp">
            <div>
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("id_clientes")%>" readonly>
            </div>
            <div>
                <label for="nome">Nome do Cliente:</label>
                <input type="text" name="nome" id="nome" value="<%= resultado.getString("nome")%>" size="50" maxlength="100">
            </div>
            <div>
                <label for="telefone">Telefone:</label>
                <input type="text" name="telefone" id="telefone" value="<%= resultado.getString("telefone")%>" maxlength="15">
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="text" name="email" value="<%= resultado.getString("email")%>" id="email" maxlength="100">
            </div>
            <div>
                <input type="submit" value="Salvar Alterações" class="submit-button">
            </div>
        </form>                   
        <%
                }
            } catch (Exception x) {
                out.print("<p class='resposta'>Error: " + x.getMessage() + "</p>");
                x.printStackTrace(new java.io.PrintWriter(out));
            }
        %>
    </body>
</html>
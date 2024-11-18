<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Enumeration" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrega livros</title>
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
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
                st = conecta.prepareStatement("SELECT * FROM livros WHERE id_livros=?");
                st.setString(1, codigo);
                
                ResultSet resultado = st.executeQuery();

                if (!resultado.next()) {
                    out.print("<p class='resposta'>Este livro não está cadastrado</p>");
                } else {
        %>
        <div>
            <form method="post" action="../JSPLivros/alterar_livros.jsp">
                <p>
                    <label for="codigo">Código:</label>
                    <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("id_livros")%>" readonly>
                </p>
                <p>
                    <label for="titulo">Titulo do livro:</label>
                   <input type="text" name="titulo" id="titulo" value="<%= resultado.getString("titulo")%>" size="50" maxlength="100">
                </p>
                <p>
                    <label for="autor">Autor:</label>
                    <input type="text" name="autor" id="autor" value="<%= resultado.getString("autor")%>" maxlength="100">
                </p>
                <p>
                    <label for="genero">Genêro:</label>
                    <input type="text" name="genero" id="genero" value="<%= resultado.getString("genero")%>" maxlength="50" >
                </p>
                <p>
                    <input type="submit" value="Salvar Alterações" class="submit-button">
                </p>
            </form>
        </div>                    
        <%
                }
            } catch (Exception x) {
                out.print("<p class='resposta'>Error: " + x.getMessage() + "</p>");
                x.printStackTrace(new java.io.PrintWriter(out));
            }
        %>
    </body>
</html>
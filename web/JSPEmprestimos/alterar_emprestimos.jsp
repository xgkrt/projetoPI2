<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Alterar produtos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            int codigo;
            String idLivro, idCliente, dataEmpreStr, dataDevoStr;

            codigo = Integer.parseInt(request.getParameter("codigoEmpre"));
            idLivro = request.getParameter("titulo");
            idCliente = request.getParameter("nome");
            dataEmpreStr = request.getParameter("dataEmpre");
            dataDevoStr = request.getParameter("dataDevo");

            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conecta.prepareStatement("UPDATE emprestimos SET data_emprestimo=?, dat_devolucao=?, livro_id=?, cliente_id=? WHERE ind_emprestimos=?");
                st.setString(1, dataEmpreStr);
                st.setString(2, dataDevoStr);
                st.setString(3, idLivro);
                st.setString(4, idCliente);
                st.setInt(5, codigo);
                st.executeUpdate();

                out.print("<p class='resposta'>Os dados do emprestimo " + codigo + " foram alterados com sucesso</p>");

            } catch (Exception x) {
                out.print("<p class='resposta'>Error: " + x.getMessage() + "<p>");
            }

        %>
        <div class="voltar">
            <a href="../pagesEmprestimos/alterar_emprestimos.html">Voltar</a>
        </div>
    </body>
</html>

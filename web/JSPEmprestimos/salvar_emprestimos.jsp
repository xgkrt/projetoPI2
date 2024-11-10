<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Date" %> <!-- Mantendo apenas java.sql.Date -->
<%@page import = "java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvar emprestimos</title>
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body>
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

                st = conecta.prepareStatement("INSERT INTO emprestimos (ind_emprestimos, livro_id, cliente_id, data_emprestimo, "
                + "dat_devolucao) VALUES(?,?,?,?,?)");
                st.setInt(1, codigo);
                st.setString(2, idLivro);
                st.setString(3, idCliente);
                st.setString(4, dataEmpreStr);
                st.setString(5, dataDevoStr);
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

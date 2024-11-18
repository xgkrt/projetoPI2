<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Emprestimos</title>
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            String nome;
            nome = request.getParameter("nome");
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conecta.prepareStatement("select emprestimos.ind_emprestimos, clientes.nome, clientes.email, "
                        + "clientes.telefone, livros.titulo,  date_format(emprestimos.data_emprestimo, '%d-%m-%Y'),  "
                        + "date_format(emprestimos.dat_devolucao, '%d-%m-%Y') from emprestimos inner join livros "
                        + "on emprestimos.livro_id = livros.id_livros inner join clientes on emprestimos.cliente_id = clientes.id_clientes "
                        + "where nome like ? order by nome;");
                st.setString(1, "%" + nome + "%");
                ResultSet resultado = st.executeQuery();
        %>
        <table border="1">
            <tr>
                <th>Código</th><th>Nome</th><th>Email</th><th>Telefone</th><th>Titulo do livro</th><th>Data do Emprestimo</th><th>Data da Devolução</th><th>Exclusão</th><th>Alteração</th>
            </tr>
            <%
                while (resultado.next()) {
            %>
            <tr>
                <td><%= resultado.getString("emprestimos.ind_emprestimos")%></td>
                <td><%= resultado.getString("clientes.nome")%></td>
                <td><%= resultado.getString("clientes.email")%></td>
                <td><%= resultado.getString("clientes.telefone")%></td>
                <td><%= resultado.getString("livros.titulo")%></td>
                <td><%= resultado.getString("date_format(emprestimos.data_emprestimo, '%d-%m-%Y')")%></td>
                <td><%= resultado.getString("date_format(emprestimos.dat_devolucao, '%d-%m-%Y')")%></td>
                <td><a href="../JSPEmprestimos/excluir_emprestimos.jsp?codigo=<%= resultado.getString("emprestimos.ind_emprestimos")%>">Excluir</a></td>
                <td><a href="../JSPEmprestimos/carrega_emprestimos.jsp?codigo=<%= resultado.getString("emprestimos.ind_emprestimos")%>">Alterar</a></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch (Exception e) {
                out.print("Mensagem de erro: " + e.getMessage());
            }
        %>
    </body>
</html>

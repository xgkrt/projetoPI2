<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Listar clientes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");
                
                st = conecta.prepareStatement("select emprestimos.ind_emprestimos, clientes.nome, livros.titulo, clientes.email, clientes.telefone,"
                + " date_format(emprestimos.data_emprestimo, '%d-%m-%Y'), "
                + "date_format(emprestimos.dat_devolucao, '%d-%m-%Y') "
                + "from emprestimos inner join livros on emprestimos.livro_id = livros.id_livros "
                + "inner join clientes on emprestimos.cliente_id = clientes.id_clientes;");
                ResultSet resultado = st.executeQuery();
        %>
                <table border="1">
                            <tr>
                                <th>Código</th><th>Titulo do Livro</th><th>Nome do Cliente</th><th>Email</th><th>Telefone</th><th>Data Emprestimo</th><th>Data Devolução</th><th>Exclusão</th><th>Alteração</th>
                            </tr>
        <%
                while (resultado.next()) {                        
        %>
            <tr>
                <td><%= resultado.getString("emprestimos.ind_emprestimos") %></td>
                <td><%= resultado.getString("livros.titulo") %></td>
                <td><%= resultado.getString("clientes.nome") %></td>
                <td><%= resultado.getString("clientes.email") %></td>
                <td><%= resultado.getString("clientes.telefone") %></td>
                <td><%= resultado.getString("date_format(emprestimos.data_emprestimo, '%d-%m-%Y')") %></td>
                <td><%= resultado.getString("date_format(emprestimos.dat_devolucao, '%d-%m-%Y')") %></td>
                <td><a href="../JSPEmprestimos/excluir_emprestimos.jsp?codigo=<%= resultado.getString("emprestimos.ind_emprestimos") %>">Excluir</a></td>
                <td><a href="../JSPEmprestimos/carrega_emprestimos.jsp?codigo=<%= resultado.getString("emprestimos.ind_emprestimos") %>">Alterar</a></td>
            </tr>
        <%
                }
        %>
            </table>
        <%        
            } catch(Exception e){
                out.print("Mensagem de erro: " + e.getMessage());
            }
        %>                    
    </body>
</html>

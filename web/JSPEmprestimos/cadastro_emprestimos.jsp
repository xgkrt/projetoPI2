<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="pt-bt">
    <head>
        <title>Cadastro livros</title>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
    </head>
    <body class="quadro">
        <%
            try {
                Connection conecta;
                PreparedStatement st, st2;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conecta.prepareStatement("SELECT nome, id_clientes FROM clientes ORDER BY nome");
                ResultSet resultado = st.executeQuery();

                st2 = conecta.prepareStatement("SELECT titulo, id_livros FROM livros ORDER BY titulo");
                ResultSet resultado2 = st2.executeQuery();
        %>
        <form method="post" action="../JSPEmprestimos/salvar_emprestimos.jsp">
            <div>
                <label for="codigoEmpre" >Código do Emprestimo:</label>
                <input type="number" name="codigoEmpre" id="codigoEmpre" required>
            </div>
            <div>
                <div  class="inputs">
                    <label for="titulo" >Titulo do Livro:</label>
                    <select name="titulo" id="titulo">
                        <%
                            while (resultado2.next()) {
                        %>
                        <option value="<%=resultado2.getString("id_livros")%>"><%= resultado2.getString("titulo")%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <div>
                <div  class="inputs">
                    <label for="nome" >Nome do Cliente:</label>
                    <select name="nome" id="nome">
                        <%
                            while (resultado.next()) {
                        %>
                        <option value="<%=resultado.getString("id_clientes")%>"><%= resultado.getString("nome")%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <div>
                <label for="dataEmpre" >Data do Emprestimo:</label>
                <input type="date" name="dataEmpre" id="dataEmpre" required>
            </div>
            <div>
                <label for="dataDevo" >Data da Devolução:</label>
                <input type="date" name="dataDevo" id="dataDevo" required>
            </div>
            <div>
                <input type="submit" value="Salvar">
            </div>
        </form>
        <%
            } catch (Exception e) {
                out.print("Mensagem de erro: " + e.getMessage());
            }
        %>
    </body>
</html>

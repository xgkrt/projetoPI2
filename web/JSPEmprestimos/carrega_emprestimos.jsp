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
        <title>Carrega emprestimos</title>
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
                PreparedStatement st, st2, st3;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");
                st = conecta.prepareStatement("SELECT * FROM emprestimos WHERE ind_emprestimos=?");
                st.setString(1, codigo);
                
                ResultSet resultado = st.executeQuery();
                
                st2 = conecta.prepareStatement("SELECT nome, id_clientes FROM clientes ORDER BY nome");
                ResultSet resultado2 = st2.executeQuery();
                
                st3 = conecta.prepareStatement("SELECT titulo, id_livros FROM livros ORDER BY titulo");
                ResultSet resultado3 = st3.executeQuery();
                
                

                if (!resultado.next()) {
                    out.print("<p class='resposta'>Este livro não está cadastrado</p>");
                } else {
        %>
        <form method="post" action="../JSPEmprestimos/alterar_emprestimos.jsp">
            <div>
                <label for="codigoEmpre" >Código do Emprestimo:</label>
                <input type="number" name="codigoEmpre" id="codigoEmpre" value="<%= resultado.getString("ind_emprestimos")%>" readonly required>
            </div>
            <div>
                <div  class="inputs">
                    <label for="titulo" >Titulo do Livro:</label>
                    <select name="titulo" id="titulo">
                        <%
                            while (resultado3.next()) {
                        %>
                        <option name="titulo" id="titulo" value="<%=resultado3.getString("id_livros")%>"><%= resultado3.getString("titulo")%></option>
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
                            while (resultado2.next()) {
                        %>
                        <option name="nome" id="nome" value="<%=resultado2.getString("id_clientes")%>"><%= resultado2.getString("nome")%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <div>
                <label for="dataEmpre" >Data do Emprestimo:</label>
                <input type="date" name="dataEmpre" id="dataEmpre" value="<%= resultado.getString("data_emprestimo")%>" required>
            </div>
            <div>
                <label for="dataDevo" >Data da Devolução:</label>
                <input type="date" name="dataDevo" id="dataDevo" value="<%= resultado.getString("dat_devolucao")%>" required>
            </div>
            <div>
                <input type="submit" value="Salvar">
            </div>
        </form>
        <%  }
            }catch(Exception e){
               out.print("Mensagem de erro: " + e.getMessage());
            }
        %>
    </body>
</html>
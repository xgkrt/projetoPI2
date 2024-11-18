<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Cadastro Usuário</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../style.css"/>
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/225/225993.png" type="image/x-icon">
    </head>
    <body class="fundo">
        <header>
            <div class="caixa">
                <div class="caixa-texto">
                    <p>Biblioteca</p>
                </div>
                <div class="logo">
                    <img src="https://cdn-icons-png.flaticon.com/512/225/225993.png" alt="alt"/>
                </div>
            </div>
        </header>
        <nav>
            
        </nav>
        <main>
            <%
                String u, s, n;
                Connection conn;
                PreparedStatement st;
                u = request.getParameter("usuario");
                s = request.getParameter("senha");
                n = request.getParameter("nome");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                    st = conn.prepareStatement("INSERT INTO users value(?,?,?)");
                    st.setString(1, u);
                    st.setString(2, s);
                    st.setString(3, n);
                    st.executeUpdate();
                    out.print("<p class='resposta'>Usuário Cadastrado com Sucesso</p>");
                } catch (SQLException erro) {
                    if (erro.getMessage().contains("Duplicate entry")) {
                        out.print("<p class='resposta'>Este Usuário já está Cadastrado</p>");
                    }
                } catch (Exception x) {
                    out.print("Error: " + x.getMessage());
                }
            %>
            <div class="voltar">
                <a href="../index.html">Logar</a>
            </div>
        </main>
        <footer>
            <p class="descricao">Desenvolvido por:<br>Lucas Morato Guedes<br>Nicolas Moreira Lima do Nascimento</p>
        </footer>
    </body>
</html>

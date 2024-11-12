<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Biblioteca</title>
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
        <main>
            <%
                String usuario, senha;
                boolean abrir = false;
                Connection conn;
                PreparedStatement st;
                ResultSet resultado;

                usuario = request.getParameter("usuario");
                senha = request.getParameter("senha");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                    st = conn.prepareStatement("SELECT * FROM users WHERE usuario=? AND senha=?");
                    st.setString(1, usuario);
                    st.setString(2, senha);

                    resultado = st.executeQuery();
                    if (resultado.next()) {
                        //abrir = true;
                        response.sendRedirect("../JSPClientes/restrito.jsp?nome=" + resultado.getString("nome"));
                    } else {
                        out.print("<p class='resposta'>Usuário e/ou senha Inválidos</p>");
                    }
                } catch (Exception x) {
                    out.print("Error: " + x.getMessage());
                }
            %>
            <div class="voltar">
                <a href="../index.html">Logar</a>
            </div>
            <script>
//            var abr = <%= abrir%>;
//            if (abr){
//                window.open('restrito.jsp','_blank');
//            }
            </script>
        </main>
        <footer>
            <p class="descricao">Desenvolvido por:<br>Lucas Morato Guedes<br>Nicolas Moreira Lima do Nascimento</p>
        </footer>
    </body>
</html>

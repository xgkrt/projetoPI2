<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Validar Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body class="quadro">
        <%
            String usuario, senha;
            boolean abrir = false;
            Connection conn;
            PreparedStatement st;
            ResultSet resultado;
            
            usuario = request.getParameter("usuario");
            senha = request.getParameter("senha");
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "root", "");

                st = conn.prepareStatement("SELECT * FROM users WHERE usuario=? AND senha=?");
                st.setString(1,usuario);
                st.setString(2,senha);
                
                resultado = st.executeQuery();
                if(resultado.next()){
                    //abrir = true;
                    response.sendRedirect("restrito.jsp?nome=" + resultado.getString("nome"));
                } else {
                    out.print("<p class='resposta'>Usuário e/ou senha inválidos</p>");
                }
            }catch(Exception x) {
                out.print("Error: " + x.getMessage());
            }
        %>
        
        <script>
//            var abr = <%= abrir%>;
//            if (abr){
//                window.open('restrito.jsp','_blank');
//            }
        </script>
    </body>
</html>

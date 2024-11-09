<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
        <link rel="stylesheet" href="../style.css"/>
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/225/225993.png" type="image/x-icon">
    </head>
     <body class="fundo">
        <header>
            <div class="caixa">
                <div class="logo">
                    <img src="https://cdn-icons-png.flaticon.com/512/225/225993.png" alt="alt"/>
                </div>
                <div class="caixa-texto">
                    <p>Biblioteca</p>
                </div>
                <div id="saudacao">
                    <p>Bem Vindo !</p>
                </div>
            </div>
        </header>
        <nav>
            <a href="../pagesClientes/clientes.html">Clientes</a>
            <a href="../pagesLivros/livros.html">Livros</a>
            <a href="emprestimos.html">Emprestimos</a>
        </nav>
        <main>
            <img id="img" src="https://images.pexels.com/photos/2908984/pexels-photo-2908984.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="alt"/>
        </main>
        <footer>
            <p class="descricao">Desenvolvido por:<br>Lucas Morato Guedes<br>Nicolas Moreira Lima do Nascimento</p>
        </footer>
    </body>
</html>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Site Restrito</title>
        <link rel="stylesheet" href="style.css"/>
        <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/225/225993.png" type="image/x-icon">
    </head>
     <body class="fundo">
        <header>
            <div class="caixa-texto">
                <div class="logo">
                    <img src="https://cdn-icons-png.flaticon.com/512/225/225993.png" alt="alt"/>
                </div>
                <p>Biblioteca</p>
            </div>
            <div id="saudacao">
                <p>Bem Vindo</p>
            </div>
        </header>
        <nav>
            <a href="clientes.html">Clientes</a>
            <a href="livros.html" target="tela">Livros</a>
            <a href="emprestimos.html" target="tela">Emprestimos</a>
        </nav>
        <main>
            
        </main>
        <footer>
            <p class="descricao">Desenvolvido por: </p>
        </footer>
    </body>
</html>

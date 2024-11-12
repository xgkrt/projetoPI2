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
            <a href="../pagesEmprestimos/emprestimos.html">Emprestimos</a>
        </nav>
        <main>
            <h1 class="txt-ini">Serviços <img class="ic1" src="https://cdn-icons-png.flaticon.com/512/225/225993.png" alt="alt"/></h1><br>
            <ul>
                <li>Cadastro de Clientes <img class="ic" src="https://cdn-icons-png.flaticon.com/128/33/33308.png" alt="alt"/></li><br>
                <li>Livros <img class="ic" src="https://cdn-icons-png.flaticon.com/128/171/171322.png" alt="alt"/></li><br>
                <li>Emprestimos <img class="ic" src="https://cdn-icons-png.flaticon.com/128/686/686348.png" alt="alt"/></li>
            </ul>
        </main>
        <footer>
            <p class="descricao">Desenvolvido por:<br>Lucas Guedes<br>Nicolas Moreira</p>
        </footer>
    </body>
</html>
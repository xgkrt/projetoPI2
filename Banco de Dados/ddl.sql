create database Biblioteca;

use Biblioteca;

create table Users (
	usuario varchar(20) primary key,
    senha varchar(20),
    nome varchar(70)
);

create table Livros (
	id_livros int auto_increment primary key,
    titulo varchar(100),
    autor varchar(100),
    genero varchar(50)
); 

create table Clientes (
	id_clientes int auto_increment primary key,
    nome varchar(100) not null,
    telefone varchar(15),
    email varchar(100) unique
);

create table Emprestimos (
	ind_emprestimos int auto_increment primary key,
    livro_id int not null,
    cliente_id int not null,
    data_emprestimo date not null,
    dat_devolucao date,
    foreign key (livro_id) references Livros(id_livros),
    foreign key (cliente_id) references Clientes(id_clientes)
);

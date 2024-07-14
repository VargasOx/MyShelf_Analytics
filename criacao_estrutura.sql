

/* cria o banco de dados db_my_shelf */

--create database db_my_shelf

/* ativa o banco de dados db_my_shelf */

--USE db_my_shelf

/* cria a tabela de autores */

create table autores

(
    id_autor int not null IDENTITY (1,1) PRIMARY KEY,
    nome_autor varchar(250) not null,
    pais_autor varchar(250) not null,
    estado_autor varchar (250),
    sexo_autor varchar (10) not null,
    data_nascimento date,
    data_morte date,
    principal_obra varchar(250),
    data_cadastro date not null
)

/* cria a tabela de livros */

create table livros

(
    id_livro int not null IDENTITY (1,1) PRIMARY KEY,
    titulo varchar (250) not null,
    id_autor int not null,
    editora VARCHAR(250) not null,
    categoria varchar(250) not null,
    tipo_edicao varchar(250) not null,
    paginas int not null,
    idioma varchar (20) not null,
    isbn VARCHAR (50) not null,
    status_leitura VARCHAR (10) not null,
    data_conslusao date,
    ano_lancamento int,
    data_publicacao date not null,
    valor_compra FLOAT,
    data_cadastro date
)

/* cria a chave estrangeira id_autor na tabela livros */

alter table livros ADD CONSTRAINT fk_autor FOREIGN KEY (id_autor) REFERENCES autores (id_autor)


USE db_my_shelf

/* Insere o autor na tabela autores */

INSERT autores

    (
        nome_autor,
        pais_autor,
        estado_autor,
        sexo_autor,
        data_nascimento,
        data_morte,
        principal_obra,
        data_cadastro
    )

VALUES

    (
        /* nome_autor */        'Jose Saramago',
        /* pais_autor */        'Portugal',
        /* estado_autor */      null,
        /* sexo_autor */        'Masculino',
        /* data_nascimento */   cast('16/11/1922' as date),
        /* data_morte */        cast('18/06/2010' as date),
        /* principal_obra */    'Ensaio sobre a cegueira',
        /* data_cadastro */     GETDATE()
    )



/* Consulta o ID do autor caso ele já esteja cadastrado */

SELECT id_autor, nome_autor FROM autores WHERE nome_autor like 'Jose%'



/* insere o livro na tabela livros */

INSERT livros 

    (   titulo,
        id_autor,
        editora,
        categoria,
        tipo_edicao,
        paginas,
        idioma,
        isbn,
        status_leitura,
        data_conslusao,
        ano_lancamento,
        ano_publicacao,
        valor_compra,
        data_cadastro
    )

values 

(
   /* titulo */             'Historia do cerco de Lisboa',
    /* id_autor */          1,
    /* editoria */          'Companhia das letras',
    /* categoria */         'Romance',
    /* tipo_edicao */       'Brochura',
    /* paginas */           352,
    /* idioma */            'Portugues',
    /* isbn */              '978-85-7164-035-1',
    /* status_leitura */    'Em andamento',
    /* data_conslusao */    null,
    /* ano_lancamento */    1989,
    /* ano_publicacao */    2011,
    /* valor_compras */     55.00,
    /* data_cadastro */     GETDATE()

)


SELECT * FROM livros
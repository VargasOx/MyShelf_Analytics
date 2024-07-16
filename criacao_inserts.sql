USE db_my_shelf

/* Insere o autor na tabela autores */

INSERT autores

    (
        nome_autor,
        pais_autor,
        estado_autor,
        cidade_autor,
        sexo_autor,
        data_nascimento,
        data_morte,
        principal_obra,
        data_cadastro
    )

VALUES

    (
        /* nome_autor */        'Haruki Murakami',
        /* pais_autor */        'Japao',
        /* estado_autor */      null,--'Minas Gerais',
        /* cidade_autor */      'Kyoto',
        /* sexo_autor */        'Masculino',
        /* data_nascimento */   cast('12/01/1949' as date),
        /* data_morte */        null, --cast('28/12/2018' as date),
        /* principal_obra */    'Kafka a beira-mar',
        /* data_cadastro */     GETDATE()
    )


/* Consulta o ID do autor caso ele já esteja cadastrado */

-- SELECT id_autor, nome_autor FROM autores WHERE nome_autor like 'Jose%' 



/* reseta o identity da coluna de id */

-- DBCC CHECKIDENT (autores, RESEED, 8)



/* insere o livro na tabela livros */

INSERT livros 

    (   titulo,
        id_autor,
        editora,
        categoria,
        edicao,
        reimpressao,
        tipo_edicao,
        serie,
        colecao,
        paginas,
        idioma,
        tradutor,
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
   /* titulo */             'Norwegian Wood',
    /* id_autor */          10,
    /* editoria */          'Alfaguara',
    /* categoria */         'Romance',
    /* edicao */            1,                                                                      
    /* reimpressao */       null,
    /* tipo_edicao */       'Brochura',
    /* serie */             NULL,
    /* colecao */           NULL,
    /* paginas */           360,
    /* idioma */            'Portugues',
    /* tradutor */          'Jefferson Jose Teixeira',
    /* isbn */              '978-8560281527',
    /* status_leitura */    'Lido',
    /* data_conslusao */    null,--CAST('20/06/2024' AS date),
    /* ano_lancamento */    1987,
    /* ano_publicacao */    2008,
    /* valor_compras */     34.74,
    /* data_cadastro */     GETDATE()

)


/* reseta o identity da coluna de id */

-- DBCC CHECKIDENT (livros, RESEED, 1)






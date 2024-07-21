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
        /* nome_autor */        'Uma breve história da humanidade',
        /* pais_autor */        'Israel',
        /* estado_autor */      null,--'Minas Gerais',
        /* cidade_autor */      'Qiryat Atta',
        /* sexo_autor */        'Masculino',
        /* data_nascimento */   cast('24/02/1976' as date),
        /* data_morte */        null,--cast('14/06/1986' as date),
        /* principal_obra */    'Uma breve história da humanidade',
        /* data_cadastro */     GETDATE()
    )


/* Consulta o ID do autor caso ele já esteja cadastrado */

-- SELECT id_autor, nome_autor FROM autores WHERE nome_autor like 'Jose%' 

/* reseta o identity da coluna de id */

-- DBCC CHECKIDENT (autores, RESEED, 13)



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
   /* titulo */             'Uma breve história da humanidade',
    /* id_autor */          12,
    /* editoria */          'L&PM',
    /* categoria */         'História',
    /* edicao */            51,                                                                      
    /* reimpressao */       null,
    /* tipo_edicao */       'Brochura',
    /* serie */             NULL,
    /* colecao */           NULL,
    /* paginas */           446,
    /* idioma */            'Portugues',
    /* tradutor */          'Janaina Marcoantonio',
    /* isbn */              '978-85-254-3218-6',
    /* status_leitura */    'Em andamento',
    /* data_conslusao */    null,--CAST('20/06/2024' AS date),
    /* ano_lancamento */    2011,
    /* ano_publicacao */    2020,
    /* valor_compras */     34.90,
    /* data_cadastro */     GETDATE()

)


/* reseta o identity da coluna de id */

-- DBCC CHECKIDENT (livros, RESEED, 1)







import pyodbc as sql
import pandas as pd
import requests
from datetime import date


## cria a função para inserir as informações do autor

def insert_autor(nome_autor,pais_autor,estado_autor,cidade_autor,sexo_autor,data_nascimento,data_morte,principal_obra,data_cadastro):

    ## cria a conexão com o banco de dados SQL Server.

    conexao = sql.connect(  'DRIVER={ODBC Driver 17 for SQL Server};' 
                            'SERVER=LAPTOP-EI1CC4VU\SQLEXPRESS;' 
                            'DATABASE=db_my_shelf;'
                            'UID=;'
                            'PWD=;'
                            'TRUSTED_CONNECTION=yes'
                        )
    
    ## chama a conexão com o banco e utiliza o método cursor (obrigatório)
    
    cursor = conexao.cursor()

    insert_autor = 'INSERT autores(nome_autor,pais_autor,estado_autor,cidade_autor,sexo_autor,data_nascimento,data_morte,principal_obra,data_cadastro) VALUES (?,?,?,?,?,?,?,?,?)'

    infos = (nome_autor,pais_autor, estado_autor,cidade_autor,sexo_autor,data_nascimento,data_morte,principal_obra, data_cadastro)

    conexao.execute(insert_autor,infos)
    conexao.commit()
    conexao.close()





## cria a função para inserir as informações do livro

def insert_livro(titulo,id_autor,editora,categoria,edicao,reimpressao,tipo_edicao,serie,colecao,paginas,idioma,tradutor,isbn,status_leitura,data_conclusao,ano_lancamento,ano_publicacao,valor_compra,data_cadastro):

    ## cria a conexão com o banco de dados SQL Server.

    conexao = sql.connect(  'DRIVER={ODBC Driver 17 for SQL Server};' 
                            'SERVER=LAPTOP-EI1CC4VU\SQLEXPRESS;' 
                            'DATABASE=db_my_shelf;'
                            'UID=;'
                            'PWD=;'
                            'TRUSTED_CONNECTION=yes'
                        )
    
    ## chama a conexão com o banco e utiliza o método cursor (obrigatório)
    
    cursor = conexao.cursor()

    insert_livro = 'INSERT livros (titulo,id_autor,editora,categoria,edicao,reimpressao,tipo_edicao,serie,colecao,paginas,idioma,tradutor,isbn,status_leitura,data_conclusao,ano_lancamento,ano_publicacao,valor_compra,data_cadastro) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)'

    infos = (titulo,id_autor,editora,categoria,edicao,reimpressao,tipo_edicao,serie,colecao,paginas,idioma,tradutor,isbn,status_leitura,data_conclusao,ano_lancamento,ano_publicacao,valor_compra,data_cadastro)

    conexao.execute(insert_livro,infos)
    conexao.commit()
    conexao.close()






## cria a função para inserir a capa do livro na tabela capas

def insert_capa_livro():    

## cria a conexão com o banco de dados SQL Server.
    conexao = sql.connect('DRIVER={ODBC Driver 17 for SQL Server};' 
                      'SERVER=LAPTOP-EI1CC4VU\SQLEXPRESS;' 
                      'DATABASE=db_my_shelf;'
                      'UID=;'
                      'PWD=;'
                      'TRUSTED_CONNECTION=yes'
                    )


## chama a conexão com o banco e utiliza o método cursor (obrigatório)
## faz uma query pra saber qual foi o último id_livro e isbn cadastrado ( neste caso busca o maior id livro)
## armazena o resultado do id_livro e isbn nas variaveis id_ultimo_livro e isbn_ultimo_livro

    cursor = conexao.cursor()

    ultimo_livro_cadastrado = cursor.execute('SELECT TOP 1 id_livro, isbn FROM livros order by id_livro desc').fetchall()

    id_ultimo_livro= ultimo_livro_cadastrado[0][0]
    isbn_ultimo_livro = ultimo_livro_cadastrado[0][1]


## chama a api das capas dos livros e concatena com a variavel isbn_ultimo_livro
## armazena a resposta na variavel response já selecionando o campo url do dicionário do json que a API retorna

    url = 'https://bookcover.longitood.com/bookcover/'+isbn_ultimo_livro

    response = ''.join(requests.get(url).json()['url'])


## faz o insert das variáves id_ultimo_livro, isbn_ultimo_livro e response na tabela capas
## se utiliza de parâmetros na parte do values do código, e passa as variáveis para a variável values 
## o comando execute utiliza as duas varias veis criadas, insert_capa e values, como parametro para executar o insert
## executa o comando conexao.commit pois é obrigatório para comitar o insert na tabela
## finaliza a conexão com o banco de dados

    insert_capa = 'INSERT capas (id_capa,isbn,url_imagem) VALUES (?, ?, ?)'
    values = (id_ultimo_livro,isbn_ultimo_livro,response)


    conexao.execute(insert_capa,values)
    conexao.commit()
    conexao.close()

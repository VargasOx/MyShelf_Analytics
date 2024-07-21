import funcoes_insert
from datetime import date

## insere o autor

funcoes_insert.insert_autor('Teste','Teste','Teste','teste','feminino','2020/04/04','2018/03/18','A obra',date.today())

## insere o livro

funcoes_insert.insert_livro('Teste',13,'Globo','Romance',2,5,'Brochura',None,None,180,'Portugues','Marcelo Vargas',
'978-85-01-08140-7',"Não lido",None,2020,2006,30.90,date.today())

## insere a capa do livro

funcoes_insert.insert_capa_livro()



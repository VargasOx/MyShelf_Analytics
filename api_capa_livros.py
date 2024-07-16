import requests
import webbrowser

## codigo para busca unica

'''
ISBN = '9788575421130'

url = 'https://bookcover.longitood.com/bookcover/'+ISBN

response = requests.get(url).json()['url']

abrir_url = webbrowser.open(response,new = 2)

'''

## codigo com estrutura de repetição

ISBN = ['978-8535911091']

for i in ISBN:
    url = 'https://bookcover.longitood.com/bookcover/'+i
    response = requests.get(url).json()['url']
    abrir_url = webbrowser.open(response,new = 2)
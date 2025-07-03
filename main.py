# bibliotecas
import os
import mysql.connector as connector
from dotenv import load_dotenv
load_dotenv()

PASSWORD = os.getenv("PASSWORD")

# funções
def connect (): # função de conexão com o banco, retorna a conexão se tudo der certo
    return connector.connect(
        host="127.0.0.1",
        port=3306,
        user="root",
        password=PASSWORD,
        database="loja"
    )

#def CadastrarPessoa:

functions = [] # vetor que receberá todas as funções da loja

def CadastrarProduto(cursor):
    nome = input('Digite o nome do seu produto: ')
    preco = input('Digite o preco do seu produto: ')
    quantidade = input('Digite a quantidade dispónível no momento do seu produto: ')
    descricao = input('Dê uma descrição para o seu produto: ')
    peso = input('Digite o peso médio do seu produto: ')
    cor = input('Digite a cor disponível do seu produto (apenas uma): ')
    tamanho = input('Digite o tamanho do seu produto: ')
    tipo = input('Digite o tipo de roupa do seu produto: ')
    marca = input('Digite a marca do seu produto: ')
    
    cursor.execute("""
        INSERT INTO roupa(nome, preco, quantidade, descricao, peso, cor, tamanho, tipo, marca)
        VALUE (%s,%s,%s,%s,%s,%s,%s,%s,%s);
    """, [nome, preco, quantidade, descricao, peso, cor, tamanho, tipo, marca])
    
    print("\nCadastro de roupa feito com sucesso!\n")

functions.append(['Cadastre um produto', CadastrarProduto])

while True:

    print("   ---{ + LOJA DE ROUPA + }---\n")
    
    for function in functions:
        print(functions.index(function) + 1, " - ", function[0])

    try:
        
        responce = int(input("\nEscolha -> "))
        
        connection = connect()
        if connection.is_connected():
            
            cursor = connection.cursor()
            
            functions[responce - 1][1](cursor)
        
        connection.commit()
        cursor.close()
        connection.close()
        
    except connector.Error as error:
        print("\nAlgo deu errado!\n")
        
        print("Possível erro:", error, "\n")
        
    except:
        print("\nNúmero ou caractere inválido\n")

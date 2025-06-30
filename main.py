import mysql.connector as connector

def connect ():
    return connector.connect(
        host="127.0.0.1",
        port=3306,
        user="root",
        password="aluno",
        database="loja"
    )

def CadastrarProduto (cursor):
    
    nome = input("Digite o nome da sua roupa: ")
    quantidade = input("Digite a quantidade da sua roupa: ")
    peso = input("Digite o peso da sua roupa: ")
    descricao = input("Digite a descrição da sua roupa: ")
    cor = input("Digite a cor da sua roupa: ")
    tamanho = input("Digite o tamanho da sua roupa: ")

    cursor.execute("""
        INSERT INTO roupa (nome,quantidade,peso,descricao,cor,tamanho)
        VALUES (%s,%s,%s,%s,%s,%s)
    """, (nome,quantidade,peso,descricao,cor,tamanho))
    print("Cadastro feito com sucesso")
    

while True:

    print("\n   ---{ + LOJA DE ROUPA + }---\n")
    
    print("1 - cadastrar produto")

    responce = int(input("\n\nEscolha -> "))

    try:

        connection = connect()
        cursor = connection.cursor()

        if responce == 1:
            CadastrarProduto(cursor)
        else:
            print("valor inválido")

        connection.commit()
        cursor.close()
        connection.close()

    except connector.Error as error:
        print(error)
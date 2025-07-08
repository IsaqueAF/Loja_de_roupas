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
        database="ClothesStore"
    )

def GetUserId(cursor): # retorna o ID do usuário salvo no banco de dados ou cria um cadastro novo e retorna seu ID
    

# Execução inicial
print("   ---{ + LOJA DE ROUPA + }---\n")
CadastroDoUsuario = None

while True:
    try:
        connection = connect()
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            if CadastroDoUsuario:
                pass
            else:
                CadastroDoUsuario = GetUserId()
        
        connection.commit()
        cursor.close()
        connection.close()
        
    except connector.Error as error:
        print("\nAlgo deu errado!\n")
        print("Possível erro:", error, "\n")

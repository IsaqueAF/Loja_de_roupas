CREATE DATABASE loja;
USE loja;

-- produto
CREATE TABLE roupa (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    peso FLOAT NOT NULL,
    quantidade INT NOT NULL,
    descricao TEXT NOT NULL,
    cor VARCHAR(20) NOT NULL,
    tamanho VARCHAR(20) NOT NULL
);

-- pessoa
CREATE TABLE IF NOT EXISTS nivel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS contatos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telefone CHAR(14),
    telefone_de_emergencia CHAR(14) NOT NULL,
    email VARCHAR(70) NOT NULL
);

CREATE TABLE IF NOT EXISTS endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT,
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    CEP CHAR(9)
);

CREATE TABLE IF NOT EXISTS pessoa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contatos INT NOT NULL,
    endereco INT NOT NULL,
    nivel INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_de_nascimento VARCHAR(10) NOT NULL,
    CPF INT NOT NULL,
    FOREIGN KEY (nivel) REFERENCES nivel(id),
    FOREIGN KEY (contatos) REFERENCES contatos(id),
    FOREIGN KEY (endereco) REFERENCES endereco(id)
);

CREATE TABLE Vendedor (
	id,
	cargo,
	FOREIGN KEY (pessoa) REFERENCES pessoa(id),
	FOREIGN KEY (cargo) REFERENCES nivel(valor)
)
-- compra
CREATE TABLE compra (
	token INT AUTO_INCREMENT PRIMARY KEY,
    id_comprador INT,
    id_vendedor INT,
    hora VARCHAR(8),
    endereco_de_entrega INT,
    FOREIGN KEY (id_comprador) REFERENCES pessoa(id),
    FOREIGN KEY (id_vendedor) REFERENCES pessoa(id),
    FOREIGN KEY (endereco_de_entrega) REFERENCES endereco(id)
);

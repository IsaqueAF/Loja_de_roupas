-- DROP DATABASE loja; -- Se isso tá aqui, é por que eu esqueci de apagar

CREATE DATABASE IF NOT EXISTS loja;
USE loja;

-- produto
CREATE TABLE IF NOT EXISTS roupa (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    peso DECIMAL NOT NULL,
    quantidade INT NOT NULL,
    descricao TEXT NOT NULL,
    cor VARCHAR(20) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    preco FLOAT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    marca VARCHAR(20) NOT NULL
);

-- pessoa
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

CREATE TABLE IF NOT EXISTS dados_gerais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_de_nascimento VARCHAR(10) NOT NULL,
    CPF INT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contatos INT NOT NULL,
    endereco INT NOT NULL,
    dados_gerais INT NOT NULL,
    FOREIGN KEY (contatos) REFERENCES contatos(id),
    FOREIGN KEY (endereco) REFERENCES endereco(id),
    FOREIGN KEY (dados_gerais) REFERENCES dados_gerais(id)
);

CREATE TABLE IF NOT EXISTS vendedor (
	id INT AUTO_INCREMENT PRIMARY KEY,
    contatos INT NOT NULL,
    dados_gerais INT NOT NULL,
    data_de_contratacao VARCHAR(10) NOT NULL,
    codigo_de_matricula INT NOT NULL,
	FOREIGN KEY (contatos) REFERENCES contatos(id),
    FOREIGN KEY (dados_gerais) REFERENCES dados_gerais(id)
);

-- compra
CREATE TABLE IF NOT EXISTS carrinho (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    hora_e_data_da_compra VARCHAR(8) NOT NULL,
    endereco_entrega INT NOT NULL,
    preco_total INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id),
    FOREIGN KEY (endereco_entrega) REFERENCES endereco(id)
);

CREATE TABLE IF NOT EXISTS compra_unica (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_roupa INT NOT NULL,
    id_carrinho INT NOT NULL,
    quantidade INT,
    FOREIGN KEY (id_roupa) REFERENCES roupa(id),
    FOREIGN KEY (id_carrinho) REFERENCES carrinho(id)
);

SELECT * FROM roupa;

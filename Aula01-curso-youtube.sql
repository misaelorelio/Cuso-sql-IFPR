DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;
USE aula_banco;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado ( 
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL UNIQUE,
sigla CHAR(2) NOT NULL UNIQUE,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT coluna_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N'))
);


INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (2, "Paraná", "PR", 'S', '2022-08-24');
INSERT INTO estado (id, nome, sigla, ativo, data_cadastro) VALUES (3, "São Paulo", "SP", 'S', '2022-08-24');

INSERT INTO estado (nome, sigla) VALUES ("Paraná", "PR");
INSERT INTO estado (nome, sigla) VALUES ("São Paulo", "SP");

SELECT * FROM estado;

CREATE TABLE cidade (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(200) NOT NULL,
  data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo CHAR(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (id),
  estado_id INT NOT NULL,
  CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id),
  CONSTRAINT cidade_ativo_deve_ser_S_ou_N CHECK (ativo IN ('S', 'N')),
  CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
  );
  
  INSERT INTO cidade(nome, estado_id) VALUES ("Nova Esperança", 1);
  
  SELECT * FROM cidade;
  
#Aula 03
ALTER TABLE estado ADD COLUMN regiao INT;

SELECT * FROM estado;

DESCRIBE estado;
DESC estado;

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100) NOT NULL;

ALTER TABLE estado DROP COLUMN regia_estado;

ALTER TABLE estado ADD COLUMN regiao VARCHAR(100) NOT NULL DEFAULT 'Valor não informado';

ALTER TABLE estado MODIFY COLUMN regiao_estado VARCHAR(100) NOT NULL AFTER sigla;

ALTER TABLE estado CHANGE regiao regiao_estado VARCHAR(100) NOT NULL;

ALTER TABLE estado DROP CONSTRAINT coluna_ativo_deve_ser_S_ou_N;

ALTER TABLE estado MODIFY COLUMN ativo ENUM('S', 'N') NOT null;

insert into estado (nome, sigla, ativo) values ('Mato Grosso', 'MT', 'A');

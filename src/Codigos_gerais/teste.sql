CREATE TABLE Cidade (
	cidade_id int NOT NULL AUTO_INCREMENT primary key,
	cidade_nome varchar(255)
);

CREATE TABLE Pessoa (
	pessoa_id int primary key,
	pessoa_nome varchar(255) NOT NULL,
	pessoa_cidade int references Cidade(cidade_id)

);

INSERT INTO Cidade(cidade_id, cidade_nome) VALUES (1, 'Guaranesia');
INSERT INTO Cidade(cidade_id, cidade_nome) VALUES (2, 'Taubate');
INSERT INTO Pessoa(pessoa_id,pessoa_nome,pessoa_cidade) VALUES (1,'Fabiana', 1);

SELECT * FROM Pessoa
INNER JOIN Cidade on (Pessoa.pessoa_cidade = Cidade.cidade_id);

UPDATE Pessoa SET pessoa_cidade = 2 WHERE pessoa_id = 1;

CREATE TABLE sal_emp (
    nome               text,
    pagamento_semanal  integer[],
    agenda             text[][]
);
INSERT INTO sal_emp
    VALUES ('Bill',
    '{10000, 10000, 10000, 10000}',
    '{{"reunião", "almoço"}, {"treinamento", "apresentação"}}');

INSERT INTO sal_emp
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"café da manhã", "consultoria"}, {"reunião", "almoço"}}');


CREATE TABLE minha_tabela(f1 int, f2 float, f3 text);

CREATE FUNCTION getf1(minha_tabela) RETURNS int AS 'SELECT $1.f1' LANGUAGE SQL;

-- Não é necessária nenhuma conversão, porque só existe uma getf1()
SELECT getf1(ROW(1,2.5,'isto é um teste'));


CREATE TYPE meu_tipo_de_linha AS (f1 int, f2 text, f3 numeric);

CREATE FUNCTION getf1(meu_tipo_de_linha) RETURNS int AS 'SELECT $1.f1' LANGUAGE SQL;

-- Agora é necessária uma conversão para indicar a função a ser chamada:
SELECT getf1(ROW(1,2.5,'isto é um teste'));
-- ERRO:  a função getf1(record) não é única

SELECT getf1(ROW(1,2.5,'isto é um teste')::minha_tabela);


SELECT getf1(CAST(ROW(11,'isto é um teste',2.5) AS meu_tipo_de_linha));

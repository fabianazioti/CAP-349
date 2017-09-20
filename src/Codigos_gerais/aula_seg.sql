CREATE TABLE curso
(
  curso_id SERIAL,
  titulo VARCHAR(30) NOT NULL,
  carga_horaria INTEGER NOT NULL,
  PRIMARY KEY(curso_id)
);

CREATE TABLE aluno
(
  matricula SERIAL,
  nome VARCHAR(40) NOT NULL,
  curso_id INTEGER NOT NULL,
  PRIMARY KEY(matricula),
  FOREIGN KEY(curso_id) REFERENCES curso(curso_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

INSERT INTO curso (titulo, carga_horaria) VALUES ('informatica', 4);
INSERT INTO curso (titulo, carga_horaria) VALUES ('matematica', 6);
INSERT INTO curso (titulo, carga_horaria) VALUES ('quimica', 2);
INSERT INTO curso (titulo, carga_horaria) VALUES ('biologia', 3);

INSERT INTO aluno (nome, curso_id) VALUES ('gilberto', 1);
INSERT INTO aluno (nome, curso_id) VALUES ('edison', 2);
INSERT INTO aluno (nome, curso_id) VALUES ('eduardo', 3);
INSERT INTO aluno (nome, curso_id) VALUES ('cassia', 4);


SELECT matricula, nome, titulo, carga_horaria FROM aluno, curso
WHERE aluno.nome = 'gilberto' AND aluno.curso_id = curso.curso_id;

SELECT * FROM aluno
INNER JOIN curso
ON aluno.nome = 'gilberto' AND aluno.curso_id = curso.curso_id;


UPDATE curso SET titulo = 'estatistica' WHERE titulo = 'matematica';


CREATE OR REPLACE VIEW aluno_curso
AS SELECT matricula,nome, titulo FROM aluno,curso
WHERE aluno.curso_id = curso.curso_id;


DELETE FROM curso WHERE titulo  = 'estatistica';


CREATE SCHEMA bdgeo;

CREATE TABLE bdgeo.curso
(
  curso_id SERIAL,
  titulo VARCHAR(30) NOT NULL,
  duracao INTEGER NOT NULL,
  PRIMARY KEY(curso_id)
);

CREATE TYPE geo_point AS
(
  x REAL,
  y REAL,
  srid INTEGER
);


CREATE TABLE sedes_municipais
(
  id SERIAL,
  location geo_point,
  PRIMARY KEY(id)
);

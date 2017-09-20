-- CODE BY POSTGRESQL TUTORIAL

CREATE TABLE cidades(
  nome text,
  populacao float,
  altitude int -- in feet
);

CREATE TABLE capital (
  estado char(2)
) INHERITS(cidades);

INSERT INTO cidades(nome, populacao, altitude) VALUES ('Guaranesia',20000,23,);
INSERT INTO capital(nome, populacao, altitude, estado) VALUES ('Belo Horizonte',124124,424,'MG');

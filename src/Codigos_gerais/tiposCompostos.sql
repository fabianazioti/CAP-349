
/*
cria um tipo de dado

*/
CREATE TYPE complexo AS(
  r double precision,
  i double precision
);
CREATE TYPE catalogo AS(
  nome text,
  id_fornecedor integer,
  preco numeric
);
-- Que depois podem ser utilizados em tabelas
CREATE TABLE estoque(
  item catalogo,
  contador integer
);

INSERT INTO estoque VALUES(ROW('dados de pno', 43, 1.99), 1000);

--- ou podem set empregados em funcoes

CREATE FUNCTION preco_quantidade(catalogo, integer)
RETURNS numeric
AS
$$
SELECT $1.preco * $2
$$
LANGUAGE SQL;

SELECT preco_quantidade(item, 10) FROM estoque;

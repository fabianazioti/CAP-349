-- CODE BY POSTGRESQL TUTORIAL


CREATE FUNCTION concat_lower_or_upper(a text, b text, uppercase boolean DEFAULT false)
RETURNS text
AS
$$
 SELECT CASE
        WHEN $3 THEN UPPER($1 || ' ' || $2)
        ELSE LOWER($1 || ' ' || $2)
        END;
$$
LANGUAGE SQL IMMUTABLE STRICT;


SELECT concat_lower_or_upper('Hello', 'World', true);


CREATE TABLE emp(
  nome text,
  salario numeric,
  idade integer,
  baia point
);

INSERT INTO emp(nome, salario,idade, baia) VALUES ('Joao', 2200, 21, point(1,1));
INSERT INTO emp VALUES('José',4200,30,point('(2,1)'));

CREATE FUNCTION dobrar_salario(emp) RETURNS numeric AS
$$
SELECT $1.salario * 2 AS salario;
$$ LANGUAGE SQL;

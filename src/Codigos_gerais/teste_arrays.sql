-- CODE BY POSTGRESQL TUTORIAL

CREATE TABLE produto(
  id_produto integer PRIMARY KEY,
  nome text,
  preco numeric
);

CREATE TABLE orders(
  id_order integer PRIMARY KEY,
  endereco text
);

CREATE TABLE orders_itens(
  id_produto integer REFERENCES produto ON DELETE RESTRICT,
  id_order integer REFERENCES orders ON DELETE CASCADE,
  quantidade integer,
  PRIMARY KEY(id_produto, id_order)
);


-- arrays

CREATE TABLE sal_empree (
    name            text,
    pay_by_quarter  integer[],
    schedule        text[][]
);

INSERT INTO sal_empree
    VALUES ('Bill',
    '{10000, 10000, 10000, 10000}',
    '{{"meeting", "lunch"}, {"training", "presentation"}}');

INSERT INTO sal_empree
    VALUES ('Carol',
    '{20000, 25000, 25000, 25000}',
    '{{"breakfast", "consulting"}, {"meeting", "lunch"}}');

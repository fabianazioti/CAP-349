CREATE TABLE test(
  nota int,
  nome varchar
);

SELECT * FROM test;

SELECT nota,
      CASE WHEN nota = 1 THEN 'one'
           WHEN nota = 2 THEN 'two'
           ELSE 'OTHER'
      END
FROM test;

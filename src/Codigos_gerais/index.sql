CREATE TABLE test1 (
  id SERIAL,
  content varchar NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO test1 (content) VALUES ('Inpe');
INSERT INTO test1 (content) VALUES ('ITA');
INSERT INTO test1 (content) VALUES ('Unesp');
INSERT INTO test1 (content) VALUES ('Unifesp');
INSERT INTO test1 (content) VALUES ('IEAv');


SELECT content FROM test1 where id  = 3;

CREATE INDEX test1_id_index ON test1 (id);

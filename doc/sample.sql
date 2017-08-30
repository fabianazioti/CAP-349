CREATE EXTENSION postgis;

CREATE EXTENSION postgisv2;


SELECT trajectory_elem(ST_GeomFromText('POINT(-71.064544 42.28787)'));

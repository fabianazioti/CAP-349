--shp2pgsql -i -s 4618 -W LATIN1 /home/../Documentos/Disciplina-BancoGeo/Dados-BDG/Minas/municipios/mg_municipios.shp mg_municipios >mg_municipios.sql


CREATE EXTENSION postgis_topology;
--\i /home/fabiana/Documentos/Disciplina-BancoGeo/Dados-BDG/Minas/municipios/mg_municipios.sql

-- nome e geometria do municipios que estao dentro do retangulo
SELECT nommuni, ST_AsText(geom) AS geom FROM mg_municipios WHERE geom && ST_MakeEnvelope(-46.557928,-18.330733, -45.382262,-16.691372, 4618);

--RECUPERANDO UM OBJETO A UMA CERTA DISTANCIA
SELECT nommuni, ST_AsText(geom) AS geom FROM mg_municipios WHERE ST_DWithin(geom, ST_GeomFromText('POINT(-45.970095 -17.5110525)', 4618), 1.0);


SELECT ST_Contains(ST_GeomFromText('POLYGON((0 2,1 1,0 -1,0 2))'),
ST_GeomFromText('POLYGON((-1 3,2 1,0 -3,-1 3))'));



--criar buffer
SELECT ST_AsText(ST_Buffer(ST_GeomFromText('LINESTRING(50 50,150 150,150 50)'), 10, 'endcap=round join=round'));

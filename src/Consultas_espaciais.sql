-- Os dados estao disponiveis em DADOS_BDG

SELECT ST_AsText(ST_Union(geom)) as geom from ba_municipios;

-- MUNICIPIOS VIZINHOS A SALVADOR

SELECT nome_munic FROM ba_municipios WHERE ST_Touches((SELECT geom FROM ba_municipios WHERE nome_munic = 'Salvador'), geom);

-- EM QUAL MUNICIPIO DA BAHIA FOI DETECTADO O MAIOR NUMERO DE FOCOS

SELECT municipio, COUNT(municipio) FROM focos
GROUP BY municipio
ORDER BY COUNT(municipio) DESC
LIMIT 1;

-- QUAIS AS AREAS DE TERRA INDIGENA NA BAHIA

SELECT nome_munic, nome FROM ba_municipios, terras_indigenas
WHERE ST_Intersects(ba_municipios.geom, terras_indigenas.geom);


-- FOCO DE INCENDIO EM TERRAS INDIGENAS

ALTER TABLE focos
ALTER COLUMN geom TYPE GEOMETRY(POINT,4674)
USING ST_Transform(geom,4674);

SELECT nome, COUNT(terras_indigenas.nome) FROM terras_indigenas, focos
WHERE ST_Intersects(terras_indigenas.geom, focos.geom)
GROUP BY terras_indigenas.nome;

-- FOCO DE INCENDIO EM TRECHO FERROVIARIO

SELECT gid, id, lat, lon FROM focos
WHERE
ST_Contains(
	(ST_Buffer(ST_Transform((SELECT geom FROM trecho_rodoviario
	 WHERE geodb_oid = 17420),25832), 1000)),
	(ST_Transform(focos.geom,25832))

);

-- DRENAGEM

SELECT geom FROM drenagem
WHERE ST_Contains((SELECT geom FROM ba_municipios WHERE nome_munic = 'Rafael Jambeiro' ) ,(drenagem.geom)
);

SELECT SUM( ST_length ( geom )) FROM drenagem
WHERE ST_Contains((SELECT geom FROM ba_municipios WHERE nome_munic = 'Rafael Jambeiro' ) ,(drenagem.geom)
);

SELECT SUM( ST_length (ST_Transform (geom, 4326) ))FROM drenagem WHERE ST_Contains((SELECT geom FROM ba_municipios WHERE nome_munic = 'Rafael Jambeiro' ), (drenagem.geom));

SELECT SUM( ST_length (ST_Transform (geom, 25832))/1000)FROM drenagem WHERE ST_Contains((SELECT geom FROM ba_municipios WHERE nome_munic = 'Rafael Jambeiro' ), (drenagem.geom));


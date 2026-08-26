CREATE DATABASE Desafio;
USE Desafio;

CREATE TABLE regioes(
id_regiao INT PRIMARY KEY,
nome VARCHAR(20),
estado VARCHAR(25),
turbinas INT,
potencial_estimado FLOAT
);

CREATE TABLE usinas(
id_usina INT PRIMARY KEY,
nome VARCHAR(25),
ano_fundacao INT,
tipo VARCHAR(40),
id_regiao INT,

FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao)
);

CREATE TABLE geracao(
id_geracao INT PRIMARY KEY,
geracao FLOAT,
ano INT,
mes INT,
id_usina INT,

FOREIGN KEY (id_usina) REFERENCES usinas(id_usina)
);

INSERT INTO regioes (id_regiao, nome, estado, turbinas, potencial_estimado)
VALUES
(1, 'Norte', 'Amapá', 10, 1348.91),
(2, 'Sul', 'Santa Catarina', 8, 1040.1),
(3, 'Sul', 'Paraná', 4, 890.88),
(4, 'Nordeste', 'Ceará', 20, 1820.99),
(5, 'Norte', 'Pará', 9, 1400.0),
(6, 'Nordeste', 'Piauí', 14, 1500.89),
(7, 'Centro-Oeste', 'Mato Grosso', 26, 2498.13),
(8, 'Norte', 'Acre', 2, 204.76),
(9, 'Sudeste', 'São Paulo', 30, 3090.56),
(10, 'Nordeste', 'Pernambuco', 5, 1189.8);

INSERT INTO usinas (id_usina, nome, ano_fundacao, tipo, id_regiao)
VALUES
(1, 'Usina Agouro', 2007, 'Hidrelétrica', 1),
(2, 'Usina Festa', 2000, 'Eólica', 2),
(3, 'Usina Kakaroto', 1980, 'Hidrelétrica', 3),
(4, 'Usina Santo Amaro', 2009, 'Hidrelétrica', 4),
(5, 'Usina Amargar', 1990, 'Solar', 5),
(6, 'Usina Wolverine', 1981, 'Nuclear', 6),
(7, 'Usina Sonserina', 2010, 'Eólica', 7),
(8, 'Usina Legado', 2012, 'Hidrelétrica', 8),
(9, 'Usina José Pacheco', 2009, 'Solar', 9),
(10, 'Usina Pica-Pau', 2017, 'Eólica', 10);

INSERT INTO geracao (id_geracao, geracao, ano, mes, id_usina)
VALUES
(1, 1450.09, 2024, 08, 1),
(2, 2090.11, 2001, 01, 2),
(3, 1900.90, 2005, 04, 3),
(4, 1140.59, 2012, 05, 4),
(5, 1892.99, 2020, 07, 5),
(6, 1490.19, 2025, 12, 6),
(7, 1380.14, 2009, 05, 7),
(8, 1470.79, 2023, 01, 8),
(9, 1560.91, 2021, 10, 9),
(10, 1770.9, 2026, 03, 10);

UPDATE regioes
SET estado = 'Paraíba'	
WHERE id_regiao = '10';

SELECT nome,estado
FROM regioes
WHERE potencial_estimado > 1500.0;

SELECT COUNT(*) AS quantidade_usinas
FROM usinas;

SELECT AVG(potencial_estimado) AS potencial_medio
FROM regioes;

SELECT SUM(turbinas) AS total_turbinas
FROM regioes;

SELECT tipo, COUNT(*) AS quantidade
FROM usinas
GROUP BY tipo;

SELECT tipo, COUNT(*) AS quantidade
FROM usinas
GROUP BY tipo
HAVING COUNT(*) >= 2;

SELECT 
    usinas.nome AS usina,
    regioes.estado
FROM usinas
JOIN regioes
    ON usinas.id_regiao = regioes.id_regiao;
    
    







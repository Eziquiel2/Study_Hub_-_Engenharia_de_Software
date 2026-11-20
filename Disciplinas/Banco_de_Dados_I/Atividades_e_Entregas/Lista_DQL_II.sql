
SELECT * FROM clientes_banco;

-- QUESTAO 1:

SELECT uf, COUNT(DISTINCT(id_cliente)) AS qtd_clientes_uf
FROM clientes_banco
GROUP BY UF
ORDER BY qtd_clientes_uf DESC

-- QUESTAO 2:

SELECT nome, SUM(saldo)
FROM clientes_banco
GROUP BY saldo, nome
ORDER BY saldo DESC

-- QUESTAO 3:

SELECT COUNT(DISTINCT(id_cliente)) as qtd
FROM clientes_banco

-- questao 4:

SELECT ROUND(AVG(renda_mensal),2) AS mediaRenda
FROM clientes_banco
WHERE segmento = 'Prime' AND data_referencia BETWEEN '2024-12-01' AND '2024-12-31'  

-- questao 5:

SELECT profissao, COUNT(DISTINCT(id_cliente)) as qtd
FROM clientes_banco
GROUP BY profissao
ORDER BY qtd DESC

-- QUESTAO 6:

SELECT data_referencia, COUNT(id_cliente) AS QTD
FROM clientes_banco
WHERE status_conta = 'Bloqueada'
GROUP BY data_referencia
ORDER BY qtd DESC

-- QUESTAO 7:

SELECT cidade, ROUND(AVG(saldo),2) AS media_saldo
FROM clientes_banco
WHERE data_referencia BETWEEN '2024-09-01' AND '2024-09-30'
GROUP BY cidade
--HAVING COUNT(*) >= 50
ORDER BY cidade-- --media_saldo DESC


-- QUESTAO 8:

SELECT SUM(saldo) AS total_saldo
FROM clientes_banco
WHERE segmento = 'Private' AND data_referencia BETWEEN '2024-12-01' AND '2024-12-31' 

-- questao 9:

SELECT agencia, COUNT(id_cliente) AS qtd_cliente
FROM clientes_banco
WHERE data_referencia BETWEEN '2024-12-01' AND '2024-12-31' 
GROUP BY agencia
ORDER BY qtd_cliente DESC


-- questao 10

SELECT data_referencia, SUM(saldo) AS saldo_total
FROM clientes_banco
GROUP BY data_referencia
ORDER BY saldo_total DESC
LIMIT 1;


-- QUESTRAO 11:

SELECT COUNT(status_conta) AS qtd_encerrad
FROM clientes_banco
WHERE status_conta = 'Encerrada' AND data_referencia BETWEEN '2024-01-01' AND '2024-12-31' 

select distinct(status_conta)
from clientes_banco


-- questao 12:

SELECT uf, ROUND(AVG(score_credito), 2) AS media_score
FROM clientes_banco
WHERE uf = 'DF'
GROUP BY uf


-- QUESTAO 13: ***********************************

SELECT COUNT(id_cliente) AS qtd
FROM clientes_banco
WHERE data_referencia BETWEEN '2024-03-01' AND '2024-03-31' 
	AND score_credito >= 70
	AND possui_cartao = 'false'


-- questao 14:

SELECT canal_preferido, COUNT(id_cliente) AS qtd, COUNT(*) AS total
FROM clientes_banco
GROUP BY canal_preferido


SELECT COUNT(canal_preferido) AS total
FROM clientes_banco
GROUP BY canal_preferido

SELECT COUNT(*) 
FROM clientes_banco
WHERE canal_preferido = 'App'

-- QUESTAO 15:

SELECT COUNT(DISTINCT(id_cliente)) AS qtd
FROM clientes_banco
WHERE data_abertura BETWEEN '2024-01-01' AND '2024-12-31' 

-- QUESTAO 16:

SELECT tipo_conta, ROUND(AVG(saldo), 2) AS saldo_medio
FROM clientes_banco
GROUP BY tipo_conta

-- questao 17:

SELECT MAX(limite_credito)
FROM clientes_banco
WHERE segmento = 'Varejo' AND data_referencia BETWEEN '2024-03-01' AND '2024-03-31' 


-- QUESTAO 18:

SELECT sexo, COUNT(*)
FROM clientes_banco
WHERE possui_investimento = 'true'
GROUP BY sexo


-- QUESTAO 19

SELECT uf, COUNT(DISTINCT(id_cliente)) AS qtd_clientes_uf
FROM clientes_banco
GROUP BY UF
ORDER BY qtd_clientes_uf ASC


-- QUESTAO 20:

SELECT COUNT(*) AS qtd
FROM clientes_banco
WHERE data_nascimento < '1960-01-01' 



SELECT * FROM clientes_banco;



X
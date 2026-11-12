-- Nome: Eziquiel Coelho de Oliveira RA: 22650851

-- Questão 01. Quantas linhas da tabela fato_vendas não têm cliente identificado (id_cliente vazio)?

SELECT COUNT(DISTINCT(id_venda)) AS qtd_null
FROM fato_vendas
WHERE id_cliente is null

-- Questão 02. Quantos clientes diferentes aparecem na tabela fato_vendas?

SELECT COUNT(DISTINCT(id_cliente)) AS qtd_clientes
FROM fato_vendas

-- Questão 03. Qual foi o faturamento total (soma de valor_total) de todas as vendas de 2025?

SELECT SUM(valor_total) AS faturamento_total
FROM fato_vendas
WHERE data_venda BETWEEN '2025-01-01' AND '2025-12-31'

-- Questão 04. Liste, sem repetição e em ordem alfabética, as marcas dos produtos da categoria Higiene.

SELECT DISTINCT(nome_produto)
FROM dim_produto
WHERE categoria = 'Higiene'
ORDER BY nome_produto ASC

-- Questão 05. Qual é o valor médio de valor_total das vendas do canal Aplicativo?

SELECT AVG(valor_total) AS media_faturamento_total
FROM fato_vendas
WHERE canal IN ('Aplicativo')

-- Questão 06. Quantos produtos da categoria Bebidas têm preco_tabela acima de R$ 10,00?

SELECT COUNT(DISTINCT(id_produto)) AS qtd_prod_acima_10
FROM dim_produto
WHERE categoria IN ('Bebidas') AND preco_tabela >= 10.00

-- Questão 07. Mostre o nome, a marca e o preço de tabela do produto mais caro do catálogo.
-- Em caso de empate no preço, traga o primeiro em ordem alfabética de nome.

SELECT DISTINCT(nome_produto), marca, preco_tabela
FROM dim_produto
ORDER BY preco_tabela DESC, nome_produto, marca 
LIMIT 1

-- Questão 08. Quantos produtos existem em cada categoria? Ordene da categoria com mais produtos
-- para a com menos; em caso de empate, por nome da categoria (A–Z).

SELECT categoria, COUNT(DISTINCT(id_produto)) AS qtd_por_categoria
FROM dim_produto
GROUP BY categoria
ORDER BY qtd_por_categoria DESC, categoria

-- Questão 09. Qual é o preço médio de tabela de cada categoria? ordene do maior preço médio para o menor.

SELECT DISTINCT(categoria) AS categoria, AVG(preco_tabela) AS preco_medio_categoria
FROM dim_produto
GROUP BY categoria
ORDER BY preco_medio_categoria DESC

-- Questão 10. Quantos clientes há em cada cidade? Mostre apenas as cidades com pelo menos 60
-- clientes, da maior quantidade para a menor; em caso de empate, por nome da cidade (A–Z).

-- **** com ajuda da IA para o HAVING ****

SELECT cidade, COUNT(DISTINCT(id_cliente)) AS qtd_clientes
FROM dim_cliente
GROUP BY cidade
HAVING COUNT(DISTINCT(id_cliente)) >= 60
ORDER BY qtd_clientes DESC, cidade


-- Questão 14. Quantas lojas existem em cada UF? Mostre apenas as UFs com mais de 3 lojas, 
-- da maior quantidade para a menor.

SELECT uf, COUNT(DISTINCT(id_loja)) AS qtd_lojas_uf
FROM dim_loja
GROUP BY uf
HAVING COUNT(DISTINCT(id_loja)) >= 3
ORDER BY qtd_lojas_uf DESC

-- Questão 15. Liste o nome, a cidade e a data de inauguração das lojas inauguradas antes de
-- 01/01/2007, da mais antiga para a mais recente.

SELECT nome_loja, cidade, data_inauguracao
FROM dim_loja
WHERE data_inauguracao <= '2007-01-01'
ORDER BY data_inauguracao

-- Questão 16. Qual foi o faturamento de cada canal de venda em 2025? Ordene do maior faturamento
-- para o menor.

SELECT canal, SUM(valor_total) AS faturamento_por_canal
FROM fato_vendas
WHERE data_venda 
GROUP BY canal

-- Questão 17. Considerando apenas o canal Loja física, mostre, para cada forma de pagamento, a
-- quantidade de linhas de venda e o faturamento. Ordene do maior faturamento para o menor.
-- **** com ajuda da IA para o COUNT(*) ****

SELECT forma_pagamento, COUNT(*) AS qtd, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE canal = 'Loja física'
GROUP BY forma_pagamento
ORDER BY faturamento DESC


-- Questão 18. Quais são os 10 produtos (id_produto) com mais unidades vendidas (soma de
-- quantidade)? Ordene da maior soma para a menor; em caso de empate, pelo menor id_produto.

SELECT DISTINCT(id_produto), SUM(quantidade) AS qtd_vendida
FROM fato_vendas
GROUP BY id_produto
ORDER BY qtd_vendida DESC, id_produto ASC
LIMIT 10;


-- Questão 19. Quais são as 5 lojas (id_loja) com maior faturamento em 2024? Mostre o id_loja e o
-- faturamento, do maior para o menor.

SELECT * FROM FATO_VENDAS

SELECT id_loja, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE data_venda BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY id_loja
ORDER BY faturamento DESC
LIMIT 5;

-- Questão 20. Quantas linhas de venda cada loja (id_loja) tem? Mostre apenas as lojas com mais de
-- 300 linhas, da maior quantidade para a menor.

SELECT id_loja, COUNT(*) AS qtd
FROM fato_vendas
GROUP BY id_loja
HAVING COUNT(*) >= 300
ORDER BY qtd DESC

-- Questão 21. Quais clientes (id_cliente) têm 70 ou mais linhas de venda? Mostre o id_cliente e
-- a quantidade, da maior para a menor; em caso de empate, pelo menor id_cliente. Desconsidere as
-- vendas sem cliente.
-- **** com ajuda da IA para o IS NOT NULL ****

SELECT id_cliente, COUNT(*) AS qtd
FROM fato_vendas
WHERE id_cliente IS NOT NULL
GROUP BY id_cliente
HAVING COUNT(*) >= 70
ORDER BY qtd DESC, id_cliente ASC


-- Questão 22. Quantas linhas de venda tiveram desconto (maior que zero) e qual foi o valor médio desse
-- desconto? Arredonde a média para 2 casas decimais.
-- **** com ajuda da IA para o ROUND ****
SELECT * FROM fato_vendas

SELECT COUNT(*) AS qtd, ROUND(AVG(desconto), 2) AS media_desconto
FROM fato_vendas
WHERE desconto > 0

-- Questão 23. Qual foi o menor e o maior valor_total de uma linha de venda em dezembro de
-- 2025?

SELECT MAX(valor_total) AS maior_valor, MIN(valor_total) AS menor_valor
FROM fato_vendas


-- Questão 24. Quantas linhas de venda foram registradas no dia 24/12/2025 e qual foi o faturamento
-- desse dia?

SELECT COUNT(*) as qtd_linhas, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE data_venda = '2025-12-24'

-- Questão 25. Considerando as vendas do canal Site em 2025 que tiveram desconto, mostre:
-- id_venda, o valor bruto (quantidade × preco_unitario), o desconto, o valor_total e o percentual
-- de desconto sobre o valor bruto. Ordene do maior percentual para o menor; em caso de empate, pelo
-- menor id_venda. Mostre apenas as 10 primeiras linhas.

SELECT id_venda, 
		quantidade * preco_unitario AS valor_bruto, 
		desconto, 
		valor_total, 
		ROUND ((((desconto / (quantidade * preco_unitario))) * 100), 2) AS percentual_desconto
FROM fato_vendas
WHERE canal = 'Site' AND data_venda BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY percentual_desconto DESC, id_venda ASC
LIMIT 10

SELECT * FROM dim_loja

SELECT * FROM fato_vendas

SELECT * FROM DIM_LOJA

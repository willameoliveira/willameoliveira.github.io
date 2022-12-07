-- 10) Liste os nomes dos produtos e o valor total em estoque de cada produto (valor unitário x 
-- estoque) ordenado por ordem decrescente de valor total.
select p.descricao,p.estoque*p.valor 
as valor_total 
from produto p 
order by valor_total desc; 

-- 11) Liste os nomes dos produtos, a data da venda e os valores de venda unitário (valor total da venda / quantidade vendida) 
-- de cada produto que contém o nome “sabão” ordenado por ordem decrescente de valor de venda.
select p.descricao, v.data_venda, round(v.total / quant_venda ) as  
`valores_de_venda_unitarios` from produto p natural join venda v 
where descricao like '%sabão%' order by `valores_de_venda_unitarios` desc;

-- 12) Liste o maior valor de venda do ano 2022.
select max(total) from venda where year(data_venda) = 2022; 

-- 13) Liste o menor valor unitário de produto.
select min(valor) from produto;

-- 14) Faça um relatório listando o nome do cliente e a quantidade total de compras feitas pelo cliente de cpf 12345676521.
select nome,count(cod_venda) from venda natural join cliente where cpf = '12345676521';

-- 15) Faça um relatório listando o valor total obtido em vendas e o valor médio das vendas no ano de 2022.
select  sum(total) 'total em vendas',avg(total)' média' 
from venda where year(data_venda)= 2022;

-- 16) Faça um relatório listando os nomes dos produtos e a quantidade vendida total agrupados por produto e ordenado 
-- por ordem decrescente de quantidade vendida total.
select descricao, sum(quant_venda) quant_vendida 
from produto natural left join venda group by descricao order by quant_vendida desc;

-- 17) Faça um relatório listando os nomes dos clientes, a quantidade total de compras feitas por cada cliente 
-- no ano de 2022 e o valor total dessas compras.
select nome,count(cod_venda),sum(total) from cliente natural join venda  
where data_venda like '%2022%' group by cpf;

-- 18) Faça um relatório listando os nomes dos produtos e o valor total obtido em vendas de cada produto no ano de 2022 
-- ordenados por ordem decrescente de valor total de venda.
select descricao, sum(total) total_venda from produto natural join venda where data_venda like '%2022%'
group by descricao order by total_venda desc;

-- 19) Liste o nome dos clientes cujo valor médio em compras é maior que 300 reais.
select nome, avg(total) media from cliente natural join venda group by nome having media < 30;
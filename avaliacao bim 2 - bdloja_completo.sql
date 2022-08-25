/*

O sistema precisa armazenar as informações de código e descrição dos produtos, nome, cpf e bairro dos clientes, 
os valores e quantidades dos produtos em estoque. Também deve registrar as vendas realizadas armazenando a data da venda, 
o produto vendido, qual cliente comprou, a quantidade vendida e o valor total da venda. Apenas um produto é vendido por vez.

*/
-- drop database bdloja;

create database bdloja;
use bdloja;

create table cliente(
cpf char(14),
nome varchar(30) not null,
bairro varchar(30),
primary key (cpf)
);
-- drop table cliente;

-- inserção correta
insert into cliente values ('006.678.533-20', 'Diego Oliveira', 'Bairro X');

-- tentando inserir sem o nome
-- Error Code: 1364. Field 'nome' doesn't have a default value
insert into cliente (cpf,bairro) values ('007.657.345-92', 'Bairro X');

-- select * from cliente;

-- drop table produto;
create table produto(
cod_produto char(5) primary key,
descricao varchar(50) not null,
valor decimal(5,2),
estoque int check(estoque >= 0) default 0
);
insert into produto (cod_produto,descricao,valor)
values ('DH5FR', 'Mouse sem fio', 39.90);

/* Error Code: 3819. Check constraint 'produto_chk_1' is violated. */
insert into produto values('12345', 'kitkat', 4.55, -5);

-- drop table venda;
create table venda(
cod_venda int auto_increment primary key,
cpf char(14),
cod_produto char(5),
data_venda timestamp not null, -- '2020-10-20 12:20:30'
quant_venda int,
total decimal(6,2),
constraint fk_cpf foreign key(cpf) references cliente(cpf),
constraint fk_cod_produto foreign key(cod_produto) references produto(cod_produto)
);
select * from venda;

-- inserção correta
insert into venda (cpf,cod_produto,data_venda,quant_venda,total) 
values ('006.678.533-20', 'DH5FR', '2022-08-24 09:00:00', 10, 399.90);


/*Error Code: 1452. Cannot add or update a child row: a foreign key 
constraint fails (`bdloja`.`venda`, CONSTRAINT `fk_cpf` FOREIGN KEY (`cpf`) 
REFERENCES `cliente` (`cpf`))
*/
insert into venda (cpf,cod_produto,data_venda,quant_venda,total) 
values ('006.678.533-21', 'DH5FR', '2022-08-24 09:00:00', 10, 399.90);

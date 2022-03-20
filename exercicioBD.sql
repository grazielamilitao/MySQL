/*Exercícios Banco de Dados*/
create database db_Supermercado_3b;
use db_Supermercado_3b;

create table Estado (
idestado int not null primary key,
nome varchar(100)
); 

create table Cidade (
idcidade int not null primary key,
nome varchar(100),
idestado_fk int not null,
foreign key (idestado_fk) references estado(idestado)
on update cascade
on delete restrict
); 

create table Endereco (
cod_end integer not null primary key,
rua_end varchar (300),
numero_end integer,
bairro_end varchar (100),
cidade_end varchar (100),
estado_end varchar (100)
); 

insert into Estado values (1, 'Rondônia');
insert into Estado values (2, 'São Paulo');
insert into Cidade values (1, 'Ji-Paraná',1),(2, 'Jaru',1),(3, 'Medici',1),(4, 'São Paulo',2);
insert into Cidade values (5, 'Porto Velho',1),(6, 'Ariquemes',1);


insert into Endereco values (1, 'Av. Brasil', 111, 'Nova Brasília', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (2, 'Av. Marechal Rondon', 1245, 'Centro', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (3, 'Rua Dr. Telma Rios', 1174, 'Colina Park I', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (4, 'Av. Aracaju', 911, 'BNH', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (5, 'Rua 07 de Setembro', 121, 'Dom Bosco', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (6, 'Rua Mato Grosso', 887, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (7, 'Av. Jorge Teixeira', 1589, 'Centro', 'Porto Velho', 'Rondônia');
insert into Endereco values (8, 'Av. Paulista', 989, 'Centro', 'São Paulo', 'São Paulo');
insert into Endereco values (9, 'Travessa dos Mineiros', 456, 'Centro', 'Ariquemes', 'Rondônia');
insert into Endereco values (10, 'Av. Monte Castelo', 555, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');

alter table Endereco add idcidade_fk int;
alter table Endereco add foreign key (idcidade_fk) references cidade(idcidade)
on update cascade
on delete restrict;
ALTER TABLE Endereco DROP COLUMN cidade_end;
ALTER TABLE Endereco DROP COLUMN estado_end;

update Endereco set idcidade_fk = 1 where cod_end = 1;
update Endereco set idcidade_fk = 1 where cod_end = 2;
update Endereco set idcidade_fk = 1 where cod_end = 3;
update Endereco set idcidade_fk = 1 where cod_end = 4;
update Endereco set idcidade_fk = 1 where cod_end = 5;
update Endereco set idcidade_fk = 1 where cod_end = 6;
update Endereco set idcidade_fk = 5 where cod_end = 7;
update Endereco set idcidade_fk = 4 where cod_end = 8;
update Endereco set idcidade_fk = 6 where cod_end = 9;
update Endereco set idcidade_fk = 1 where cod_end = 10;

create table sexo(
idsexo int not null primary key auto_increment,
sexo varchar(10) not null
);

insert into sexo (idsexo, sexo) values ('1', 'masculino');
insert into sexo (idsexo, sexo) values ('2', 'feminino');

create table Cliente (
cod_cli integer not null primary key,
nome_cli varchar (200) not null,
estadocivil_cli varchar (50),
cpf_cli varchar (20) not null,
rg_cli varchar (30),
sexo_cli varchar (30),
datanasc_cli date,
rendafamiliar_cli double,
telefone_cli varchar (50) not null,
celular_cli varchar (50) not null,
cod_end integer not null,
foreign key (cod_end) references Endereco (cod_end)
);

alter table Cliente drop column sexo_cli;
alter table Cliente add idsexo_fk int;
alter table Cliente add foreign key (idsexo_fk) references Sexo(idsexo)
on update cascade
on delete restrict;

insert into cliente values (1, 'Jackson Henrique da Silva Bezerra', 'Casado', '111.111.111-11', '54654 sesdec', 'Masculino', '1987-06-30', 
10000.00, '69 84085712', '69 84111111', 3);

insert into cliente values (2, 'Tony Stark', 'Casado', '111.111.111-22', '54654 sesdec', 'Masculino', '1965-1-1', 
456454.45, '', '', 8);

insert into cliente values (3, 'Capitão América', 'Solteiro', '111.111.111-33', '48877 sesdec', 'Masculino', '1950-05-30', 
0.00, '11 454546511', '', 1);

insert into cliente values (4, 'José Pereiro da Silva', 'Casado', '222.222.222-88', '8888888 spp', 'Masculino', '1990-11-12', 
900.00, '69 88998899', '69 4444 4444', 4);

insert into cliente values (5, 'Maria de Jesus dos Santos', 'Solteira', '554.454.444-99', '99999 sesdec', 'Feminino', '1993-06-21', 
3000.00, '69 3421 5511', '69 99111111', 3);

insert into cliente values (6, 'Camila de Oliveira', 'Casada', '987.123.654-55', '8889999 sesdec', 'Feminino', '2000-12-12', 
5450.00, '69 3421 1122', '69 9999 7788', 10);

insert into cliente values (7, 'Marcos Araujo de Souza', 'Casado', '654.789.123-88', '998877 sesdec', 'Masculino', '1970-01-01', 
6845.00, '69 84085712', '69 84111111', 9);

insert into cliente values (8, 'Cleiton Batista Ferraz', 'Solteiro', '321.111.222-44', '1234312 sesdec', 'Masculino', '1982-07-30', 
4199.00, '69 3421 2211', '69 84118811', 2);

insert into cliente values (9, 'Eliana da Cruz', 'Solteira', '988.235.654-54', '12345 sesdec', 'Feminino', '1978-11-11', 
3250.00, '69 3421 9999', '69 84118811', 5);

insert into cliente values (10, 'Igor Garcia da Silva', 'Solteiro', '123.445.888-99', '999992 sesdec', 'Masculino', '1989-12-30', 
9600.00, '69 3421 1123', '69 84118811', 3);

update Cliente set idsexo_fk = 1 where cod_cli=1;
update Cliente set idsexo_fk = 1 where cod_cli = 2;
update Cliente set idsexo_fk = 1 where cod_cli=3;
update Cliente set idsexo_fk = 1 where cod_cli = 4;
update Cliente set idsexo_fk = 2 where cod_cli=5;
update Cliente set idsexo_fk = 2 where cod_cli= 6;
update Cliente set idsexo_fk = 1 where cod_cli=7;
update Cliente set idsexo_fk = 1 where cod_cli = 8;
update Cliente set idsexo_fk = 2 where cod_cli=9;
update Cliente set idsexo_fk = 1 where cod_end = 10;

SET SQL_SAFE_UPDATES = 0;
/*SET SQL_SAFE_UPDATES = 1;*/

alter table Cliente add status_cli varchar(15);

update Cliente set status_cli = 'VIP' where rendafamiliar_cli>3000.00;
update Cliente set status_cli = 'Médio ' where rendafamiliar_cli>=1000.00 and rendafamiliar_cli<=2999.99;
update Cliente set status_cli = 'Simples ' where rendafamiliar_cli>=00.00 and rendafamiliar_cli<=999.99;
update Cliente set estadocivil_cli = 'Casada' where rendafamiliar_cli>1000.00 and idsexo_fk=2;
update Cliente set estadocivil_cli = 'Solteiro' where rendafamiliar_cli<1000.00 and idsexo_fk=1;

create table Departamento (
cod_dep integer not null primary key,
nome_dep varchar (100),
descrição_dep varchar (300)
);

insert into Departamento values (1, 'Vendas', 'Vender produtos no caixa');
insert into Departamento values (2, 'Financeiro', 'Controle Financeiro');
insert into Departamento values (3, 'Entrega', 'Entregar produtos para clientes');


create table Funcionario (
cod_func integer not null primary key,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
sexo_func varchar (30),
datanasc_func date,
salário_func double not null,
telefone_func varchar (50),
celular_func varchar (50) not null,
função_func varchar (50) not null,
cod_dep integer not null,
cod_end integer not null,
foreign key (cod_dep) references Departamento (cod_dep),
foreign key (cod_end) references Endereco (cod_end)
);


insert into funcionario values (1, 'João Eujacio Teixeira', '123.544.311-99', '22222 sesdec', 'Masculino', '1988-10-30', 
5000.00, '', '69 84111155', 'Gerente', 2, 3);

insert into funcionario values (2, 'Nick Fury', '565.888.988-88', '64444 sesdec', 'Masculino', '1965-1-20', 
45000.00, '', '', 'Vendedor', 1, 8);

insert into funcionario values (3, 'Roberto Carlos', '998.999.789-55', '46666 sesdec', 'Masculino', '1990-05-23', 
1500.00, '11 454546511', '', 'Vendedor', 1, 1);

insert into funcionario values (4, 'Mateus Solano', '522.222.232-08', '65655 spp', 'Masculino', '1990-11-30', 
900.00, '69 8855 5544', '69 5555 4444', 'Caixa', 1, 4);


update Funcionario set salário_func = salário_func+(salário_func*0.15) where salário_func>100;
update Funcionario set salário_func = salário_func+50 where função_func='Vendedor';

create table Fornecedor (
cod_forn integer not null primary key,
razãosocial_forn varchar (200),
nomefantasial_forn varchar (100),
representante_forn varchar (100),
cod_end integer not null,
foreign key (cod_end) references Endereco (cod_end)
);

insert into Fornecedor values (1, 'Takigawa Distribuidora LTDA', 'Takigawa Distribuidora', 'Tony', 5);
insert into Fornecedor values (2, 'Friocenter ME', 'Friocenter', 'Fabio', 1);
insert into Fornecedor values (3, 'Rical LTDA', 'Arroz Rical', 'Marcos', 2);
insert into Fornecedor values (4, 'Frigorífico Tangará LTDA', 'Frigorífico Tangará', 'Nilson', 3);

update Fornecedor set representante_forn = 'Tomas dos Santos' where razãosocial_forn= 'Takigawa Distribuidora LTDA';

create table Produto (
cod_prod integer not null primary key,
descrição_prod varchar (200) not null,
unidade_prod varchar (10),
quantestoque_prod integer not null,
marca_prod varchar (50),
cor_prod varchar (30),
peso_prod varchar (30),
valorcompra_prod double,
valorvenda_prod double not null,
datavencimento_prod date,
cod_forn integer not null,
foreign key (cod_forn) references Fornecedor (cod_forn)
);

insert into Produto values (1, 'Arroz 5kg', 'pct', 10, 'Tio Urbano', 'Branco', '5 quilos', 5.50, 12.50, '2020-01-01', 3);
insert into Produto values (2, 'Danoninho', 'band', 5, 'Danone', 'Vermelho', '200 gramas', 4.55, 9.99, '2016-09-01', 1);
insert into Produto values (3, 'Feijão 1kg', 'pct', 20, 'Tio Urbano', 'Marrom', '1 quilo', 3.99, 8.80, '2020-01-01', 1);
insert into Produto values (4, 'Carne Picanha', 'Kg', 80, 'Friboi', 'Vermelha', '', 20.00, 32.99, '2016-12-31', 4);
insert into Produto values (5, 'Camarão Agua Salgada', 'Kg', 20, 'Mar Azul', 'Laranja', '', 42.00, 88.00, '2016-12-31', 2);
insert into Produto values (6, 'Iogurt 1lt', 'lt', 15, 'Paulista', 'Roza', '1 litro', 4.99, 9.99, '2017-01-31', 2);
insert into Produto values (7, 'Carne Moída', 'kg', 100, 'Friboi', 'Vermelha',  '', 9.80, 14.80, '2016-12-31', 4);
insert into Produto values (8, 'Presunto Cozido', 'kg', 50, 'Sadia', 'Vemelho', '', 4.00, 10.00, '2016-12-31', 2);
insert into Produto values (9, 'Queijo Mussarela', 'kg', 50, 'Perdigão', 'Amarelo', '', 5.00, 11.00, '2016-12-31', 2);
insert into Produto values (10, 'Requeijão', 'pt', 10, 'Paulista', 'Branco', '200 gramas', 1.99, 5.99, '2016-08-31', 2);

update Produto set valorvenda_prod = valorvenda_prod+(valorvenda_prod*0.10) where cod_forn=2;
update Produto set quantestoque_prod = 0 where valorvenda_prod<5;
update Produto set quantestoque_prod = 10 where cod_prod=10;

create table Compra_Produto (
cod_comp integer not null primary key,
data_comp date,
valortotal_comp double,
formpag_comp varchar (100),
cod_func integer not null,
cod_forn integer not null,
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_forn) references Fornecedor (cod_forn)
);

insert into Compra_Produto values (1, '2016-09-01', 5999.50, '30 dias', 3, 1);
update Compra_Produto set valortotal_comp= valortotal_comp+(valortotal_comp*0.15) where formpag_comp='A vista';

create table Itens_Compra (
cod_itenscomp integer not null primary key,
quant_itenscomp integer not null,
valor_itenscomp integer not null,
cod_prod integer not null,
cod_comp integer not null,
foreign key (cod_prod) references Produto (cod_prod),
foreign key (cod_comp) references Compra_Produto (cod_comp)
);

/*PAREEEEEEEEEEEEEEEEEEEEI AQQQUUUUUUUUUUUUUUUUUUUUUUUUI*/

insert into Itens_Compra values (1, 5, 5.55, 6, 1);
insert into Itens_Compra values (2, 12, 10.80, 7, 1);
insert into Itens_Compra values (3, 9, 19.99, 4, 1);
insert into Itens_Compra values (4, 2, 6.55, 9, 1);



create table Caixa (
cod_caixa integer not null primary key,
dataabertura_caixa date not null,
datafechamento_caixa date,
saldoinicial_caixa double not null,
valorcréditos_caixa double,
valordébitos_caixa double,
saldofinal_caixa double
);

insert into Caixa values (1, '2016-08-26', null, 100.00, 200.00, 10.00, 290.00);

create table Venda (
cod_vend integer not null primary key,
data_vend date,
valortotal_vend double not null,
formpag_vend varchar (30),
cod_func integer not null,
cod_cli integer not null,
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_cli) references Cliente (cod_cli)
);

insert into Venda values (1, '2016-08-25', 50.00, 'Vista', 2, 1);
insert into Venda values (2, '2016-08-25', 250.00, 'Vista', 2, 2);
insert into Venda values (3, '2016-08-25', 10.00, 'Vista', 3, 8);

create table Itens_Venda (
cod_itensvend integer not null primary key,
quant_itensvend integer not null,
valor_itensvend integer not null,
cod_prod integer not null,
cod_vend integer not null,
foreign key (cod_prod) references Produto (cod_prod),
foreign key (cod_vend) references Venda (cod_vend)
);

insert into Itens_Venda values (1, 2, 12.50, 1, 1);
insert into Itens_Venda values (2, 1, 08.80, 3, 1);
insert into Itens_Venda values (3, 1, 88.00, 5, 1);
insert into Itens_Venda values (4, 3, 32.99, 4, 1);
insert into Itens_Venda values (5, 1, 5.99, 10, 2);
insert into Itens_Venda values (6, 4, 32.99, 4, 2);
insert into Itens_Venda values (7, 3, 14.80, 7, 2);
insert into Itens_Venda values (8, 9, 12.50, 1, 2);
insert into Itens_Venda values (9, 10, 11.00, 9, 3);
insert into Itens_Venda values (10, 2, 9.99, 2, 3);
insert into Itens_Venda values (11, 3, 10.00, 8, 3);
insert into Itens_Venda values (12, 1, 12.50, 1, 3);


create table Recebimentos (
cod_receb integer not null primary key,
data_receb date,
valordesconto_receb double,
cod_caixa integer not null,
cod_vend integer not null,
foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_vend) references Venda (cod_vend)
);

insert into Recebimentos values (1, '2016-09-01', 50.00, 1, 1);
insert into Recebimentos values (2, '2016-09-01', 38.00, 1, 2);
insert into Recebimentos values (3, '2016-09-01', 22.00, 1, 3);


create table Despesas (
cod_desp integer not null primary key,
descrição_desp varchar (200),
valor_desp double,
datavencimento_desp date,
númerodoc_desp integer
);

insert into Despesas values (1, 'Conta de Agua', 550, '2016-10-01', 1232);

create table Pagamentos (
cod_pag integer not null primary key,
data_pag date,
valordesconto_pag double,
formapagamento_pag varchar (100),
cod_caixa integer not null,
cod_desp integer not null,
cod_func integer not null,
foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_desp) references Despesas (cod_desp),
foreign key (cod_func) references Funcionario (cod_func)
);

insert into Pagamentos values (1, '2016-09-01', 0, 'Dinheiro', 1, 1, 3);


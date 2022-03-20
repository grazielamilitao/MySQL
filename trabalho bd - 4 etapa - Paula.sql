#Discente: Paula Graziela Militão Valadares
#Turma: 4ºB Inf
create database BD_Banco_Lista_PaulaGraziela;
use BD_Banco_Lista_PaulaGraziela;

create table Banco (
cod_ban int primary key not null auto_increment,
nome_ban varchar (200) not null
);

insert into Banco values (null, 'Caixa Econômica Federal');
insert into Banco values (null, 'Banco do Brasil');

create table Agencia (
cod_ag int primary key not null auto_increment,
numero_ag varchar (100) not null,
nome_ag varchar (100),
telefone_ag varchar (200),
cod_ban_fk int not null,
foreign key (cod_ban_fk) references Banco (cod_ban)
);

insert into Agencia values (null, '0951-2', 'Centro', '69 3421 1111', 2);
insert into Agencia values (null, '4402-1', 'Centro', '69 3422 2299', 2);
insert into Agencia values (null, '1824', 'Centro', '69 3423 1925', 1);
insert into Agencia values (null, '1920', 'Nova Brasilia', '69 3421 1122', 1);


create table Cliente (
cod_cli int primary key not null auto_increment,
nome_cli varchar (200) not null,
cpf_cli varchar (50) not null,
rg_cli varchar (100) not null,
sexo_cli varchar (1),
dataNasc_cli date not null,
renda_cli float not null,
endereco_cli varchar (300) not null,
email_cli varchar (300) not null,
telefone_cli varchar (200) not null
);

insert into Cliente values (null, 'Maria da Silva', '123.123.123-23', '1113322 sesdec/RO', 'F', '1990-10-10', 2500.00, 'Rua das Flores', 'maria.silva@hotmail.com', '3423 3333'); 
insert into Cliente values (null, 'Roberto Carlos', '789.789.789-89', '889977 sesdec/RO', 'M', '1975-01-10', 4990.00, 'Av. Costa', 'roberto.carlos@gmail.com', '8444 8899'); 
insert into Cliente values (null, 'Jane Pereira', '444.666.444-44', '005548 sesdec/RO', 'F', '1989-06-07', 1850.50, 'Rua Presidente', 'jane.pereira@hotmail.com', '9977 8899'); 
insert into Cliente values (null, 'Clodoaldo Bragança', '654.456.654-65', '654658 sesdec/RO', 'F', '1991-10-12', 9850.50, 'Av. Brasil', 'clodoaldo.bragança@gmail.com', '3423 5500'); 
insert into Cliente values (null, 'Livia de Souza', '333.444.666-98', '0033333 sesdec/RO', 'F', '1982-01-30', 1100.00, 'Av. Ji-Parana', 'livia.souza@hotmail.com', '8498 9898'); 
insert into Cliente values (null, 'Joab da Silva', '159.425.456-77', '001215 sesdec/RO', 'M', '2000-10-01', 4990.00, 'Av. Ji-Parana', 'joab.silva@hotmail.com', '69 8411 2321');
insert into cliente values (null, 'Rodrigo Hilbert', '123.445.888-99', '5592 sesdec', 'M', '1970-09-30', 2500.00, 'Rua Dr. Luiz', 'rodrigo.hilbert@yahoo.com.br', '9944 4545');
insert into cliente values (null, 'João Eujácio Teixeira Júnior', '999.445.789-99', '978999992 sesdec', 'M', '1989-01-10', 6000.00, 'Rua Silva Abreu', 'joao.eujacio@ifro.edu.br', '3421 1159');
insert into cliente values (null, 'Everton Feline', '123.123.888-99', '12392 sesdec', 'M', '1987-12-10', 11500.00, 'Rua Alencar Vieira', 'everton.feline@gmail.com','69 84228811');
insert into cliente values (null, 'Igor de Souza Santos', '123.345.848-99', '43299892 sesdec', 'M', '1990-12-30', 1000.00, 'Av. Brasil', 'igor.souza@gmail.com', '69 9977 7777');
insert into cliente values (null, 'Francisco Bezerra', '888.123.111-11', '213156 sesdec', 'M', '1965-01-30', 3500.00, 'Rua Fim do Mundo', 'francisco.bezerra@ifro.edu.br', '69 3423 5502');


create table Conta_Corrente (
cod_cc int primary key not null auto_increment,
numero_cc int not null,
dataAbertura_cc date not null,
saldo_cc float,
valorLimite_cc float not null,
saldoComLimite_cc float not null,
cod_ag_fk int not null,
cod_cli_fk int not null,
foreign key (cod_ag_fk) references Agencia (cod_ag),
foreign key (cod_cli_fk) references Cliente (cod_cli)
);

insert into Conta_Corrente values (null, 40650, '2009-01-01', 0.00, 100.00, 100.00, 1, 1);
insert into Conta_Corrente values (null, 41897, '2009-01-30', 0.00, 200.00, 200.00, 1, 2);
insert into Conta_Corrente values (null, 42487, '2010-06-06', 0.00, 200.00, 200.00, 1, 3);
insert into Conta_Corrente values (null, 43456, '2011-04-21', 0.00, 100.00, 100.00, 1, 4);
insert into Conta_Corrente values (null, 44787, '2012-12-31', 0.00, 100.00, 100.00, 1, 5);
insert into Conta_Corrente values (null, 45650, '2013-01-01', 0.00, 100.00, 100.00, 1, 6);
insert into Conta_Corrente values (null, 46897, '2014-01-30', 0.00, 300.00, 300.00, 1, 7);
insert into Conta_Corrente values (null, 47487, '2014-06-06', 0.00, 200.00, 200.00, 1, 8);
insert into Conta_Corrente values (null, 48456, '2015-04-21', 0.00, 100.00, 100.00, 1, 9);
insert into Conta_Corrente values (null, 280541, '2016-12-31', 0.00, 100.00, 100.00, 3, 10);
insert into Conta_Corrente values (null, 280191, '2016-12-31', 0.00, 100.00, 100.00, 3, 11);

create table Deposito (
cod_dep int primary key not null auto_increment,
valor_dep float not null,
data_dep date not null,
tipo_dep varchar (100),
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

insert into Deposito values (null, 500.00, '2011-03-21', 'Dinheiro', 1);
insert into Deposito values (null, 50.00, '2011-10-09', 'Dinheiro', 4);
insert into Deposito values (null, 1500.00, '2011-12-20', 'Cheque', 3);
insert into Deposito values (null, 125.00, '2011-06-11', 'Dinheiro', 5);
insert into Deposito values (null, 490.00, '2012-12-02', 'Dinheiro', 2);
insert into Deposito values (null, 1010.00, '2012-12-11', 'Cheque', 6);
insert into Deposito values (null, 120.00, '2016-01-30', 'Dinheiro', 7);
insert into Deposito values (null, 550.00, '2016-06-30', 'Dinheiro', 9);
insert into Deposito values (null, 80.00, '2016-10-23', 'Dinheiro', 10);
insert into Deposito values (null, 1000.00, '2016-11-08', 'Cheque', 10);

create table Saque (
cod_saq int primary key not null auto_increment,
valor_saq float not null,
data_saq date not null,
local_saq varchar (100) not null,
hora_saq time,
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

insert into Saque values (null, 100.00, '2014-11-12', 'Caixa Eletrônico', sysdate(), 5);
insert into Saque values (null, 200.00, '2014-12-11', 'Agência', sysdate(), 1);
insert into Saque values (null, 120.00, '2015-12-02', 'Caixa Eletrônico', sysdate(), 2);
insert into Saque values (null, 100.00, '2015-01-03', 'Caixa Eletrônico', sysdate(), 5);
insert into Saque values (null, 200.00, '2015-01-30', 'Caixa Eletrônico', sysdate(), 1);
insert into Saque values (null, 120.00, '2015-02-25', 'Agência', sysdate(), 6);
insert into Saque values (null, 100.00, '2016-01-07', 'Agência', sysdate(), 1);
insert into Saque values (null, 200.00, '2016-01-08', 'Caixa Eletrônico', sysdate(), 4);
insert into Saque values (null, 120.00, '2016-03-20', 'Caixa Eletrônico', sysdate(), 2);
insert into Saque values (null, 100.00, '2016-03-23', 'Agência', sysdate(), 7);
insert into Saque values (null, 200.00, '2016-05-09', 'Caixa Eletrônico', sysdate(), 4);
insert into Saque values (null, 120.00, '2016-06-16', 'Agência', sysdate(), 6);
insert into Saque values (null, 100.00, '2016-08-21', 'Caixa Eletrônico', sysdate(), 9);
insert into Saque values (null, 200.00, '2016-09-06', 'Caixa Eletrônico',sysdate(), 8);
insert into Saque values (null, 120.00, '2016-10-20', 'Caixa Eletrônico', sysdate(), 10);
insert into Saque values (null, 122.22, '2016-10-20', 'Agência', sysdate(), 2);

create table Transferencia (
cod_trans int primary key not null auto_increment,
valor_trans float not null,
data_trans date not null,
descricao_trans varchar (100),
cod_cc_origem_fk int not null,
cod_cc_destino_fk int not null,
foreign key (cod_cc_origem_fk) references Conta_Corrente (cod_cc),
foreign key (cod_cc_destino_fk) references Conta_Corrente (cod_cc)
);

insert into Transferencia values (null, 5100.00, '2010-01-01', 'Pagamento Pensão', 4, 1);
insert into Transferencia values (null, 150.00, '2011-09-20', 'Compra Moto', 2, 3);
insert into Transferencia values (null, 50.00, '2013-10-23', 'Pagamento Divida', 3, 1);
insert into Transferencia values (null, 1000.00, '2014-12-29', 'Mesada Filho', 10, 3);
insert into Transferencia values (null, 660.00, '2016-11-30', 'Divida Banco', 1, 9);
insert into Transferencia values (null, 340.00, '2016-10-10', 'Pagamento', 7, 6);

create table Pagamento (
cod_pag int primary key not null auto_increment,
valor_pag float not null,
data_pag date not null,
tipo_pag varchar (100),
dataVencimento_pag date not null,
codigoBarras_pag varchar (300),
cod_cc_fk int not null,
foreign key (cod_cc_fk) references Conta_Corrente (cod_cc)
);

insert into Pagamento values (null, 300.00, '2015-10-20', 'Boleto', '2015-10-20', '1212312111131', 1);
insert into Pagamento values (null, 54.00, '2015-01-20', 'Convênio', '2015-01-20', '787987987987', 2);
insert into Pagamento values (null, 89.00, '2016-06-20', 'Boleto', '2016-06-22', '6544678979', 1);
insert into Pagamento values (null, 321.00, '2016-10-20', 'Convênio', '2016-10-20', '156546465454', 2);
insert into Pagamento values (null, 123.00, '2016-11-08', 'Boleto', '2016-11-09', '132131564587', 1);

-- Atv. 1
update Conta_Corrente set saldo_cc= saldo_cc+(select sum(valor_dep) from deposito where conta_corrente.cod_cc=Deposito.cod_cc_fk);

-- Atv. 2
update Conta_Corrente set saldo_cc= saldo_cc-(select sum(valor_pag) from Pagamento where conta_corrente.cod_cc=Pagamento.cod_cc_fk) 
where (select sum(valor_pag) from Pagamento where conta_corrente.cod_cc=Pagamento.cod_cc_fk) is not null;

-- Atv. 3
update Conta_Corrente set saldo_cc= saldo_cc-(select sum(valor_saq) from Saque where conta_corrente.cod_cc=Saque.cod_cc_fk)
where (select sum(valor_saq) from Saque where conta_corrente.cod_cc=Saque.cod_cc_fk) is not null;

-- Atv. 4
update Conta_Corrente set saldo_cc= saldo_cc-(select sum(valor_trans) from Transferencia where conta_corrente.cod_cc=Transferencia.cod_cc_origem_fk)
where (select sum(valor_trans) from Transferencia where conta_corrente.cod_cc=Transferencia.cod_cc_origem_fk) is not null;

-- Atv. 5
update Conta_Corrente set saldo_cc= saldo_cc+(select sum(valor_trans) from Transferencia where conta_corrente.cod_cc=Transferencia.cod_cc_destino_fk)
where (select sum(valor_trans) from Transferencia where conta_corrente.cod_cc=Transferencia.cod_cc_destino_fk) is not null;

-- Atv. 6
update Conta_Corrente set saldoComLimite_cc= saldoComLimite_cc+(saldo_cc+valorLimite_cc) where (saldoComLimite_cc= saldoComLimite_cc+(saldo_cc+valorLimite_cc)) 
is not null;

-- Atv. 7
select Conta_Corrente.cod_cc as 'Código', 
Conta_Corrente.numero_cc as 'Número Conta Corrente', 
Conta_Corrente.dataAbertura_cc as 'Data', Conta_Corrente.saldo_cc as 'Saldo', 
Conta_Corrente.valorLimite_cc as 'Valor Limite da Conta', 
Conta_Corrente.saldoComLimite_cc as 'Saldo com Limite', 
Agencia.numero_ag as 'Código Agência', 
Cliente.nome_cli as 'Código Cliente' from Conta_Corrente 
inner join Agencia on Conta_Corrente.cod_ag_fk=Agencia.cod_ag 
inner join Cliente on Conta_Corrente.cod_cli_fk=Cliente.cod_cli;

-- Atv. 8
select 
Transferencia.cod_trans as 'Código', 
Transferencia.valor_trans as 'Valor Transferência', 
Transferencia.data_trans as 'Data Transferência', 
Transferencia.descricao_trans as 'Descrição Transferência', 
(select nome_cli from Cliente where Transferencia.cod_cc_origem_fk=Cliente.cod_cli) as 'Cliente Origem', 
(select nome_cli from Cliente where Transferencia.cod_cc_destino_fk=Cliente.cod_cli) as 'Cliente Destino' from Transferencia; 

-- Atv. 9
select Conta_Corrente.cod_cc as 'Código Conta Corrente', 
Conta_Corrente.numero_cc as 'Número Conta Corrente', 
Conta_Corrente.dataAbertura_cc as 'Data Conta Corrente', 
Conta_Corrente.saldo_cc as 'Saldo Conta Corrente', 
Conta_Corrente.valorLimite_cc as 'Valor Limite da Conta', 
Conta_Corrente.saldoComLimite_cc as 'Saldo com Limite', 
Agencia.numero_ag as 'Número da Agência', 
Cliente.nome_cli as 'Nome do Cliente', 
Agencia.cod_ag as 'Código Agência',
Agencia.numero_ag as 'Número Agência',
Agencia.nome_ag as 'Nome Agência',
Agencia.telefone_ag as 'Telefone Agência',
Banco.nome_ban as 'Banco da Agência'
from Conta_Corrente 
inner join Agencia on Conta_Corrente.cod_ag_fk=Agencia.cod_ag 
inner join Cliente on Conta_Corrente.cod_cli_fk=Cliente.cod_cli
inner join Banco on Agencia.cod_ban_fk=Banco.cod_ban;

-- Atv. 10 
select Cliente.nome_cli as 'Nome Cliente', 
(select sum(valor_pag) from Pagamento where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cc)=Pagamento.cod_cc_fk) as 'Soma dos Pagamentos',
(select avg(valor_pag) from Pagamento where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cc)=Pagamento.cod_cc_fk) as 'Média dos Pagamentos' from cliente;

-- Atv. 11
select Cliente.cod_cli as 'Código Cliente', 
Cliente.nome_cli as 'Nome Cliente', 
(select sum(valor_saq) from Saque where Cliente.cod_cli=Saque.cod_cc_fk) as 'Soma dos Saques do Cliente',
(select sum(valor_dep) from Deposito where Cliente.cod_cli=Deposito.cod_cc_fk) as 'Soma dos Depósitos do Cliente' from cliente;

-- Atv. 12
select Cliente.cod_cli as 'Código Cliente', 
Cliente.nome_cli as 'Nome Cliente', 
(select nome_ban from Banco where (select cod_ban_fk from Agencia where (select cod_ag_fk from Conta_Corrente where 
Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Agencia.cod_ag)=Banco.cod_ban) as 'Nome do Banco do Cliente' from cliente;

-- Atv. 13
select Cliente.nome_cli as 'Nome Cliente', 
(select numero_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) as 'Número Conta Corrente',
(select saldo_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) as 'Saldo Conta Corrente',
(select numero_ag from Agencia where (select cod_ag_fk from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Agencia.cod_ag) 
as 'Número da Agência do Cliente',
(select nome_ban from Banco where (select cod_ban_fk from Agencia where (select cod_ag_fk from Conta_Corrente where 
Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Agencia.cod_ag)=Banco.cod_ban) as 'Nome do Banco do Cliente' from cliente;

-- Atv. 14
select Cliente.nome_cli as 'Nome Cliente', 
(select numero_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) as 'Número Conta Corrente',
(select sum(valor_saq) from Saque where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Saque.cod_cc_fk) 
as 'Soma dos Saques do Cliente',
(select avg(valor_saq) from Saque where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Saque.cod_cc_fk) 
as 'Média dos Saques do Cliente',
(select max(valor_saq) from Saque where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Saque.cod_cc_fk) 
as 'Valor máximo sacado pelo Cliente',
(select min(valor_saq) from Saque where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Saque.cod_cc_fk) 
as 'Valor mínimo sacado pelo Cliente',
(select count(valor_saq) from Saque where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Saque.cod_cc_fk) 
as 'Quantidade de Saques realizados' from cliente;

-- Atv. 15
select Cliente.nome_cli as 'Nome Cliente', 
(select numero_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) as 'Número Conta Corrente',
(select sum(valor_dep) from Deposito where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Deposito.cod_cc_fk) 
as 'Soma dos Depósito do Cliente',
(select avg(valor_dep) from Deposito where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Deposito.cod_cc_fk) 
as 'Média dos Depósito do Cliente',
(select max(valor_dep) from Deposito where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Deposito.cod_cc_fk) 
as 'Valor máximo depositado pelo Cliente',
(select min(valor_dep) from Deposito where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Deposito.cod_cc_fk) 
as 'Valor mínimo depositado pelo Cliente',
(select count(valor_dep) from Deposito where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Deposito.cod_cc_fk) 
as 'Quantidade de Depósito realizados' from cliente;

-- Atv. 16
select Cliente.nome_cli as 'Nome Cliente', 
(select numero_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) as 'Número Conta Corrente',
(select sum(valor_pag) from Pagamento where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Pagamento.cod_cc_fk) 
as 'Soma dos Pagamentos do Cliente',
(select avg(valor_pag) from Pagamento where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Pagamento.cod_cc_fk) 
as 'Média dos Pagamentos do Cliente',
(select max(valor_pag) from Pagamento where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Pagamento.cod_cc_fk) 
as 'Valor máximo pago pelo Cliente',
(select min(valor_pag) from Pagamento where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Pagamento.cod_cc_fk) 
as 'Valor mínimo pago pelo Cliente',
(select count(valor_pag) from Pagamento where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Pagamento.cod_cc_fk) 
as 'Quantidade de Pagamentos realizados' from cliente;

-- Atv. 17
select Cliente.nome_cli as 'Nome Cliente', 
(select numero_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) as 'Número Conta Corrente',
(select sum(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_origem_fk) 
as 'Soma das Transferências Recebidas',
(select avg(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_origem_fk) 
as 'Média das Transferências Recebidas',
(select max(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_origem_fk) 
as 'Valor máximo recebido na Transferências',
(select min(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_origem_fk) 
as 'Valor mínimo recebido na Transferências',
(select count(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_origem_fk) 
as 'Quantidade de Transferências Recebidas' from cliente;

-- Atv. 18
select Cliente.nome_cli as 'Nome Cliente', 
(select numero_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) as 'Número Conta Corrente',
(select sum(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_destino_fk) 
as 'Soma das Transferências Enviadas',
(select avg(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_destino_fk) 
as 'Média dos Transferências Enviadas',
(select max(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_destino_fk) 
as 'Valor máximo enviado nas Transferências',
(select min(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_destino_fk) 
as 'Valor mínimo enviado nas Transferências',
(select count(valor_trans) from Transferencia where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Transferencia.cod_cc_destino_fk) 
as 'Quantidade de Transferências Enviadas' from cliente;

-- Atv. 19
select Cliente.nome_cli as 'Nome Cliente', 
(select numero_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) as 'Número Conta Corrente',
(select date_format(dataAbertura_cc, '%d/%m/%Y') from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) 
as 'Data de abertura da Conta Corrente' from cliente;

-- Atv. 20
select Cliente.nome_cli as 'Nome Cliente', 
(select round(sum(valor_dep),2) from Deposito where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Deposito.cod_cc_fk) 
as 'Soma dos Depósito do Cliente',
(select round(sum(valor_saq),2) from Saque where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Saque.cod_cc_fk) 
as 'Soma dos Saques do Cliente' from cliente;

-- Atv. 21
select Cliente.nome_cli as 'Nome Cliente',
(select nome_ban from Banco where (select cod_ban_fk from Agencia where (select cod_ag_fk from Conta_Corrente where 
Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Agencia.cod_ag)=Banco.cod_ban) as 'Nome do Banco do Cliente',
(select numero_ag from Agencia where (select cod_ag_fk from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Agencia.cod_ag) 
as 'Número da Agência do Cliente',
(select numero_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk) as 'Número Conta Corrente',
(select count(valor_dep) from Deposito where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Deposito.cod_cc_fk 
and (select saldo_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)>100) as 'Quantidade de Depósito realizados',
(select sum(valor_dep) from Deposito where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Deposito.cod_cc_fk
and (select saldo_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)>100) as 'Soma dos Depósito realizados',
(select count(valor_saq) from Saque where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Saque.cod_cc_fk
and (select saldo_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)>100) as 'Quantidade de Saques realizados',
(select sum(valor_saq) from Saque where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Saque.cod_cc_fk
and (select saldo_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)>100) as 'Soma dos Saques realizados',
(select count(valor_pag) from Pagamento where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Pagamento.cod_cc_fk
and (select saldo_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)>100) as 'Quantidade de Pagamentos realizados',
(select sum(valor_pag) from Pagamento where (select cod_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)=Pagamento.cod_cc_fk
and (select saldo_cc from Conta_Corrente where Cliente.cod_cli=Conta_Corrente.cod_cli_fk)>100) as 'Soma dos Pagamentos realizados'from cliente;
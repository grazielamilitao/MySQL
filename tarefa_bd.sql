create database tarefa1;
use tarefa1;

create table controle (
cod_cont int not null primary key auto_increment,
mes_cont varchar (100) not null,
totalrenda_cont float not null,
totalgastos_cont float not null,
saldofinal_cont float not null );

insert into controle values (null, 'Agosto/2018', 0.00, 0.00, 0.00 );

create table renda (
cod_ren int not null primary key auto_increment,
referencia_ren varchar (100) not null,
valor_ren float not null,
data_ren date,
cod_cont int not null,
foreign key (cod_cont) references Controle (cod_cont) );

create table gasto (
cod_gas int not null primary key auto_increment,
referencia_gas varchar (100) not null,
valor_gas float not null,
data_gas date,
cod_cont int not null,
foreign key (cod_cont) references Controle (cod_cont) );

delimiter $$
create procedure inserirRenda(referencia_ren varchar(100), valor_ren float, data_ren date, cod_cont int)
begin
	if(valor_ren>0)then
		insert into renda values (null, referencia_ren, valor_ren, data_ren, cod_cont);
	else
		select 'Renda insuficiente' as msg;
	end if;
end $$ delimiter ;

call inserirRenda('Algo',100,'2018-08-20',1);

delimiter $$
create procedure inserirGasto(referencia_gas varchar (100), valor_gas float, data_gas date, cod_cont int)
begin
	declare saldofinal_con double;
    select saldofinal_cont from controle where cod_cont=cod_cont into saldofinal_con;
	if((saldofinal_con+valor_gas)>0)then
		insert into gasto values (null, referencia_gas, valor_gas, data_gas, cod_cont);
		select 'O gasto foi inserido com sucesso!' as msg;
	else
		insert into gasto values (null, referencia_gas, valor_gas, data_gas, cod_cont);
        select saldofinal_con+valor_gas;
		select 'O saldo é negativo!' as msg;
	end if;
end $$ delimiter ;

call inserirGasto('Algo',10,'2018-08-21',1);

delimiter $$
create trigger insertRenda after insert on renda for each row
begin
    update controle set totalrenda_cont = (totalrenda_cont+new.valor_ren) where cod_cont=new.cod_cont;
    update controle set saldofinal_cont = (totalrenda_cont-totalgastos_cont) where cod_cont=new.cod_cont;
end $$ delimiter ;

delimiter $$
create trigger alterarRenda after update on renda for each row
begin
    update controle set totalrenda_cont = new.valor_ren where cod_cont=new.cod_cont;
    update controle set saldofinal_cont = (totalrenda_cont-totalgastos_cont) where cod_cont=new.cod_cont;
end $$ delimiter ;

delimiter $$
create trigger excluirRenda after delete on renda for each row
begin
    update controle set totalrenda_cont = (totalrenda_cont-old.valor_ren) where cod_cont=old.cod_cont;
    update controle set saldofinal_cont = (totalrenda_cont-totalgastos_cont) where cod_cont=old.cod_cont;
end $$ delimiter ;

#4.	Crie gatilhos na tabela Gastos que faça as seguintes ações após a inserção, alteração de valor e exclusão de registros:  
#c)	Atualize o total de gastos na tabela Controle;
#d)	Atualize o saldo final na tabela Controle;

delimiter $$
create trigger insertGasto after insert on gasto for each row
begin
    update controle set totalgastos_cont = (totalgastos_cont+new.valor_gas) where cod_cont=new.cod_cont;
    update controle set saldofinal_cont = (totalrenda_cont-totalgastos_cont) where cod_cont=new.cod_cont;
end $$ delimiter ;

delimiter $$
create trigger alterarGasto after update on gasto for each row
begin
    update controle set totalgastos_cont = new.valor_gas where cod_cont=new.cod_cont;
    update controle set saldofinal_cont = (totalrenda_cont-totalgastos_cont) where cod_cont=new.cod_cont;
end $$ delimiter ;

delimiter $$
create trigger excluirGasto after delete on gasto for each row
begin
    update controle set totalgastos_cont = (totalgastos_cont-old.valor_gas) where cod_cont=old.cod_cont;
	update controle set saldofinal_cont = (totalrenda_cont-totalgastos_cont) where cod_cont=old.cod_cont;
end $$ delimiter ;
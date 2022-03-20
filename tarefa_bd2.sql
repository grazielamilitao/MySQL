create database tarefabd;
use tarefabd;

create table Produto(
cod_pro int not null primary key auto_increment,
nome_pro varchar(100) not null,
estoque_pro int not null,
preço_pro double not null
);

create table Caixa(
cod_cai int not null primary key auto_increment,
créditos_cai double not null,
débitos_cai double not null,
saldo_cai double not null
);

create table Venda(
cod_ven int not null primary key auto_increment,
valor_ven double not null,
data_ven date not null,
cod_cai_ven int not null,
foreign key (cod_cai_ven) references caixa (cod_cai)
);

create table produto_venda(
cod_pro_ven int not null primary key auto_increment,
quant_prod int not null,
cod_pro int not null,
cod_ven int not null,
foreign key (cod_pro) references produto (cod_pro),
foreign key (cod_ven) references venda (cod_ven)
);

delimiter $$
create procedure inserirProduto(nome_pro  varchar(100), estoque_pro int, preço_pro double)
begin
	if(preço_pro>0 and (estoque_pro>0 && estoque_pro<1000)) then
		insert into produto values (null, nome_pro, estoque_pro, preço_pro);
	end if;
end $$ delimiter ;

call inserirProduto('Toddy',5,4.55);

delimiter $$
create procedure inserirCaixa(créditos_cai double, débitos_cai double, saldo_cai double)
begin
	declare valor double;
    select saldo_cai from caixa where cod_cai=last_insert_id() into valor;
    update caixa set créditos_cai=valor+créditos_cai where cod_cai=cod_cai;
    update caixa set débitos_cai=0 where cod_cai=cod_cai;
	insert into caixa values (null, créditos_cai, débitos_cai, saldo_cai);
end $$ delimiter ;
call inserirCaixa(40,10,50);

delimiter $$
create procedure inserirVenda(valor_ven double, data_ven date, cod_cai_ven int)
begin
	insert into venda values (null, 0, data_ven, cod_cai_ven); -- o gatilho que vai atualizar o valor da venda
end $$ delimiter ;

call inserirVenda(0,'2018-08-21',1);
call inserirVenda(0,'2018-08-22',1);

delimiter $$
create procedure inserirProd_Vend(quant_prod int, cod_pro int, cod_ven int)
begin
	declare quant_estoque int;
    select estoque_pro from produto where cod_pro=cod_pro into quant_estoque;
	if (quant_prod<=quant_estoque) then
		insert into produto_venda values (null, quant_prod, cod_pro, cod_ven);
	else 
		select 'O produto não possui a quantidade de estoque desejada!' as msq;
    end if;
end $$ delimiter ;

call inserirProd_Vend(5,1,1);

delimiter $$
create trigger atualizarCaixa before update on venda for each row
begin
    declare valor double;
	select valor_ven from venda where cod_ven=new.cod_ven into valor;
    update caixa set créditos_cai = créditos_cai - valor where cod_cai=new.cod_cai_ven;
    update caixa set créditos_cai=créditos_cai + new.valor_ven where cod_cai=new.cod_cai_ven;
    update caixa set saldo_cai = créditos_cai - débitos_cai where cod_cai=new.cod_cai_ven;
end $$ delimiter ;

delimiter $$
create trigger ajustarEstoque after insert on Produto_Venda for each row 
begin
	declare preço_p double;
    select preço_pro from produto where cod_pro=new.cod_pro into preço_p;
	update venda set valor_ven=preço_p*new.quant_prod where cod_ven=new.cod_ven;
    update produto set estoque_pro=estoque_pro-new.quant_prod where cod_pro=new.cod_pro;
end $$ delimiter ;

select*from produto;
select*from venda;
select*from Produto_Venda;
insert into Produto_Venda values (null,2,1,2);
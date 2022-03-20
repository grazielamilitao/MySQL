create database bd_hotel;
use bd_hotel;

create table Endereco (
cod_end integer not null primary key auto_increment,
rua_end varchar (300),
numero_end integer,
bairro_end varchar (100),
cidade_end varchar (100),
estado_end varchar (100)
); 

insert into Endereco values (null, 'Av. Brasil', 111, 'Nova Brasília', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Av. Marechal Rondon', 1245, 'Centro', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Rua Dr. Telma Rios', 1174, 'Colina Park I', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Av. Aracaju', 911, 'BNH', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Rua 07  de Setembro', 121, 'Dom Bosco', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Rua Mato Grosso', 887, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Av. Jorge Teixeira', 1589, 'Centro', 'Porto Velho', 'Rondônia');
insert into Endereco values (null, 'Av. Paulista', 989, 'Centro', 'São Paulo', 'São Paulo');
insert into Endereco values (null, 'Travessa dos Mineiros', 456, 'Centro', 'Ariquemes', 'Rondônia');
insert into Endereco values (null, 'Av. Monte Castelo', 555, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');


create table Cliente (
cod_cli integer not null primary key auto_increment,
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

insert into cliente values (null, 'Jackson Henrique da Silva Bezerra', 'Casado', '111.111.111-11', '54654 sesdec', 'Masculino', '1987-06-30', 
10000.00, '69 84085712', '69 84111111', 3);
insert into cliente values (null, 'Tony Stark', 'Casado', '111.111.111-22', '54654 sesdec', 'Masculino', '1965-1-1', 
456454.45, '', '', 8);
insert into cliente values (null, 'Capitão América', 'Solteiro', '111.111.111-33', '48877 sesdec', 'Masculino', '1950-05-30', 
0.00, '11 454546511', '', 1);
insert into cliente values (null, 'José Pereira da Silva', 'Casado', '222.222.222-88', '8888888 spp', 'Masculino', '1990-11-12', 
900.00, '69 88998899', '69 4444 4444', 4);
insert into cliente values (null, 'Maria de Jesus dos Santos', 'Solteira', '554.454.444-99', '99999 sesdec', 'Feminino', '1993-06-21', 
3000.00, '69 3421 5511', '69 99111111', 3);
insert into cliente values (null, 'Camila de Oliveira', 'Casada', '987.123.654-55', '8889999 sesdec', 'Feminino', '2000-12-12', 
5450.00, '69 3421 1122', '69 9999 7788', 10);
insert into cliente values (null, 'Marcos Araujo de Souza', 'Casado', '654.789.123-88', '998877 sesdec', 'Masculino', '1970-01-01', 
6845.00, '69 84085712', '69 84111111', 9);
insert into cliente values (null, 'Cleiton Batista Ferraz', 'Solteiro', '321.111.222-44', '1234312 sesdec', 'Masculino', '1982-07-30', 
4199.00, '69 3421 2211', '69 84118811', 2);
insert into cliente values (null, 'Eliana da Cruz', 'Solteira', '988.235.654-54', '12345 sesdec', 'Feminino', '1978-11-11', 
3250.00, '69 3421 9999', '69 84118811', 5);
insert into cliente values (null, 'Igor Garcia da Silva', 'Solteiro', '123.445.888-99', '999992 sesdec', 'Masculino', '1989-12-30', 
9600.00, '69 3421 1123', '69 84118811', 3);


create table Funcionario (
cod_func integer not null primary key auto_increment,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
sexo_func varchar (30),
datanasc_func date,
salário_func double not null,
telefone_func varchar (50),
celular_func varchar (50) not null,
função_func varchar (50) not null,
cod_end integer not null,
foreign key (cod_end) references Endereco (cod_end)
);

insert into funcionario values (null, 'João Eujacio Teixeira', '123.544.311-99', '22222 sesdec', 'Masculino', '1988-10-30', 
5000.00, '', '69 84111155', 'Atendente', 2);
insert into funcionario values (null, 'Paula Fernandes', '565.888.988-88', '64444 sesdec', 'Feminino', '1965-1-20', 
45000.00, '', '', 'Atendente', 1);
insert into funcionario values (null, 'Roberto Carlos', '998.999.789-55', '46666 sesdec', 'Masculino', '1990-05-23', 
1500.00, '11 454546511', '', 'Gerente', 5);


create table Produto (
cod_prod int primary key not null auto_increment,
descrição_prod varchar (200) not null,
quantidade_prod int,
valor_prod float,
dataValidade_prod date
);

insert into produto values (null, 'Agua Mineral Sem Gás 500ml', 50, 3.50, '2020-01-01');
insert into produto values (null, 'Chocolate em Barra 200gr', 30, 4.80, '2018-06-30');
insert into produto values (null, 'Cerveja Skol 350ml', 10, 4.50, '2019-01-01');

create table Quarto (
cod_qua int primary key not null auto_increment,
descrição_qua varchar (200) not null,
número_qua int not null,
tipo_qua varchar (100) not null,
valor_qua float
);

insert into quarto values (null, 'Apartamento Duplo', 100, 'Luxo', 200.00);
insert into quarto values (null, 'Apartamento Duplo', 101, 'Simples', 100.00);
insert into quarto values (null, 'Apartamento Individual', 201, 'Simples', 50.00);
insert into quarto values (null, 'Apartamento Tripo', 202, 'Simples', 150.00);


create table Produtos_quarto (
cod_pq int primary key not null auto_increment,
quantidade_pq int,
dataRecarga_pq date,
cod_qua int not null,
cod_prod int not null,
foreign key (cod_qua) references quarto (cod_qua),
foreign key (cod_prod) references produto (cod_prod)
);


insert into produtos_quarto values (null, 2, '2017-03-29', 1, 1);
insert into produtos_quarto values (null, 5, '2017-03-29', 1, 2);
insert into produtos_quarto values (null, 2, '2017-03-29', 1, 3);

insert into produtos_quarto values (null, 2, '2017-03-30', 2, 1);
insert into produtos_quarto values (null, 1, '2017-03-30', 2, 3);

insert into produtos_quarto values (null, 5, '2017-03-29', 3, 1);
insert into produtos_quarto values (null, 5, '2017-03-29', 3, 2);

create table Hospedagem (
cod_hosp int primary key not null auto_increment,
dataCheckin_hosp date,
dataCheckout_hosp date,
valorConsumo_hosp float,
valorDiárias_hosp float,
valorTotal_hosp float,
cod_cli int not null,
cod_func int not null,
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_func) references Funcionario (cod_func)
);


insert into hospedagem values (null, '2017-03-29', '2017-03-31', 25.00, 200.00, 0.00, 1, 1);
insert into hospedagem values (null, '2017-03-29', '2017-04-01', 10.00, 100.00, 0.00, 2, 1);
insert into hospedagem values (null, '2017-03-31', '2017-04-05', 15.00, 300.00, 0.00, 10, 1);


create table produtos_hospedagem (
cod_ph int primary key not null auto_increment,
cod_hosp int not null,
cod_prod int not null,
quant_ph int,
valorProd_ph float,
foreign key (cod_hosp) references Hospedagem (cod_hosp),
foreign key (Cod_prod) references Produto (cod_prod)
);

insert into produtos_hospedagem values (null, 1, 1, 3, 0.00);
insert into produtos_hospedagem values (null, 1, 2, 1, 0.00);

insert into produtos_hospedagem values (null, 2, 1, 3, 0.00);
insert into produtos_hospedagem values (null, 2, 3, 3, 0.50);

insert into produtos_hospedagem values (null, 3, 2, 1, 0.00);
insert into produtos_hospedagem values (null, 3, 3, 3, 0.00);
insert into produtos_hospedagem values (null, 3, 1, 10, 0.00);


create table quartos_hospedagem (
cod_qh int primary key not null auto_increment,
cod_hosp int not null,
cod_qua int not null,
quantDiárias_ph int,
valorQuarto_ph float,
foreign key (cod_hosp) references Hospedagem (cod_hosp),
foreign key (Cod_qua) references Quarto (cod_qua)
);

insert into quartos_hospedagem values (null, 1, 2, 2, 0.00);
insert into quartos_hospedagem values (null, 2, 3, 3, 0.00);
insert into quartos_hospedagem values (null, 3, 1, 10, 0.00);
insert into quartos_hospedagem values (null, 3, 2, 5, 0.00);

select 
quarto.número_qua 'Número do Quarto',
produto.descrição_prod 'Nome do Produto',
produtos_quarto.quantidade_pq 'Quantidade Disponível no Quarto'
from quarto
inner join produtos_quarto on quarto.cod_qua=produtos_quarto.cod_qua
inner join produto on produtos_quarto.cod_prod=produto.cod_prod;

DELIMITER $$
create procedure produtos_quartos()
	begin
    select
    quarto.número_qua 'Número do Quarto',
	produto.descrição_prod 'Nome do Produto',
	produtos_quarto.quantidade_pq 'Quantidade Disponível no Quarto'
	from quarto
	inner join produtos_quarto on quarto.cod_qua=produtos_quarto.cod_qua
	inner join produto on produtos_quarto.cod_prod=produto.cod_prod;
END $$ DELIMITER ;

call produtos_quartos();

delimiter $$
create procedure somaConsumo_Cliente(codigo_cliente int, out resultado double)
begin
	select
    sum(hospedagem.valorConsumo_hosp + hospedagem.valorDiárias_hosp)
    into resultado
    from cliente inner join hospedagem
    on cliente.cod_cli=hospedagem.cod_cli
    where cliente.cod_cli=codigo_cliente;
end $$ DELIMITER ;

call somaConsumo_Cliente(1, @res);

select @res;

delimiter $$
create procedure relatórioHospedagemCliente(codigo_cliente int)
begin
select
	cliente.nome_cli as 'Nome do Cliente',
    hospedagem.cod_hosp as 'N° da Hospedagem',
    hospedagem.dataCheckin_hosp as 'Data de Entrada',
    hospedagem.dataCheckout_hosp as 'Data de saída',
    hospedagem.valorDiárias_hosp as 'Valor das Diárias',
    hospedagem.valorConsumo_hosp as 'Valor dos COnsumos',
    hospedagem.valorTotal_hosp as 'Valor Total'
    from cliente inner join hospedagem on
    cliente.cod_cli=hospedagem.cod_cli where cliente.cod_cli=codigo_cliente;
end  $$ delimiter ;

call relatórioHospedagemCliente(1);

delimiter $$
create procedure aumentarPrecoProduto(produto int, porcentagem float)
	begin
    declare x varchar(100);
    declare y float;
    declare z float;
    select descrição_prod into x from Produto where cod_Prod=produto;
    select valor_prod into y from Produto where cod_prod=produto;
    update Produto set valor_prod=valor_prod+(valor_prod*(porcentagem/100)) where cod_prod=produto;
    select valor_prod into z from Produto where cod_prod=produto;
    select 'O produto', x,'teve o valor de',y,'mudado para o valor de',z;
end $$ delimiter ;

call aumentarPrecoProduto(1,20);

select*from produto;

delimiter $$
create procedure insereCliente(codigo_cliente int, nome_cliente varchar(100), cpf_cliente varchar(20), telefone_cliente varchar(50), 
celular_cliente varchar(50), endereco_cliente int)
begin
if ((nome_cliente != '') and (cpf_cliente != '')) then
insert into cliente (cod_cli, nome_cli, cpf_cli, telefone_cli, celular_cli, cod_end) values (codigo_cliente, nome_cliente, cpf_cliente, telefone_cliente, celular_cliente, endereco_cliente);
select 'Cliente inserido com sucesso!' as Msg;
else 
select 'NOME e CPF devem ser fornecidos para o cadastro!' as Msg;
end if;
end $$ delimiter ;

call insereCliente(null,'Paula Graziela','04150107211','992217270','992217270',1);

select*from cliente;


delimiter $$
create procedure insereCliente2(codigo_cliente int, nome_cliente varchar(100), cpf_cliente varchar(20), telefone_cliente varchar(50), 
celular_cliente varchar(50), endereco_cliente int)
begin
if ((nome_cliente != '') and (cpf_cliente != '')) then
	if ((nome_cliente != null) and (cpf_cliente != null)) then
	insert into cliente (cod_cli, nome_cli, cpf_cli, telefone_cli, celular_cli, cod_end) values (codigo_cliente, nome_cliente, cpf_cliente, telefone_cliente, celular_cliente, endereco_cliente);
	select 'Cliente inserido com sucesso!' as Msg;
else 
	select 'NOME e CPF devem ser fornecidos para o cadastro!' as Msg;
	end if;
end if;
end $$ delimiter ;

call insereCliente2(null,'Paula Graziela','04150107211','992217270','992217270',1);

select*from cliente;

delimiter $$
CREATE PROCEDURE aumentarProduto (codigo_produto int, preco_maximo double, percentual int)
BEGIN
WHILE ((SELECT valor_prod FROM produto WHERE cod_prod = codigo_produto) < preco_maximo) DO 
UPDATE produto SET valor_prod = valor_prod + (valor_prod * (percentual/100)) WHERE cod_prod = codigo_produto;
SELECT CONCAT('Produto reajustado para: ', (SELECT valor_prod FROM produto WHERE cod_prod = codigo_produto)) AS Mensagem;
END WHILE;
end $$ delimiter ;

call aumentarProduto(1, 20, 5);

delimiter $$
create procedure inserirCliente (nome varchar (100), civil varchar (100), cpf varchar (100),
rg varchar (100), sexo varchar (100), datanasc date, renda double, tel varchar (100),
cel varchar (100), endereco int)
	begin
        declare maximo int;
        declare minimo int;
        select max(cod_end) into maximo from endereco;
        select min(cod_end) into minimo from endereco;
        
		if ((nome != '') and (cpf != '')) then
			if ((not nome is null) and (not cpf is null)) then
				if ((endereco >= minimo) and (endereco <= maximo)) then
					#acao 1
                    insert into cliente values (null, nome, civil, cpf,
                    rg, sexo, datanasc, renda, tel, cel, endereco);
                    
                    #acao 2
                    Select 'Cliente inserido com sucesso!', nome;
				else
					select 'Insira um endereco valido!', nome;
				end if;
			else
				Select 'Insira um nome e cpf não nulo', nome;
			end if;
		else
			Select 'Insira um nome e cpf não vazio!', nome;
		end if;
    
	end;
$$ delimiter ;

call inserirCliente ('ellen', 'casado', '111', '123', 'masculino', '1987-01-01', 1500, '123', '123', 2222);

delimiter $$
create procedure verificarP()
begin
	select Produtos_quarto.quantidade_pq, Produto.descrição_prod, Quarto.número_qua from Produtos_quarto inner join Produto on 
    Produtos_quarto.cod_prod=Produto.cod_prod inner join Quarto on Produtos_quarto.cod_qua=Quarto.cod_qua;
end $$ delimiter ;

call verificarP();

delimiter $$
create procedure gastosCliente(cod_cli_fk int)
begin
    declare total double;
	select valorConsumo_hosp+valorDiárias_hosp as 'Valor total gasto' from hospedagem where cod_cli=cod_cli_fk;
end $$ delimiter ;
call gastosCliente(1);

delimiter $$
create procedure listaProdutos()
begin
	select descrição_prod, quantidade_prod from produto where quantidade_prod>5;
end $$ delimiter ;

call listaProdutos();

delimiter $$
create procedure numeroClientes(out quant int)
begin
	select count(cod_cli) from cliente;
end $$ delimiter ;

call numeroClientes(@quant);

delimiter $$
create procedure qualquer(nome_city varchar(20))
begin
	declare num int;
    declare num2 int;
    declare n_city varchar(20);
    declare quant_cli int;
    set num=1; 
    set num2=0; 
    select count(cod_cli) from cliente into quant_cli;
	while ((select cod_end from endereco where cod_end=num) or (num!=quant_cli)) do
		set num=num+1;
        select cidade_end from endereco where cod_end=num into n_city;
        if (n_city=nome_city) then
			set num2=num2+1;
		end if;
	end while;
    
    select num2 as 'Quantidade de clientes que moram na cidade informada';
end $$ delimiter ;

call qualquer('Ji-Paraná');



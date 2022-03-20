create database projetopooloja;

use projetopooloja;

create table cliente(
idcliente int primary key auto_increment,
nome varchar(150) not null,
dataNasc date not null,
cpf  varchar(20) not null,
rg varchar(20) not null,
sexo varchar(20) not null,
celular varchar(20) not null,
email varchar(80) not null,
rua varchar(100) not null,
numero varchar(20) not null,
CEP varchar(20) not null ,
bairro varchar (100) not null
);

create table funcionario(
idfuncionario int primary key auto_increment,
nome varchar(150) not null,
dataNasc date not null,
cpf varchar(20) not null,
rg varchar(20) not null,
sexo varchar(20) not null,
celular varchar(20) not null,
email varchar(80) not null,
rua varchar(100) not null,
numero varchar(20) not null,
CEP varchar(20) not null ,
bairro varchar (100) not null,
funcao varchar(100) not null,
salario double not null
);

create table fornecedor(
idfornecedor int primary key auto_increment,
nomeFantasia varchar(200) not null,
razaoSocial varchar(200)not null,
cnpj varchar(20) not null,
email varchar(200) not null,
telefone varchar(20) not null,
tipoProduto varchar(200) not null,
descricao varchar(20) not null
);

create table produto(
idproduto int primary key auto_increment,
descricao varchar(50) not null,
valor float not null,
quantidade float not null,
marca varchar(50) not null,
modelo varchar(50) not null,
tipo varchar(50) not null,
cor varchar(50) not null,
tamanho varchar(15) not null,
idfornecedor_fk int not null,
foreign key (idfornecedor_fk) references fornecedor(idfornecedor)
on update cascade
on delete restrict
);

create table venda(
idvenda int primary key auto_increment,
valor float not null,
dataV datetime not null,
valorLiquido double not null,
valorBruto double not null,
tipoPagamento varchar(50) not null,
idFuncionario_fk int not null,
codCliente_fk int not null,
foreign key (codCliente_fk) references cliente(idcliente)
 on update cascade
 on delete restrict,
codFuncionario_fk int not null, 
foreign key (idFuncionario_fk) references funcionario(idfuncionario)
 on update cascade
 on delete restrict
);
 
create table compra(
idcompra int primary key auto_increment,
valor double not null,
desconto double not null,
valorTotal double not null,
dataC date not null,
tipoPagamento varchar(50) not null,
idFuncionario_fk int not null,
foreign key (idFuncionario_fk) references funcionario(idfuncionario)
 on update cascade
 on delete restrict);
 
create table venda_produto(
idvenda_produto int primary key auto_increment,
idvenda_fk int not null,
idproduto_fk int not null,
foreign key (idvenda_fk) references venda(idvenda)
on update cascade
on delete restrict,
foreign key (idproduto_fk) references produto(idproduto)
on update cascade
on delete restrict
);
 
create table compra_produto(
idcompra_produto int primary key auto_increment,
idcompra_fk int not null,
idproduto_fk int not null,
foreign key (idcompra_fk) references compra(idcompra)
on update cascade
on delete restrict,
foreign key (idproduto_fk) references produto(idproduto)
on update cascade
on delete restrict
);
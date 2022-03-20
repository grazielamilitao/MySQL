create database projetopooloja;
use projetopooloja;

create table pessoa(
codigo int primary key auto_increment,
nome varchar(120) not null,
datanascimento date not null,
cpf  varchar(20) not null,
rg varchar(20) not null,
sexo varchar(20) not null,
rua varchar(100) not null,
numero varchar(20) not null,
CEP varchar(20) not null ,
bairro varchar (100) not null
);
create table cliente(
codigo int primary key auto_increment,
codPessoa_fk int not null,
foreign key (codPessoa_fk)
 references pessoa(codigo)
 on update cascade
 on delete restrict
);
create table funcionario(
codigo int primary key auto_increment,
funcao varchar(100) not null,
salario decimal(10,2) not null,
codPessoa_fk int not null,
foreign key (codPessoa_fk)
 references pessoa(codigo)
 on update cascade
 on delete restrict
);
create table fornecedor(
codigo int primary key auto_increment,
nomeFantasia varchar(200) not null,
razaoSocial varchar(200)not null,
cnpj varchar(20) not null,
email varchar(200) not null,
numero varchar(20) not null
);
create table produto(
codigo int primary key auto_increment,
descricao varchar(50) not null,
valor float not null,
quantidade float not null,
marca varchar(50) not null,
modelo varchar(50) not null,
tipo varchar(50) not null,
cor varchar(50),
nomeFornecedor varchar(100) not null,
codFornecedor_fk int not null,
foreign key (codFornecedor_fk)
 references fornecedor(codigo)
 on update cascade
 on delete restrict
);
create table venda(
codigo int primary key auto_increment,
valor float not null,
dataV datetime not null,
valorLiquido decimal(10,2) not null,
valorBruto decimal(10,2) not null,
codCliente_fk int not null,
foreign key (codCliente_fk)
 references cliente(codigo)
 on update cascade
 on delete restrict,
codFuncionario_fk int not null,
foreign key (codFuncionario_fk)
 references funcionario(codigo)
 on update cascade
 on delete restrict
);
create table venda_produto(
codigo int primary key auto_increment,
desconto float not null, 
quantidade int not null, 
valortotal decimal(10,2),
codVenda_fk int not null,
foreign key (codVenda_fk)
 references venda(codigo)
 on update cascade
 on delete restrict,
codProduto_fk int not null,
foreign key (codProduto_fk)
 references produto(codigo)
 on update cascade
 on delete restrict
 );
create table compra(
codigo int primary key auto_increment,
desconto float not null,
dataV decimal(10,2) not null,
tipoPagamento varchar(50) not null,
codProduto_fk int not null,
foreign key (codProduto_fk)
 references produto(codigo)
 on update cascade
 on delete restrict,
codFuncionario_fk int not null,
foreign key (codFuncionario_fk)
 references funcionario(codigo)
 on update cascade
 on delete restrict);
 
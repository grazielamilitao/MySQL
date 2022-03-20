show databases;

create database 3bbegins;
-- drop database 3bbegins;

use 3bbegins;

create table pessoa(
idpessoa int primary key auto_increment,
nome varchar(100) not null,
cpf varchar(15) not null unique,
rg varchar(8) not null unique,
dataNasc varchar(10) not null,
sexo varchar(8) not null,
celular varchar(10) not null
);


create table endereco(
idendereco int primary key auto_increment,
rua varchar(100) not null,
bairro varchar(100) not null,
numero varchar(100) not null,
cep varchar(100) not null,
idpessoa_fk int not null,
foreign key (idpessoa_fk) references pessoa(idpessoa)
on update cascade
on delete restrict
);

create table Telefone(
idTelefone int primary key auto_increment,
idpessoa_fk int not null,
foreign key (idpessoa_fk) references pessoa(idpessoa)
on update cascade
on delete restrict
);

create table Aluno(
idAluno int primary key auto_increment,
dataCadastro varchar(10) not null,
idAluno_fk int not null,
foreign key (idAluno_fk) references pessoa(idpessoa)
on update cascade
on delete restrict
);


create table Professor(
idProfessor int primary key auto_increment,
titulacao varchar(25) not null,
idProfessor_fk int not null,
foreign key (idProfessor_fk) references pessoa(idpessoa)
on update cascade
on delete restrict
);

create table Curso(
idCurso int primary key auto_increment,
carga double not null,
preco double not  null,
descrição varchar(40) not null
);

create table Disciplina(
idDisciplina int primary key auto_increment,
nome varchar(20) not null,
idProfessor_fk int not null,
idCurso_fk int not null,
foreign key (idProfessor_fk) references Professor(idProfessor)
on update cascade
on delete restrict,
foreign key (idCurso_fk) references Curso(idCurso)
on update cascade
on delete restrict
);

 create table Matricula(
 idMatricula int primary key auto_increment,
 idDisciplina_fk int not null,
foreign key (idDisciplina_fk) references Disciplina(idDisciplina)
on update cascade
on delete restrict
);

create database manipulation;
use manipulation;

CREATE TABLE bankAcconts (
	Id_account INT auto_increment PRIMARY KEY,
    Ag_num INT NOT NULL,
    Ac_num INT NOT NULL,
    Saldo FLOAT,
    CONSTRAINT identification_account_constraint UNIQUE (Ag_num, Ac_num)
);
insert into bankAcconts (Ag_num, Ac_num, Saldo) values(156,264358,0);
select * from bankAcconts;

select b.Nome, b.Endereco, b.Id_client from bankClient as b
	where exists (select * from bankAcconts as b
					where b.Id_account = b.Id_client);

alter table bankAcconts add LimiteCredito float
	not null default 500.00;
desc bankAcconts;
alter table bankAcconts add email varchar(60);
alter table bankAcconts drop email;

 -- comentário 
 -- alter table nome_tabela modify column nome_atributo tipo_dados condicao;
 -- alter table nome_tabela add constraint nome constraint condicoes

CREATE TABLE bankClient(
	Id_client INT auto_increment,
    ClientAccount INT,
    CPF CHAR(11) NOT NULL,
    RG CHAR(9) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,
    Renda_mensal FLOAT,
    primary key (iD_Client, ClientAccount),
    CONSTRAINT fk_account_client foreign key (ClientAccount) REFERENCES bankAcconts(Id_account)
    ON UPDATE CASCADE
);


alter table bankClient add UFF char(2) not null default 'RO';
update bankClient set UFF='MG' where Nome='fulano';
desc bankClient;
insert into bankClient (ClientAccount, CPF, RG, Nome, Endereco, Renda_mensal) values(5,12345678914,123454783,'catatau','rua do crepúsculo','1100.98');
select * from bankClient;

update bankClient set UFF='MG' where Nome='Fulano';

CREATE TABLE bankTransactions(
	Id_transaction INT auto_increment PRIMARY KEY,
    Ocorrencia datetime,
    Status_transaction VARCHAR(20),
    Valor_transferido FLOAT,
    Source_account INT,
    Destination_account INT,
    CONSTRAINT fk_source_transaction foreign key (Source_account) REFERENCES
    bankAcconts(id_Account),
    CONSTRAINT fk_destination_transaction foreign key (Destination_account) REFERENCES
    bankAcconts(id_Account)
);
select * from bankTransactions;


select Nome,round(RG * 0.11,2) as RGALTERADO, Endereco from bankClient;
select concat(Nome, ' ', Endereco) as mistureba from bankClient; -- concatenando dados com outros dados e nomeando com 'as'

-- definindo alias para legibilidade da consulta
select b.Nome, b.Endereco, b.Renda_Mensal from bankClient b
where b.Renda_Mensal between 5000.00 and 6500.98;

select b.Nome, b.Renda_Mensal from bankClient b
where b.Endereco like '%piseiro%';

select * from bankClient where Nome like '%C%' and Renda_Mensal > 1000; -- operador lógico and
select * from bankClient where Nome like '%C%' or Renda_Mensal > 1000;  -- operador lógico or

-- Cláusulas com exists e unique
select b.Nome, b.Endereco from bankClient as b
	where exists (select * from bankClient);
    
-- CLÁUSULA DE ORDENAÇÃO

select * from bankClient order by Nome;

select * from bankClient as b, 


















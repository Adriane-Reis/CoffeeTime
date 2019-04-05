
Use `coffeetime2019`;

create table Usuario(
email        varchar(50)       not null,
senha        varchar(8)        not null,
nome         varchar(50)       not null,
cpf            char(11)        not null,
sexo           char            not null,
estado       varchar(50)       not null,
cidade       varchar(50)       not null,
bairro       varchar(50)       not null,
cep             char(9)        not null,
rua          varchar(50)       not null,
numero         int             not null,
primary key(cpf),
unique (cpf));

select * from Usuario;

create table Breaker(
cpf           char(11)         not null,
telefone      int              not null,
descricao    varchar(200)      not null,
primary key(cpf));

select * from Breaker;

create table Cliente(
cpf           char(11)         not null,
cpfBreaker    char(11)         not null,
primary key(cpf),
foreign key(cpfBreaker) references Breaker(cpf));

select * from Cliente;

create table BreakerNotificaCliente(
cpfBreaker      char(11)      not null,
cpfCliente      char(11)      not null,
notificacoes   varchar(200)     not null,
primary key(cpfBreaker, cpfCliente),
foreign key(cpfBreaker) references Breaker(cpf),
foreign key(cpfCliente) references Cliente(cpf));

select * from BreakerNotificaCliente;

create table Evento(
nome         varchar(100)      not null,
tipo           char            not null,
primary key(nome));

select * from Evento;

create table BreakerAgendaEvento(
cpfBreaker       char(11)       not null,
nomeEvento    varchar(100)      not null,
dataInicio    varchar(8)        not null,
dataFim       varchar(8)        not null,
horaInicio      time            not null,
horaFim         time            not null,
primary key(cpfBreaker, nomeEvento),
foreign key(cpfBreaker) references Breaker(cpf),
foreign key(nomeEvento)   references Evento(nome));

select * from BreakerAgendaEvento;

create table Ornamentacao(
id            int               not null,
nome        varchar(100)        not null,
descricao   varchar(200)        not null,
preco         float             not null,
locall       varchar(80)        not null,
tipo          char              not null,
cpfBreaker    char(11)          not null,
primary key(id),
foreign key(cpfBreaker) references Breaker(cpf));

select * from Ornamentacao;

/*Manter Dados - Usuário*/

insert into Usuario values(email, senha, nome, cpf, sexo, estado, cidade, bairro, cep, rua, numero);

update Usuario 
set email = email or senha = senha or nome = nome or cpf = cpf or sexo = sexo or  estado = estado or cidade = cidade or bairro = bairro or cep = cep or rua = rua or numero = numero
where  email = 'email' and senha = 'senha';

delete from Usuario 
where email = 'email' and senha = 'senha';

/*Login - Usuário*/

select email, senha
from Usuario
where email = 'email' and senha = 'senha';


/*Manter Evento - Breaker

insert into Evento  values(nome, tipo);

update Evento
set nome = Nome or tipo = Tipo
where email = true and senha = true;

delete from Evento 
where email = true and senha = true;

/*Manter Ornamentação - Breaker

insert into Ornamentacao values(id, nome, descricao, local, tipo);

update ornamentacao
set id = Id or nome = Nome or descricao = Descricao or preco = Preco or local = Local or tipo = Tipo
where email = true and senha =  true;

delete from Ornamentacao
where email = true and senha =  true;

/*Solicitar Ornamentador - Cliente

select B.nome 
from  Cliente as C, Breaker as B
where C.email = true and C.senha = true;

/*Consultar AgendaDeEventos - Cliente

select E.nome, E.tipo
from Cliente as C, Eventos as E
where C.email = true and C.senha = true;

/*Consultar Organizadores - Cliente

select *
from Cliente as C, Breaker as  B 
where C.email = true and C.senha = true;

/*Consultar Ornamentações - Cliente

select *
from Ornamentacao as O, Cliente as C 
where C.email = true and C.senha = true;
*/















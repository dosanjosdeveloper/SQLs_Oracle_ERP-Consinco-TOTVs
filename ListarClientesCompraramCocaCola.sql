/*
select * from mrl
select * from ge_pessoa
select * from mrl_cliente
*/

select LATITUDE, LONGITUDE from mad_clienteend where seqpessoa = 16739


select 
mc.seqpessoa,
gp.nomerazao, gp.fantasia,gp.nrocgccpf, gp.digcgccpf,gp.inscricaorg,gp.logradouro,gp.nrologradouro,gp.bairro, gp.cep,gp.cidade,
gp.foneddd1||'-'||gp.fonenro1, gp.foneddd2||'-'||gp.fonenro2,gp.email

from mrl_cliente mc
join ge_pessoa gp on gp.seqpessoa = mc.seqpessoa

where mc.statuscliente = 'A'
-- join mrl_clientecredito mcc on mcc.seqpessoa = mc.seqpessoa

select 
(select divisao from Max_Divisao where nrodivisao = f.nrodivisao ) as DIVISAO, 
f.seqfornecedor||' - '||
(select nomerazao from GE_PESSOA where seqpessoa = f.seqfornecedor) as FORNECEDOR, 
(select apelido from max_comprador where seqcomprador = f.seqcomprador) AS COMPRADOR,
f.percdescfinacordo as PERCENTUAL_DESC from maf_fornecdivisao f where f.percdescfinacordo > 0 
order by f.nrodivisao, f.seqfornecedor
-- seqfornecedor in (17471,23643) and

/*
select * from GE_PESSOA where seqpessoa in (17471,23643) 
select divisao from Max_Divisao where nrodivisao = f.nrodivisao
select * from 

select * from max_comprador where seqcomprador = 7
*/

select a.seqpessoa, a.nomerazao, a.status, a.versao, a.dtainclusao, a.usuinclusao, a.indprofprescritor 
   from ge_pessoa a 
    where a.seqpessoa 
    in (select p.seqpessoa from consincomonitor.tb_prescritor p) and a.indprofprescritor = 'S' and status !='P'
    
select a.seqpessoa, a.nomerazao, a.status, a.versao, a.dtainclusao, a.usuinclusao, a.indprofprescritor 
   from ge_pessoa a 
    where a.seqpessoa 
    in ('20500','17144')

select * from consincomonitor.tb_pessoa where seqpessoa in ('20500','17144')
select * from consincomonitor.tb_prescritor p where p.seqpessoa in ('20500','17144')

-- 
update ge_pessoa set status = 'A', usualteracao = 'TI_RAFAEL'
   where seqpessoa in ('20500')
   
   
select * from ge_pessoa t where t.seqpessoa = '20500'

select * from mad_clienterep b where b.nrorepresentante = '1346' --and b.seqpessoa = '28785'

-- update mad_clienterep a
 set a.status = 'A' where a.nrorepresentante = '1346' and a.status = 'I' and a.seqpessoa in (
 select b.seqpessoa from mad_clienterep b where b.nrorepresentante = '1346' and b.status = 'I' and trunc(b.dtaalteracao) = to_date('01/02/2024','DD/MM/YYYY') 
 )
 

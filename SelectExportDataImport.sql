/*

select * from supernorte.almnt_func_mes where referenciames = '5/2023'

select sum(valorconsiderado) from supernorte.almnt_func_mes

select * from ge_pessoa b where b.nrocgccpf = 050241622
select * from mrl_clientecartao
*/

select LPAD((select p.seqpessoa 
from ge_pessoa p where to_number(substr(al.cpfbeneficiado,1,9)) = p.nrocgccpf),5,'0') as SEQPESSOA, 
RPAD(al.nomebeneficiado,40) as NOME, LPAD(al.cpfbeneficiado,15,0) CPF,146 as FORMAPAGTO, LPAD(al.valorconsiderado,12,0) as LANCAR 
from supernorte.almnt_func_mes al  -- where al.cpfbeneficiado = '84022671220'

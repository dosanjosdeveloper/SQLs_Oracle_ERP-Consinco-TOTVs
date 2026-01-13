select LPAD((select p.seqpessoa 
from ge_pessoa p where to_number(substr(al.cpfbeneficiado,1,9)) = p.nrocgccpf),5,'0') as SEQPESSOA, 
RPAD(al.nomebeneficiado,40) as NOME, LPAD(al.cpfbeneficiado,15,0) CPF,146 as FORMAPAGTO, LPAD(al.valorconsiderado,12,0) as LANCAR 
from supernorte.almnt_func_mes al  -- where al.cpfbeneficiado = '84022671220'

select * from ge_pessoa;

/*

select gp.seqpessoa, gp.nomerazao, gp.nrocgccpf||''||gp.digcgccpf as CPF from ge_pessoa gp
  where gp.nrocgccpf||''||gp.digcgccpf in (02630011216,
00340777230,01839218282,03753706256,82480664287,
60851384234,78169011272,01787005259,54277477291,
85921270253,03925091211,01333701276,02612287221,
02419353269,03479282261,68516363287,04651466273,
64714390244,03874928284,04912353213,00830215239,
09899350273,65924126234,72910143368,04766878299,
80844723215,75119390234,39907651249,03714610227,
83299289268,06249141278,60913983268,90115066268,
01880113236,03235618295,04718884276,01965118283);

*/

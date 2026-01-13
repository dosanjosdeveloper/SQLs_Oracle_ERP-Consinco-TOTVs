select  b.seqpessoa,
       b.nomerazao,
       b.sexo,
       decode (b.status,
                'A','ATIVO',
                'I','INATIVO') AS STATUS_CLIENTE,
       decode(c.statuscredito,
               'I','INATIVO',
               'L','LIBERADO',
               'B','BLOQUEADO',
              'S','SUSPENSO') AS SITUACAO_CLIENTE,
        'R$ '||to_char(c.vlrlimitecredito,'FM999G999G990D00','NLS_NUMERIC_CHARACTERS='',.''') as LIMITE

from mrl_clientecartao a, ge_pessoa b, mrl_clientecredito c

where b.seqpessoa = a.seqpessoatitular
      and a.nroformapagto = 122
      and c.nroformapagto = a.nroformapagto
      and c.seqpessoa = b.seqpessoa
      and c.seqpessoa = a.seqpessoatitular
      and c.statuscredito in ('L') 
      order by b.nomerazao ;
      
  select * from mrl_clientecredito 
    where nroformapagto = 122
    and statuscredito in ('L');
    
    

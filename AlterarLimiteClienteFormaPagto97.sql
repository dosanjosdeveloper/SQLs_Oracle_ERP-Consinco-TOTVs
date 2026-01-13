select LPAD  (c.seqpessoa,6,'0')||' - '|| p.nomerazao as CLIENTE, 'R$ '||c.vlrlimitecredito as LIMITE_ATUAL 
  from mrl_clientecredito c
    JOIN ge_pessoa p
      ON p.seqpessoa = c.seqpessoa
       where c.nroformapagto = 97 
         and c.statuscredito = 'L';


-- select a.nroformapagto || ' - ' || a.formapagto from mrl_formapagto a where a.nroformapagto = 97;

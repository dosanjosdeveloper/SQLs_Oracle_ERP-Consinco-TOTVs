
select distinct
       b.seqpessoa,
       b.nomerazao,
       b.fantasia,
       b.sexo,
       decode (b.status,
                'A','ATIVO',
                'I','INATIVO') AS STATUS_CLIENTE,
       (select decode(c.statuscredito,
               'I','INATIVO',
               'L','LIBERADO',
               'B','BLOQUEADO',
              'S','SUSPENSO') from  mrl_clientecredito c where c.seqpessoa = b.seqpessoa and c.nroformapagto = a.nroformapagto) AS SITUACAO_CLIENTE,
       b.logradouro||', '||b.nrologradouro||', '||b.bairro||' - '||b.cidade||' - '||b.uf as ENDERECO

from mrl_clientecartao a,
     ge_pessoa b

where b.seqpessoa = a.seqpessoatitular
      and a.nroformapagto = 97
      and a.statuscartao = 'A';



-- select * from mrl_clientecartao t where t.seqpessoatitular = 3029

-- select * from mrl_clientecredito l where l.seqpessoa = 3029

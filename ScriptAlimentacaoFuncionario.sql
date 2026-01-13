/*Autor: Developed by Rafael dos Anjos on 12/03/2023 */

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

/* 01) RETORNA LISTA DE TODOS LANÇAMENTO OCORRIDOS POR DATA */
select distinct to_date(trunc(b.dtalancto),'DD/MM/YYYY') as DTA_LANCAMENTO, B.USUINCLUSAO AS LANCADO_POR
    from mrl_convenioccformapagto b
     join mrl_formapagto n on n.nroformapagto = b.nroformapagto
      where b.tiplancto in ('C')
       and n.nroformapagto ||' - '|| n.formapagtoreduz ='146 - ALIM FUNC SUPER'
order by to_date(trunc(b.dtalancto),'DD/MM/YYYY') desc;

/* 02) RETORNA A LISTA DE FUNCIONARIOS BENEFICIADOS NOS LANÇAMENTO DE RECARGAS DO ALIMENTAÇÃO */

select cf.seqpessoa||' - '||p.nomerazao as PESSOA_BENEFICIADA, 'R$ '||TO_CHAR((cf.vlrcompra),'FM999G999G990D00','nls_numeric_characters='',.''') AS VALOR_LANCADO, to_char(cf.dtalancto,'dd/MM/YYYY') as DATA_LANCAMENTO, cf.usuinclusao as LANCADO_POR  
 from mrl_convenioccformapagto cf 
  join mrl_formapagto n on n.nroformapagto = cf.nroformapagto
  join ge_pessoa p on p.seqpessoa = cf.seqpessoa
   where cf.tiplancto in ('C')
    and n.nroformapagto ||' - '|| n.formapagtoreduz = '146 - ALIM FUNC SUPER'
    and trunc(cf.dtalancto) between to_date('30/11/2023','DD/MM/YYYY') and to_date('30/11/2023','DD/MM/YYYY')
    ORDER BY CF.DTALANCTO DESC;
 

/* 03) RETORNA A SOMA DOS LANÇAMENTO DE RECARGAS DO ALIMENTAÇÃO */

select 'R$ '||TO_CHAR(sum(cf.vlrcompra),'FM999G999G990D00','nls_numeric_characters='',.''') as LANCAMENTO_TOTAL 
 from mrl_convenioccformapagto cf 
  join mrl_formapagto n on n.nroformapagto = cf.nroformapagto
   where cf.tiplancto in ('C')
    and n.nroformapagto ||' - '|| n.formapagtoreduz = '146 - ALIM FUNC SUPER'
    and trunc(cf.dtalancto) between to_date('30/11/2023','DD/MM/YYYY') and to_date('30/11/2023','DD/MM/YYYY');

--    and cf.seqpessoa in (3029,22910)
       
/* 04) RETORNA LISTA, CÓDIGO E DESCRIÇÃO, DE FORMA DE PAGAMENTOS DO TIPO ALIMENTAÇÃO */ 
select n.nroformapagto ||' - '|| n.formapagtoreduz  as FORMA_PAGTO
  from mrl_formapagto n 
    where n.codespecie in ('CVALIM')
      AND n.statusformapagto = 'A';

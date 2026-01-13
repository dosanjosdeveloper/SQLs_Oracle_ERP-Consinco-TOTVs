
select MAP_PRODUTO.SEQFAMILIA, MAP_PRODUTO.SEQPRODUTO,MAP_PRODUTO.DESCCOMPLETA, MAP_PRODUTO.COMPLEMENTO, 
    -- DECODE(SUBSTR(fStatusVendaProduto(SEQPRODUTO, NULL, NULL),0,1),'A','Ativo','Inativo') ,
    -- DECODE(SUBSTR(fStatusCompraProdutoEmpAtiva(SEQPRODUTO, NULL), 0, 1), 'A', 'Ativo', 'S', 'Suspenso', 'Inativo'), 
      MAP_PRODUTO.GERALIVROCPROD, MAP_PRODUTO.NROREGMINSAUDE ,MAP_PRODUTO.MOTIVOISENCAOMINSAUDE, MAP_PRODUTO.INDESCRITURAPRODUTOBASE, MAP_PRODUTO.INDPARTCOTATAC,
      MAP_PRODUTO.USUARIOALTERACAO, MAP_PRODUTO.USUARIOINCLUSAO, MAP_PRODUTO.INDPROCFABRICACAO, MAP_PRODUTO.INDREPLICACAO,MAP_PRODUTO.INDEMITECODPRODFISCALNFE,MAP_PRODUTO.DTAHORALTERACAO, 
      MAP_PRODUTO.DTAHORINCLUSAO
from MAP_PRODUTO
where MAP_PRODUTO.SEQPRODUTO in (1965255,1796437,2034425,1893114,2022397,2087537,1826158,2097117,2109271,1906720,
                                 1965131,
                                 2059274,2135485,1764039,1776290,1825860,1818384,1305239,1208748,1208730,1816268,1816292,2083060,1965158,1694880,2110229,2135167,1770497,1770500,2118726,1906720,1764314,2120178,
                                 2120160)



/*
select MLFV_BASENFE.NUMERONF, MLFV_BASENFE.SERIENF, MLFV_BASENFE.DTAEMISSAO, MLFV_BASENFE.DESCSTATUSNFE, decode( MLFV_BASENFE.INDENVIACANCELAMENTO, 'S', 1, 0 ), decode( MLFV_BASENFE.TIPNOTAFISCAL, 'E', 'Entrada', 'Saída' ), MLFV_BASENFE.TIPNOTAFISCAL, MLFV_BASENFE.VLRTOTAL, MLFV_BASENFE.SEQPESSOA, GE_PESSOA.SEQPESSOA || ' - ' || GE_PESSOA.NOMERAZAO, 
( case  when  ( MLFV_BASENFE.STATUSNFE in ( 1, 5, 10, 11, 12, 13, 19, 99 )
  and MLFV_BASENFE.INDENVIACANCELAMENTO = 'N'
  and MLFV_BASENFE.NFENROPROTENVIO is null ) then 'E'
  when  MLFV_BASENFE.INDENVIACANCELAMENTO = 'S' then 'C'
  else  null
end )
, MLFV_BASENFE.SEQNOTAFISCAL, MLFV_BASENFE.NROEMPRESA, MLFV_BASENFE.STATUSNFE, MLFV_BASENFE.NROCARGA, INDEMISSAONF, MLFV_BASENFE.TIPOTABELA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
from 
MLFV_BASENFE,
GE_PESSOA
 

where 
   MLFV_BASENFE.NROEMPRESA BETWEEN :1                          AND :2                         
AND (
      (
         (
            MLFV_BASENFE.STATUSNFE IN (1, 5, 10, 11, 12, 13, 19, 99) 
            OR MLFV_BASENFE.STATUSNFE IS NULL
         ) 
         AND MLFV_BASENFE.INDENVIACANCELAMENTO = 'N' 
         AND MLFV_BASENFE.NFENROPROTENVIO IS NULL
      ) 
      OR
      (
         MLFV_BASENFE.INDENVIACANCELAMENTO = 'S'
      )
   )
AND NOT EXISTS (SELECT 1
                 FROM MFL_NFELOG X
                WHERE X.SEQNOTAFISCAL = MLFV_BASENFE.SEQNOTAFISCAL
                  AND UPPER(X.DESCRICAO) LIKE '%DENEGADA%')
AND MLFV_BASENFE.MODELO != '65'

and MLFV_BASENFE.SEQPESSOA = GE_PESSOA.SEQPESSOA
and   MLFV_BASENFE.APPORIGEM != 26

and (MLFV_BASENFE.DTAEMISSAO) between trunc( to_date('2024-06-07', 'YYYY/MM/DD')) 
and trunc( to_date('2024-07-07', 'YYYY/MM/DD'))  

order by 
DTAEMISSAO,
NUMERONF

*/
                                                         









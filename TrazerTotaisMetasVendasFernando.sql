select EMPRESA, META_VENDA,TESTE,(META_VENDA/TESTE) as TOTO from (Select
 e.nomereduzido as EMPRESA,
 
 -- TO_CHAR ((sum (a.metavenda)),'FM999G999G999D00','nls_numeric_characters='',.''') as META_VENDA,
  sum (a.metavenda)as META_VENDA,
 (Select
 --  TO_CHAR ((sum(b.vlrtotalvda)-sum(b.vlrtotaldevol)),'FM999G999G999D00','nls_numeric_characters='',.''') as VEND_REALIZADA
 sum(b.vlrtotalvda)-sum(b.vlrtotaldevol)
   From MRL_CUSTODIAFAM B
    Where b.nroempresa = a.nroempresa
      and b.dtaentradasaida between '01-Oct-2020' and '31-Oct-2020'
  ) as TESTE
 
   
From MRL_METAVENDA a, ge_empresa e
Where a.nroempresa = e.nroempresa
  and a.dtainicio = '01-Oct-2020'
  and a.nrodivisao = 1
  and a.nroempresa in (7,13)
Group by e.nomereduzido, a.nroempresa, a.dtainicio, a.dtafim
Order by e.nomereduzido )


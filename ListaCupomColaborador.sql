Select
 e.nomereduzido as EMPRESA,
 a.periodo,
 a.funcionario as COLABORADOR,
 a.nrocupomdesconto as CUPOM_DESCONTO

From SUPERNORTE.TISUPER_FUNC_PREMIOMETA a, max_empresa e, consincomonitor.tb_cupomdesccodigo c
 Where e.nroempresa = a.nroempresa
   and a.nrocupomdesconto = c.nrocupomdesconto
   
   and a.periodo like 'MAR/2023'
   and c.seqcupomdesconto in (2361,2406)
   
Order by a.nroempresa, a.funcionario

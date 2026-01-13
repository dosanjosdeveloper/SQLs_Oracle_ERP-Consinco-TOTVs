-- select * from consincomonitor.tb_doctopagto a where a.dtabasecobranca = to_date('31/05/2023','DD/MM/YYYY') and a.vlrtotal > 0 and a.vlrtotal = '23.60' 
-- 26,60 - 26,06 - 23,06

select sum(a.vlrtotal) as TOTAL_CARTEIRA_DIGITAL from consincomonitor.tb_doctopagto a where a.dtabasecobranca = to_date('31/05/2023','DD/MM/YYYY') and a.nroformapagto = 252 and a.vlrtotal > 0 
-- group by a.nroempresa
--  and a.nroempresa = 12
-- and a.nroformapagto = 252 --and a.vlrtotal > 0 and a.vlrtotal = '23.60'

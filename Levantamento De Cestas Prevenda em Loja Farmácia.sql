/*---------------- Esporadico: Validar se item da Cesta Foi Faturada no PDV ----------------*/
select * from consincomonitor.tb_doctoitem di 
   where di.nroempresa in (11,12) 
       and di.nroprevenda in (
       30110241470751
30110241471031,
30110231976829,
30110231978878,
30110241472557,
30110221754994,
30110231980130,
 ) 
-- Exemplo aleatório pára validar funcionandomento da query

/*---------------- Retorna Lista de Cestas Prevendas em aberto ----------------*/
select pv.dtahoremissao, pv.nrocomanda, pv.ativo, pv.* 
from tb_prevenda pv 
where pv.nroempresa in (11,12)
and trunc(pv.dtahoremissao) between trunc(sysdate-10) and trunc(sysdate)
and pv.status not in ('C','F','D') 
order by pv.nroempresa, pv.dtahoremissao;

/*---------------- Update para Setar Itens das Prevendas em aberto ----------------*/
-- UPDATE tb_prevendaitem 
  SET status = 'C' 
    where nroprevenda 
      in (
             30110241470751,
30110241471031,
30110231976829,
30110231978878,
30110241472557,
30110221754994,
30110231980130 )
     and nroempresa in ('11')

/*---------------- Update para Setar Cestas Pré-Vendas em aberto ----------------*/
 -- UPDATE tb_prevenda 
  SET status = 'F' 
    WHERE nroprevenda 
          in ( 
          30110241470751,
30110241471031,
30110231976829,
30110231978878,
30110241472557,
30110221754994,
30110231980130 )
      and nroempresa = '11'


/*---------------- Lista itens da Pré-Venda em aberto---------------- */
select * from tb_prevendaitem r where r.nroprevenda in (
 select pv.nroprevenda 
        from tb_prevenda pv 
         where pv.nroempresa in (11)
         and trunc(pv.dtahoremissao) between trunc(sysdate - 2) and trunc(sysdate)
--         and pv.status not in ('C','F')  -- 30110231530557
         and pv.nroprevenda in (' 30110231970803')
)

/*---------------- Remover a Hora do Select Deixando somente a Data mesmo ----------------*/
select trunc(sysdate) from dual

/*
select * from msu_psitemreceber a
where a.nropedidosuprim in (579369,580991, 580587);
*/

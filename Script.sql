select pv.dtahoremissao, pv.* from tb_prevenda pv 
   where pv.nroempresa = 11 
    and pv.status not in ('C','V')
    and trunc(pv.dtahoremissao) = to_date('09/12/2023','DD/MM/YYYY') 
   order by pv.dtahoremissao desc;

select * from tb_prevendaitem pb where pb.nroprevenda in (30110231455843,30110221266879)

select * from tb_pinpadcheckout where nroempresa = 8 and nrocheckout = 6

-- set update 

-- select pv.dtahoremissao, pv.* from tb_prevenda pv where pv.nroempresa = 11 and pv.nrocomanda in (11022,11013,11011,11010,11046,11005,
-- 11042,11036,11026,11029) order by pv.dtahoremissao desc;

/* 
 SITUAÇÃO PRÉ-VENDA

D - Digitação
F - Faturado
L - Liberado
A - Liberado Financeiro
R - Roteirizado
S - Separação
C - Cancelado
P - Pré-Separação
W - Separação Aguardando Faturamento

 */

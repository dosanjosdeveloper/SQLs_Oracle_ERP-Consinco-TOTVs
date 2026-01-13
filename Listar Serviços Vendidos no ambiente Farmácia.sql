select a.nroempresa, 
       a.nrocheckout,
       a.seqproduto,
       b.desccompleta,
       a.vlrtotal,
       a.nrovendedor,
       a.nroprevenda,
       to_char(a.dtahoremissao,'DD/MM/YYYY HH24:MM:SS') as DTA_VENDA from 
   consincomonitor.tb_doctoitem a, consincomonitor.tb_produto b
     where a.seqproduto = b.seqproduto
     and a.nroempresa = '12' 
     and a.nrocheckout in (1,2) 
     and a.status = 'V'
     and trunc(a.dtahoremissao) between '01dec2025' and sysdate
     and a.seqproduto in (2189674,2189739,2189763,
2214784,2214792,2214806,2214814,
2214822,2214830,2214849,2214857,
2214865,2214873,2214881,1763008,
1763105,1763113
);
     


-- select * from tb_produto
-- select * from tb_doctoitem
-- select * from tb_prodcodigo where nroempresa = 11 and codacesso in (301,302,303)

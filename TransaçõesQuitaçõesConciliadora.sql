-- select * from fi_baixacartaoarquivo b where b.dtaimportacao between '04feb2024' and '12feb2024';
-- select * from fi_baixacartaotransacao c where c.seqarquivo in (20024781); -- 19478452, 19466133, 19490600,19495270,19495368
-- select * from fi_tsnfaixabintefcodmovto
-- select * from fi_tscodmovimento where codredetef = 113

select
   c.rede, 
   c.bandeira, 
   c.redeconvertida, 
   c.bandeiraconv,
   f.descricao,
   f.codmovimento
    from fi_baixacartaotransacao c   , fi_tscodmovimento f 
      where  c.seqarquivo in (17015691) --(20024781)
      and c.redeconvertida = to_number(f.codredetef)
      and c.bandeiraconv = f.codbandeiratef
      and c.rede not in (157,9,20)
--      and f.descricao like '%PLUS%' OR f.descricao like '%SODEX%'


    
/*    
Select
   a.codmovimento as  COD_MOV,
   a.descricao,
   a.tipo,
   a.codtippdv as COD_PDV,
   a.status
From FI_TSCODMOVIMENTO a 

Order by 1
*/

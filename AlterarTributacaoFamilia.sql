--  select * from map_produto
-- select * from mrl_produtoempresa
-- select * from RF_TABAUXPC
-- select * from RF_TABAUXPCITENS -- CODIGO NATUREZA RECEITA
-- UPDATE map_familia SET 
situacaonfpis = '73', situacaonfcofins = '73' , 
situacaonfpissai = '06' , situacaonfcofinssai = '06', 
codnatrec = '130', seqnatrec = '299'  
WHERE seqfamilia IN (155254,155253);


select a.seqfamilia,a.situacaonfpis, a.situacaonfcofins,
a.situacaonfpissai, a.situacaonfcofinssai, a.codnatrec, a.seqnatrec from map_familia a where a.seqfamilia IN (155254,155253)
select * from map_produto
select * from map_familia a where 
select * from map_classifabc where nrosegmento = 2
select * from mad_segmento
select * from mrl_prodempseg where nroempresa = 13 and seqproduto = 1948113 and nrosegmento = 2
select * from map_famdivcateg where seqfamilia = 340
select * from map_categoria
select * from dim_categoria
-- select mp.seqproduto, mp.desccompleta from map_produto mp
*/
Select
    s.descsegmento as SEGMENTO,
    dc.categorian1 as CATEGORIA,
    P.SEQPRODUTO,
    p.desccompleta as DESCRICAO_PRODUTO,
    pes.qtdembalagem as QT_EMB,
    TO_CHAR (pes.precobasenormal,'FM999G999G990D00','nls_numeric_characters='',.''') as PRECO_BASE,
    c.classifcomercabc as CLASSIF,
    TO_CHAR(c.percomissaonormal,'90D99','nls_numeric_characters='',.''') as PERCENT_COMISSAO
      
From MAD_FAMSEGMENTO FS, 
MAP_PRODUTO P, 
MAP_CLASSIFABC C, 
MAD_SEGMENTO S, 
MRL_PRODEMPSEG PES,
     map_famdivcateg f
     , map_categoria cat,
      dim_categoria dc
     
where fs.seqfamilia = p.seqfamilia
  and c.nrosegmento = fs.nrosegmento
  and c.classifcomercabc = fs.classifcomercabc       
  and s.nrosegmento = fs.nrosegmento
  and s.nrosegmento = c.nrosegmento
  and pes.nrosegmento = s.nrosegmento
  and pes.nrosegmento = c.nrosegmento
  and pes.nrosegmento = fs.nrosegmento
  and pes.seqproduto = p.seqproduto
  and f.seqcategoria = cat.seqcategoria
  and dc.seqfamilia = p.seqfamilia
  and dc.nrodivisao = f.nrodivisao 
  and fs.seqfamilia = f.seqfamilia
  and p.seqfamilia = f.seqfamilia
  and fs.nrosegmento = s.nrosegmento
  and f.nrodivisao = cat.nrodivisao
  
  and f.nrodivisao = 1
  and pes.nroempresa = 13
  and fs.nrosegmento = 2 
  and pes.statusvenda = 'A'
  and f.status = 'A'
  and cat.nivelhierarquia = 4
  and cat.statuscategor = 'A'

Order by dc.categorian1, p.desccompleta, pes.qtdembalagem

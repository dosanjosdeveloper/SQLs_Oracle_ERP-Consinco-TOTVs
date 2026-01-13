-- ============================================
-- CRIADO POR: RAFAEL DOS ANJOS 12/10/2025
-- VIEW: TI_RFL_VW_VESTCASA
-- PROJETO VESTCASA - VENDA DO DIA ANTERIOR
-- ============================================
CREATE OR REPLACE VIEW TI_RFL_VW_VESTCASA AS
Select
 a.NROEMPRESA as COD_FILIAL,
 a.NOMEREDUZIDO as FILIAL,
 TO_CHAR (SYSDATE-1,'DD/MM/YYYY') as DTAVDA, ---VENDA DO DIA ANTERIOR
 a.SEQPRODUTO as COD_INTERNO,
 (Select x.codacesso From map_prodcodigo x Where x.seqproduto = a.seqproduto and x.tipcodigo = 'E' and x.qtdembalagem = 1 and x.indutilvenda = 'S' FETCH FIRST 1 ROW ONLY) as CODIGO_BARRAS,
 a.DESCCOMPLETA as MATERIAL_DESCRICAO,
 (SELECT sum (h.qtdvda-h.qtddevol) from mrl_custodia h Where (h.qtdvda) > 0 and h.nroempresa = a.NROEMPRESA and h.seqproduto = a.SEQPRODUTO AND h.dtaentradasaida = trunc (sysdate-1)) as QTDE_VENDIDA,
 (SELECT sum (h.vlrtotalvda-h.vlrtotaldevol) from mrl_custodia h Where (h.qtdvda) > 0 and h.nroempresa = a.NROEMPRESA and h.seqproduto = a.SEQPRODUTO AND h.dtaentradasaida = trunc (sysdate-1)) as TOTAL_FATURADO,
 Trunc (a.MGMPRECOVALIDO,2) as PERC_MARGEM,
 (SELECT (h.Vlrtotalvda/H.QTDVDA) from mrl_custodia h Where (h.qtdvda) > 0 and h.nroempresa = a.NROEMPRESA and h.seqproduto = a.SEQPRODUTO AND h.dtaentradasaida = trunc (sysdate-1)) AS PRECO_VENDA_UNITARIO, 
 (SELECT trunc((h.vlrcusliquidovda/h.qtdvda),2) from mrl_custodia h Where (h.qtdvda) > 0 and h.nroempresa = a.NROEMPRESA and h.seqproduto = a.SEQPRODUTO AND h.dtaentradasaida = trunc (sysdate-1)) AS PREÇO_CUSTO_UNITARIO, 
 Trunc (a.ESTQLOJA) as ESTOQUE_DISPONIVEL,
 LPAD(e.nrocgc,12,0)||LPAD(e.digcgc,2,0) as CNPJ_FILIAL

From MAXV_MGMBASEPRODSEG a, max_empresa e
Where a.NROEMPRESA = e.nroempresa
  and a.QTDEMBALAGEM = 1
  and a.NROSEGMENTO = 1
------------------------------------------  
  and a.NROEMPRESA = 3  
  and a.SEQFORNECEDOR in (32872,32873,32874,32875,32876); --PRODUTOS ASSOCIADOS AO FORNECEDOR VESTCASA;
  
  
  SELECT* FROM TI_RFL_VW_VESTCASA;
  
  
  
  Select distinct
 a.DESCSEGMENTO as SEGMENTO,
 a.SEQPRODUTO,
 a.DESCCOMPLETA as DESCRICAO,
 A.MARGEMLUCROSEGMENTO as MG_SEGMENTO,
 A.MGMLUCROCATEGORIA as MG_CATEGORIA,
 a.MGMLUCRO as MARGEM_HOJE

From MAXV_MGMBASEPRODSEG a
Where 1=1
  and a.NROSEGMENTO = 1
  and a.QTDEMBALAGEM = 1
  and a.NROEMPRESA not in (13,24) 
  --and a.NROEMPRESA in (7,9)
  and a.SEQPRODUTO = 1331957
  

Order by a.DESCCOMPLETA


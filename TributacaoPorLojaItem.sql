----------RESUMO POR LOJA----------
Select distinct
e.nomereduzido as LOJA,
Count (p.seqproduto) as QUANT  

From mrl_produtoempresa pe,
     mrl_prodempseg pes,
     map_familia f,
     map_produto p,
     map_categoria c,
     map_famdivcateg fdc,
     map_famdivisao d,
     max_empresa e

Where f.seqfamilia = p.seqfamilia
and   f.seqfamilia = fdc.seqfamilia
and   f.seqfamilia = d.seqfamilia
and   c.seqcategoria  = fdc.seqcategoria
and   c.nrodivisao    = fdc.nrodivisao
and   c.statuscategor = fdc.status
and   d.nrodivisao    = fdc.nrodivisao
and   pe.seqproduto = p.seqproduto
and   pes.seqproduto = p.seqproduto
and   pes.nroempresa = pe.nroempresa
and   e.nroempresa = pe.nroempresa
and   c.tipcategoria  = 'M'
and   c.categoria     != 'FAMILIAS'
and   c.categoria     != ' A CLASSIFICAR'

and   f.familia not like 'INATIVO%'
and   f.familia not like 'NFDESP%'
and   fdc.nrodivisao  = 1
and   c.nivelhierarquia = 1
and   pes.nrosegmento = 1
and   pes.qtdembalagem = 1
and   c.statuscategor = 'A'
and   pes.statusvenda = 'A'
and   c.categoria not in ('90 MATERIA PRIMA', '99 INATIVOS','31 IMOBILIZADOS')

and   pe.nroempresa in (1,2,3,5,6,8,9)
and   d.nrotributacao in (1,412)
and   pe.estqloja <> 0

Group by e.nomereduzido
Order by e.nomereduzido;
         
-----------------------------------------------------
-----------------------------------------------------

----------DETALHADO POR EMPRESA X CATEGORIA----------
Select
e.nomereduzido as LOJA,
c.categoria,
Count (p.seqproduto) as QUANT  

From mrl_produtoempresa pe,
     mrl_prodempseg pes,
     map_familia f,
     map_produto p,
     map_categoria c,
     map_famdivcateg fdc,
     map_famdivisao d,
     max_empresa e

Where f.seqfamilia = p.seqfamilia
and   f.seqfamilia = fdc.seqfamilia
and   f.seqfamilia = d.seqfamilia
and   c.seqcategoria  = fdc.seqcategoria
and   c.nrodivisao    = fdc.nrodivisao
and   c.statuscategor = fdc.status
and   d.nrodivisao    = fdc.nrodivisao
and   pe.seqproduto = p.seqproduto
and   pes.seqproduto = p.seqproduto
and   pes.nroempresa = pe.nroempresa
and   e.nroempresa = pe.nroempresa
and   c.tipcategoria  = 'M'
and   c.categoria     != 'FAMILIAS'
and   c.categoria     != ' A CLASSIFICAR'

and   f.familia not like 'INATIVO%'
and   f.familia not like 'NFDESP%'
and   fdc.nrodivisao  = 1
and   c.nivelhierarquia = 1
and   pes.nrosegmento = 1
and   pes.qtdembalagem = 1
and   c.statuscategor = 'A'
and   pes.statusvenda = 'A'
and   c.categoria not in ('90 MATERIA PRIMA', '99 INATIVOS','31 IMOBILIZADOS')

and   pe.nroempresa in (1,2,3,5,6,8,9)

and   d.nrotributacao in (1,412)
and   pe.estqloja <> 0

Group by rollup (e.nomereduzido,c.categoria)
         
Order by e.nomereduzido,
         c.categoria
         
         

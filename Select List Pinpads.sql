-- select * from tb_pinpadcheckout a where a.nroempresa = '7' -- a.serie in ('','','')
-- select * from tb_pinpadcheckout a where a.serie in ('18013PP30916311','16127PP30747784','16162PP30760067')

-- select * from tb_pinpadcheckout a where a.serie in ('17320PP30900722','16166PP30762201','16162PP30760067')

-- select * from mad_cargareceb a where  a.nroempresa = '9' and a.descricao like '%59806%'
select * from mad_cargarecebnf b where b.numeronf = '59806' 
select * from mad_cargareceblog c where c.nrocargareceb = '286386'

select * from mad_cargarecebadvertencia c where c.nrocargareceb = '286386'


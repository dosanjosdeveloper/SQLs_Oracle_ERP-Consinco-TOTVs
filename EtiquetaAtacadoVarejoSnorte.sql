create or replace view mrlv_etqgonsupernorte_ata as
select a."NROEMPRESA",
       a."SEQPRODUTO",
       a."CODACESSO",
       a."QTDETIQUETA",
       a."DTAPROMINICIO",
       a."DTAPROMFIM",
       a."CODACESSOPADRAO",
       a."EMBALAGEMPADRAO",
       a."PADRAOEMBVENDA",
       a."PRECOEMBPADRAO",
       a."MULTEQPEMBPADRAO",
       a."QTDUNIDEMBPADRAO",
       a."TIPOETIQUETA",
       a."TIPOPRECO",
       a."DESCCOMPLETA",
       a."DESCREDUZIDA",
       a."QTDEMBALAGEM1",
       a."MULTEQPEMB1",
       a."QTDUNIDEMB1",
       a."QTDEMBALAGEM2",
       a."MULTEQPEMB2",
       a."QTDUNIDEMB2",
       a."QTDEMBALAGEM3",
       a."MULTEQPEMB3",
       a."QTDUNIDEMB3",
       a."QTDEMBALAGEM4",
       a."MULTEQPEMB4",
       a."QTDUNIDEMB4",
       a."QTDEMBALAGEM5",
       a."MULTEQPEMB5",
       a."QTDUNIDEMB5",
       a."CODACESSO1",
       a."CODACESSO2",
       a."CODACESSO3",
       a."CODACESSO4",
       a."CODACESSO5",
       a."PRECO1",
       a."PRECO2",
       a."PRECO3",
       a."PRECO4",
       a."PRECO5",
       a."PRECOMIN",
       a."PRECOMAX",
       a."EMBALAGEM1",
       a."EMBALAGEM2",
       a."EMBALAGEM3",
       a."EMBALAGEM4",
       a."EMBALAGEM5",
       a."DTABASEPRECO",
       a."TIPOCODIGO",
       a."QTDEMBCODACESSO",
       '^XA'

--------------------------------------------------------DESCRICAO----------------------------------------------
|| chr(13) || chr(10) || '^FO060,006^APN,40,40^FD'          ||fc5_quebralinha(a.desccompleta,70,1) || '^FS'


--------------------------------------------------------CODIGO DE ACESSO---------------------------------------
|| chr(13) || chr(10) || DECODE(K.TIPCODIGO, 'B', '^FO575,0150^BY2,2.5,60^BCN,50,B,N^FD', '^FO575,0150^BY2,2.5,60^BEN,50,B,N^FD')
                        ||(K.CODACESSO) ||'^FS'

--------------------------------------------------------VAREJO/ATACADO-----------------------------------------
|| chr(13) || chr(10) || '^FO540,055^APN,35,35^FD' ||'VAREJO'||'^FS'

--------------------------------------------------------CAIXA--------------------------------------------------
|| chr(13) || chr(10) || '^FO60,050^GB365,95,95^FD  '|| '^FS'
|| chr(13) || chr(10) || '^FO425,050^GB340,095,0^FD  '|| '^FS'

--------------------------------------------------------PREÇO EMBAÇAGEM PADRAO---------------------------------
|| chr(13) || chr(10) || '^FO425,090^APN,50,50^FD'   ||'R$'||'^FS'

|| chr(13) || chr(10) || '^FO490,090^APN,50,100^FD'   ||replace(TO_CHAR(DECODE(A.PRECOVALIDPROMOC,0,A.PRECOEMBPADRAO,A.PRECOEMBPADRAO),'FM999,999,990.00'), '.', ',')|| '^FS'

|| (case when j.multeqpemb is not null  or j.multeqpembalagem is not null Then
     chr(13) || chr(10) || '^FO540,190^APN,20,20^FR^FD' || 'PRECO PAGO POR ' || j.multeqpembalagem ||' R$   '|| decode(sign(j.precogerpromoc),
     +1, translate(to_char(round((j.precogerpromoc/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ',')
     , translate(to_char(round((j.precogernormal/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ','))
|| chr(13) || chr(10) || ''
end)||'^FS'

--------------------------------------------------------PREÇO EMBAÇAGEM SEGUNDO PREÇO---------------------------
|| chr(13) || chr(10) || '^FO070,055^APN,35,35^FR^FD'    ||'ATACADO APARTIR DE '||a.qtdembalagem1||'^FS'

|| chr(13) || chr(10) || '^FO070,090^APN,50,50^FR^FD'    ||'R$'||'^FS'

|| chr(13) || chr(10) || '^FO130,090^APN,060,100^FR^FD'
|| lpad(trunc(a.preco1/a.qtdembalagem1), 4, ' ')||','
                    || lpad(((a.preco1/a.qtdembalagem1) - trunc(a.preco1/a.qtdembalagem1)) * 100, 2, 0)|| '^FS'

|| chr(13) || chr(10) || '^FO060,150^APN,10,10^FR^FD' || 'Valor Total: '|| ' R$ '  ||replace(TO_CHAR(a.preco1, 'FM999,999,990.00'), '.', ',')|| '^FS'


|| (case when j.multeqpemb is not null  or j.multeqpembalagem is not null Then
     chr(13) || chr(10) || '^FO180,190^APN,20,20^FR^FD' || 'PRECO PAGO POR ' || j.multeqpembalagem ||' R$   '|| decode(sign(j.precogerpromoc),
     +1, translate(to_char(round((j.precogerpromoc/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ',')
     , translate(to_char(round((a.precomin/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ','))
|| chr(13) || chr(10) || ''
end)||'^FS'

--------------------------------------------------------RODAPE--------------------------------------------------
|| chr(13) || chr(10) || '^FO400,190^APN,25,25^FD'            ||'COD/PLU:'|| a.seqproduto ||'^FS'
|| chr(13) || chr(10) || '^FO080,190^APN,25,25^FD'            ||c.fantasia||'^FS'
|| chr(13) || chr(10) || '^FO280,190^APN,25,25^FD'            ||sysdate||'^FS'
|| chr(13) || chr(10) || '^PQ' || CASE WHEN nvl(a.qtdetiqueta, 1) > 15 THEN 1 ELSE nvl(a.qtdetiqueta, 1) END      || ',,,' || '^FS^LL1150^FS'

-------------------------------------------------------UNIDADE--------------------------------------
|| chr(13) || chr(10) || '^CFA,30'||'^FO510,155^APN,030,030^FD'||a.embalagempadrao||'^FS'
|| chr(13) || chr(10) || '^XZ'
|| chr(13) || chr(10) linha

--------------------------------------------------------CONDICAO-------------------------------------------------

FROM  MRLX_BASEETIQUETAPROD A,GE_PESSOA C, MAX_EMPRESA BB,MAP_PRODCODIGO B, MRLV_BASEETIQUETAPROD J, MAP_PRODCODIGO K
 WHERE A.CODACESSOPADRAO = B.CODACESSO
 AND A.NROEMPRESA = C.SEQPESSOA
 AND A.NROEMPRESA             = J.NROEMPRESA
 AND A.SEQPRODUTO             = J.SEQPRODUTO
 AND A.NROSEGMENTO            = J.NROSEGMENTO
 AND BB.SEQPESSOAEMP =  C.SEQPESSOA
 AND A.PRECO1 > 0
 AND TRUNC (NVL((A.PRECO1 / A.QTDEMBALAGEM1),0),2)  < TRUNC(A.PRECOEMBPADRAO,2)
 AND A.SEQPRODUTO             = K.SEQPRODUTO
 AND A.CODACESSOPADRAO        = K.CODACESSO
 AND A.PADRAOEMBVENDA         = K.QTDEMBALAGEM
 AND K.TIPCODIGO              IN ('E', 'B', 'D')


UNION ALL

select a."NROEMPRESA",
       a."SEQPRODUTO",
       a."CODACESSO",
       a."QTDETIQUETA",
       a."DTAPROMINICIO",
       a."DTAPROMFIM",
       a."CODACESSOPADRAO",
       a."EMBALAGEMPADRAO",
       a."PADRAOEMBVENDA",
       a."PRECOEMBPADRAO",
       a."MULTEQPEMBPADRAO",
       a."QTDUNIDEMBPADRAO",
       a."TIPOETIQUETA",
       a."TIPOPRECO",
       a."DESCCOMPLETA",
       a."DESCREDUZIDA",
       a."QTDEMBALAGEM1",
       a."MULTEQPEMB1",
       a."QTDUNIDEMB1",
       a."QTDEMBALAGEM2",
       a."MULTEQPEMB2",
       a."QTDUNIDEMB2",
       a."QTDEMBALAGEM3",
       a."MULTEQPEMB3",
       a."QTDUNIDEMB3",
       a."QTDEMBALAGEM4",
       a."MULTEQPEMB4",
       a."QTDUNIDEMB4",
       a."QTDEMBALAGEM5",
       a."MULTEQPEMB5",
       a."QTDUNIDEMB5",
       a."CODACESSO1",
       a."CODACESSO2",
       a."CODACESSO3",
       a."CODACESSO4",
       a."CODACESSO5",
       a."PRECO1",
       a."PRECO2",
       a."PRECO3",
       a."PRECO4",
       a."PRECO5",
       a."PRECOMIN",
       a."PRECOMAX",
       a."EMBALAGEM1",
       a."EMBALAGEM2",
       a."EMBALAGEM3",
       a."EMBALAGEM4",
       a."EMBALAGEM5",
       a."DTABASEPRECO",
       a."TIPOCODIGO",
       a."QTDEMBCODACESSO",
                         '^XA'

--Preço Normal
--------------------------------------------------------CODIGO DE ACESSO---------------------------------------
|| chr(13) || chr(10) || DECODE(K.TIPCODIGO, 'B', '^FO575,0150^BY2,2.5,60^BCN,50,B,N^FD', '^FO575,0150^BY2,2.5,60^BEN,50,B,N^FD')
                        ||(K.CODACESSO) ||'^FS'

--------------------------------------------------------DESCRICAO--------------------------------------

|| chr(13) || chr(10) || '^FO075,005^APN,50,50^FD'          ||fc5_quebralinha(a.desccompleta,27,1) || '^FS'
|| chr(13) || chr(10) || '^FO075,047^APN,50,50^FD'          ||fc5_quebralinha(a.desccompleta,27,2) || '^FS'

--------------------------------------------------------PRECO--------------------------------------
|| chr(13) || chr(10) || '^FO075,090^APN,120,120^FD'||'R$'||'^FS'

|| chr(13) || chr(10) || '^FO200,090^APN,120,120^FD'      ||replace(TO_CHAR(DECODE(A.PRECOVALIDPROMOC,0,A.PRECOEMBPADRAO,A.PRECOEMBPADRAO),'FM999,999,990.00'), '.', ',')|| '^FS'

--------------------------------------------------------PRECO POR--------------------------------------

|| (case when j.multeqpemb is not null  or j.multeqpembalagem is not null Then
     chr(13) || chr(10) || '^FO230,215^APN,20,20^FD' || 'PRECO PAGO POR ' || j.multeqpembalagem ||' R$   '|| decode(sign(j.precogerpromoc),
     +1, translate(to_char(round((j.precogerpromoc/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ',')
     , translate(to_char(round((j.precogernormal/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ','))
|| chr(13) || chr(10) || ''
end)||'^FS'

--------------------------------------------------------RODAPE--------------------------------------

|| chr(13) || chr(10) || '^FO420,190^APN,25,25^FD'            ||'COD/PLU:'|| a.seqproduto ||'^FS'
|| chr(13) || chr(10) || '^FO080,190^APN,25,25^FD'            ||c.fantasia||'^FS'
|| chr(13) || chr(10) || '^FO280,190^APN,25,25^FD'            ||sysdate||'^FS'
|| chr(13) || chr(10) || '^PQ' || CASE WHEN nvl(a.qtdetiqueta, 1) > 15 THEN 1 ELSE nvl(a.qtdetiqueta, 1) END      || ',,,' || '^FS^LL1150^FS'

-------------------------------------------------------UNIDADE--------------------------------------
|| chr(13) || chr(10) || '^CFA,30'||'^FO510,155^APN,030,030^FD'||a.embalagempadrao||'^FS'
|| chr(13) || chr(10) || '^XZ'
|| chr(13) || chr(10) linha

--------------------------------------------------------CONDICAO--------------------------------------

FROM  MRLX_BASEETIQUETAPROD A, MAX_EMPRESA B, GE_PESSOA C, MRLV_BASEETIQUETAPROD J, MAP_PRODCODIGO K
WHERE  A.NROEMPRESA          =  B.NROEMPRESA
AND A.NROEMPRESA = C.SEQPESSOA
AND B.SEQPESSOAEMP           =  C.SEQPESSOA
AND A.NROEMPRESA             = J.NROEMPRESA
AND A.SEQPRODUTO             = J.SEQPRODUTO
AND A.NROSEGMENTO            = J.NROSEGMENTO
AND J.STATUSVENDA = 'A'
AND A.SEQPRODUTO             = K.SEQPRODUTO
AND A.CODACESSOPADRAO        = K.CODACESSO
AND A.PADRAOEMBVENDA         = K.QTDEMBALAGEM
AND K.TIPCODIGO              IN ('E', 'B', 'D')


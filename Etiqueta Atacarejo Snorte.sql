create or replace view mrlv_etqgonlag_atacarejo as
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

--############################################# ETIQUETA COM 3 PREÇOS ###################################

--------------------------------------------------------DESCRICAO----------------------------------------------
|| chr(13) || chr(10) || '^FO010,010^APN,50,50^FD'          ||fc5_quebralinha(a.descreduzida,31,1) || '^FS'

|| chr(13) || chr(10) || '^FO010,065^APN,25,25^FD'          ||fc5_quebralinha(a.desccompleta,70,1) || '^FS'


--------------------------------------------------------CODIGO DE ACESSO---------------------------------------
|| chr(13) || chr(10) || DECODE(K.TIPCODIGO, 'B', '^FO565,0460^BY2,2.5,60^BCN,60,B,N^FD^FD', '^FO565,0460^BY2,2.5,60^BEN,60,B,N^FD')
                        ||(K.CODACESSO) ||'^FS'

--------------------------------------------------------VAREJO/ATACADO/CARTAO-----------------------------------------
|| chr(13) || chr(10) || '^FO070,100^APN,35,35^FD' ||'ATACADO'||'^FS'
|| chr(13) || chr(10) || '^FO008,0240^APN,30,30^FD'||'ATACADO APARTIR'||'^FS'
|| chr(13) || chr(10) || '^FO008,0280^APN,30,30^FD'||'DE '||'^FS'
|| chr(13) || chr(10) || '^FO360,0280^APN,30,30^FD'||a.qtdembalagem1||' UNIDADES'||'^FS'


|| chr(13) || chr(10) || '^FO610,100^APN,35,35^FD' ||'VAREJO'||'^FS'
-- || chr(13) || chr(10) || '^FO605,0240^APN,30,30^FR^FD'||'UNIDADE'||'^FS'
|| chr(13) || chr(10) || '^FO045,090^APN,50,50^FR^FD'||'R$'||'^FS'

--------------------------------------------------------CAIXA--------------------------------------------------
|| chr(13) || chr(10) || '^FO010,090^GB252,330,0^FD  '|| '^FS'
|| chr(13) || chr(10) || '^FO270,090^GB260,330,130^FD'|| '^FS' -- CAIXA PRETA

|| chr(13) || chr(10) || '^FO310,100^APN,35,35^FR^FD' ||'TELEVENDAS'||'^FS'
|| chr(13) || chr(10) || '^FO345,0240^APN,30,30^FR^FD' ||'UNIDADE'||'^FS'


|| chr(13) || chr(10) || '^FO540,090^GB250,330,0^FD  '|| '^FS'

--------------------------------------------------------PREÇO SEGUNDA EMBALAGEM ATACADO------------------------------------------
|| chr(13) || chr(10) || '^FO020,0150^APN,80,80^FD'
|| lpad(trunc(a.preco1/a.qtdembalagem1), 4, ' ')||','
                    || lpad(((a.preco1/a.qtdembalagem1) - trunc(a.preco1/a.qtdembalagem1)) * 100, 2, 0)|| '^FS'

|| (case when j.multeqpemb is not null  or j.multeqpembalagem is not null Then
     chr(13) || chr(10) || '^FO020,380^APN,10,10^FD' || 'PRECO PAGO POR ' || j.multeqpembalagem ||' R$   '|| decode(sign(j.precogerpromoc),
     +1, translate(to_char(round((j.precogerpromoc/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ',')
     , translate(to_char(round((a.precomin/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ','))
|| chr(13) || chr(10) || ''
end)||'^FS'


|| chr(13) || chr(10) || '^FO020,400^APN,10,10^FD' || 'VALOR TOTAL: '|| ' R$ '  ||replace(TO_CHAR(a.preco1, 'FM999,999,990.00'), '.', ',')|| '^FS'


--------------------------------------------------------PREÇO EMBALAGEM TELEVENDAS-------------------------------
|| chr(13) || chr(10) || '^FO290,0150^APN,80,80^FR^FD'
|| lpad(trunc(a.preco2/a.qtdembalagem2), 4, ' ')||','
                    || lpad(((a.preco2/a.qtdembalagem2) - trunc(a.preco2/a.qtdembalagem2)) * 100, 2, 0)|| '^FS'

|| (case when j.multeqpemb is not null  or j.multeqpembalagem is not null Then
     chr(13) || chr(10) || '^FO0275,380^APN,10,10^FR^FD' || 'PRECO PAGO POR ' || j.multeqpembalagem ||' R$   '|| decode(sign(j.precogerpromoc),
     +1, translate(to_char(round((j.precogerpromoc/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ',')
     , translate(to_char(round((A.PRECO2/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ','))
|| chr(13) || chr(10) || ''
end)||'^FS'

|| chr(13) || chr(10) || '^FO275,400^APN,10,10^FR^FD' || 'VALOR TOTAL: '|| ' R$ '  ||replace(TO_CHAR(a.preco2, 'FM999,999,990.00'), '.', ',')|| '^FS'



--------------------------------------------------------PREÇO EMBALAGEM VAREJO-------------------------------
|| chr(13) || chr(10) || '^FO605,0150^APN,80,80^FD'   ||replace(TO_CHAR(DECODE(A.PRECOVALIDPROMOC,0,A.PRECOEMBPADRAO,A.PRECOEMBPADRAO),'FM999,999,990.00'), '.', ',')|| '^FS'


|| (case when j.multeqpemb is not null  or j.multeqpembalagem is not null Then
     chr(13) || chr(10) || '^FO0550,380^APN,10,10^FD' || 'PRECO PAGO POR ' || j.multeqpembalagem ||' R$   '|| decode(sign(j.precogerpromoc),
     +1, translate(to_char(round((j.precogerpromoc/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ',')
     , translate(to_char(round((j.precogernormal/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ','))
|| chr(13) || chr(10) || ''
end)||'^FS'

-------------------------------------------------------UNIDADE--------------------------------------------------
|| chr(13) || chr(10) || '^CFA,30'||'^FO510,155^APN,030,030^FD'||a.embalagempadrao||'^FS'


--------------------------------------------------------RODAPE--------------------------------------------------
|| chr(13) || chr(10) || '^FO220,530^APN,25,25^FD'            ||'COD/PLU:'|| a.seqproduto ||'^FS'
|| chr(13) || chr(10) || '^FO040,466^APN,45,45^FD'            ||'ATACADAO LAG'||'^FS'
|| chr(13) || chr(10) || '^FO040,500^APN,25,25^FD'            ||c.fantasia||'^FS'
|| chr(13) || chr(10) || '^FO070,530^APN,25,25^FD'            ||sysdate||'^FS'
|| chr(13) || chr(10) || '^PQ' || CASE WHEN nvl(a.qtdetiqueta, 1) > 15 THEN 1 ELSE nvl(a.qtdetiqueta, 1) END      || ',,,' || '^FS^LL1150^FS'
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
 AND A.PRECO2 > 0
 AND TRUNC (NVL((A.PRECO1 / A.QTDEMBALAGEM1),0),2)  < TRUNC(A.PRECOEMBPADRAO,2)
 AND A.SEQPRODUTO             = K.SEQPRODUTO
 AND A.CODACESSOPADRAO        = K.CODACESSO
 AND A.PADRAOEMBVENDA         = K.QTDEMBALAGEM
 AND K.TIPCODIGO              IN ('E', 'B', 'D')



UNION ALL
--############################################# ETIQUETA COM 2 PREÇOS ###################################

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

--------------------------------------------------------DESCRICAO---------------------------------------------- Editado por Rafael dos Anjos 02092020
-- || chr(13) || chr(10) || '^FO010,010^APN,50,50^FD'          ||fc5_quebralinha(a.descreduzida,31,1) || '^FS'

|| chr(13) || chr(10) || '^FO040,005^APN,40,40^FD'          ||fc5_quebralinha(a.desccompleta,70,1) || '^FS'


--------------------------------------------------------CODIGO DE ACESSO---------------------------------------
|| chr(13) || chr(10) || DECODE(K.TIPCODIGO, 'B', '^FO575,150^BY2,2.5,80^BCN,40,B,N^FD^FD', '^FO575,150^BY2,2.5,80^BEN,40,B,N^FD')
                        ||(K.CODACESSO) ||'^FS'

--------------------------------------------------------VAREJO/ATACADO/CARTAO-----------------------------------------

|| chr(13) || chr(10) || '^FO540,055^APN,35,35^FD' ||'VAREJO'||'^FS'
-- || chr(13) || chr(10) || '^FO045,090^APN,50,50^FD'||'UNIDADE'||'^FS'
|| chr(13) || chr(10) || '^FO410,090^APN,50,50^FD'||'R$'||'^FS'
--|| chr(13) || chr(10) || '^FO045,090^APN,50,50^FR^FD'||'R$'||'^FS'
-- || chr(13) || chr(10) || '^FO070,090^APN,50,50^FR^FD'||'R$'||'^FS'

--------------------------------------------------------CAIXA--------------------------------------------------
|| chr(13) || chr(10) || '^FO040,050^GB365,095,100^FD'|| '^FS'-- CAIXA PRETA
-- || chr(13) || chr(10) || '^FO100,0100^APN,45,45^FR^FD' ||'ATACADO'||'^FS'
|| chr(13) || chr(10) || '^FO045,055^APN,35,35^FR^FD'||'ATACADO APARTIR DE '||'^FS'
|| chr(13) || chr(10) || '^FO360,055^APN,35,35^FR^FD'||a.qtdembalagem1||'^FS'
|| chr(13) || chr(10) || '^FO045,090^APN,50,50^FR^FD'||'R$'||'^FS'
-- || chr(13) || chr(10) || '^FO118,055^APN,35,35^FR^FD'||a.qtdembalagem1||' UNIDADES'||'^FS' --bkp
|| chr(13) || chr(10) || '^FO0400,050^GB370,100,1^FD'||'^FS'

--------------------------------------------------------PREÇO SEGUNDA EMBALAGEM ATACADO------------------------------------------
|| chr(13) || chr(10) || '^FO100,090^APN,050,100^FR^FD'|| lpad(trunc(a.preco1/a.qtdembalagem1), 4, ' ')||','
                    || lpad(((a.preco1/a.qtdembalagem1) - trunc(a.preco1/a.qtdembalagem1)) * 100, 2, 0)|| '^FS'

-- || (case when j.multeqpemb is not null  or j.multeqpembalagem is not null Then
--     chr(13) || chr(10) || '^FO020,380^APN,10,10^FR^FD' || 'PRECO PAGO POR ' || j.multeqpembalagem ||' R$   '|| decode(sign(j.precogerpromoc),
--     +1, translate(to_char(round((j.precogerpromoc/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ',')
--     , translate(to_char(round((j.precogernormal/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ','))
-- || chr(13) || chr(10) || ''
-- end)||'^FS'


|| chr(13) || chr(10) || '^FO040,155^APN,10,10^FR^FD' || 'VALOR TOTAL: '|| ' R$ '  ||replace(TO_CHAR(a.preco1, 'FM999,999,990.00'), '.', ',')|| '^FS'


--------------------------------------------------------PREÇO EMBALAGEM VAREJO-------------------------------
|| chr(13) || chr(10) || '^FO470,090^APN,050,100^FD'   ||replace(TO_CHAR(DECODE(A.PRECOVALIDPROMOC,0,A.PRECOEMBPADRAO,A.PRECOEMBPADRAO),'FM999,999,990.00'), '.', ',')|| '^FS'

|| (case when j.multeqpemb is not null  or j.multeqpembalagem is not null Then
     chr(13) || chr(10) || '^FO410,400^APN,10,10^FD' || 'PRECO PAGO POR ' || j.multeqpembalagem ||' R$   '|| decode(sign(j.precogerpromoc),
     +1, translate(to_char(round((j.precogerpromoc/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ',')
     , translate(to_char(round((j.precogernormal/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ','))
|| chr(13) || chr(10) || ''
end)||'^FS'

-------------------------------------------------------UNIDADE--------------------------------------------------
|| chr(13) || chr(10) || '^CFA,30'||'^FO510,155^APN,030,030^FD'||a.embalagempadrao||'^FS'

--------------------------------------------------------RODAPE--------------------------------------------------
|| chr(13) || chr(10) || '^FO400,190^APN,25,25^FD'            ||'COD/PLU:'|| a.seqproduto ||'^FS'
-- || chr(13) || chr(10) || '^FO040,466^APN,45,45^FD'            ||'ATACADAO LAG'||'^FS'
|| chr(13) || chr(10) || '^FO040,190^APN,25,25^FD'            ||c.fantasia||'^FS'
|| chr(13) || chr(10) || '^FO260,190^APN,25,25^FD'            ||sysdate||'^FS'
|| chr(13) || chr(10) || '^PQ' || CASE WHEN nvl(a.qtdetiqueta, 1) > 15 THEN 1 ELSE nvl(a.qtdetiqueta, 1) END      || ',,,' || '^FS^LL1150^FS'
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
--############################################# ETIQUETA COM 1 PREÇO ###################################


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
-- || chr(13) || chr(10) || '^FO010,010^APN,50,50^FD'          ||fc5_quebralinha(a.descreduzida,31,1) || '^FS'

|| chr(13) || chr(10) || '^FO040,005^APN,50,50^FD'          ||fc5_quebralinha(a.desccompleta,70,1) || '^FS'


--------------------------------------------------------CODIGO DE ACESSO---------------------------------------
|| chr(13) || chr(10) || DECODE(K.TIPCODIGO, 'B', '^FO575,150^BY2,2.5,60^BCN,40,B,N^FD^FD', '^FO575,150^BY2,2.5,60^BEN,40,B,N^FD')
                        ||(K.CODACESSO) ||'^FS'

--------------------------------------------------------PRECO--------------------------------------
|| chr(13) || chr(10) || '^FO040,045^APN,120,120^FD'||'R$'||'^FS'

-- || chr(13) || chr(10) || '^FO0540,055^GB250,080,10^FD'||'^FS'
|| (case when a.precovalidpromoc > 0 Then
     chr(13) || chr(10) ||'^FO560,060^APN,80,80^FD'||'OFERTA'||'^FS'|| chr(13) || chr(10) || ''|| chr(13) || chr(10) || '^FO0540,055^GB250,080,10^FD'||'^FS'
end)||''


|| chr(13) || chr(10) || '^FO170,045^APN,120,120^FD'      ||replace(TO_CHAR(DECODE(A.PRECOVALIDPROMOC,0,A.PRECOEMBPADRAO,A.PRECOEMBPADRAO),'FM999,999,990.00'), '.', ',')|| '^FS'

|| (case when j.multeqpemb is not null  or j.multeqpembalagem is not null Then
     chr(13) || chr(10) || '^FO0100,400^APN,10,10^FD' || 'PRECO PAGO POR ' || j.multeqpembalagem ||' R$   '|| decode(sign(j.precogerpromoc),
     +1, translate(to_char(round((j.precogerpromoc/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ',')
     , translate(to_char(round((j.precogernormal/(j.multeqpemb*1000))*1000 ,2),'FM9990.00'), '.', ','))
|| chr(13) || chr(10) || ''
end)||'^FS'


--------------------------------------------UNIDADE-----------------------------------------
|| chr(13) || chr(10) || '^CFA,30'||'^FO510,155^APN,030,030^FD'||a.embalagempadrao||'^FS'
-- ^FO540,055^GB250,080,10^FD  ^FS

--------------------------------------------------------RODAPE--------------------------------------------------
|| chr(13) || chr(10) || '^FO410,190^APN,25,25^FD'            ||'COD/PLU:'|| a.seqproduto ||'^FS'
--|| chr(13) || chr(10) || '^FO040,466^APN,45,45^FD'            ||'ATACADAO LAG'||'^FS'
|| chr(13) || chr(10) || '^FO040,190^APN,25,25^FD'            ||c.fantasia||'^FS'
|| chr(13) || chr(10) || '^FO250,190^APN,25,25^FD'            ||sysdate||'^FS'
|| chr(13) || chr(10) || '^PQ' || CASE WHEN nvl(a.qtdetiqueta, 1) > 15 THEN 1 ELSE nvl(a.qtdetiqueta, 1) END      || ',,,' || '^FS^LL1150^FS'
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


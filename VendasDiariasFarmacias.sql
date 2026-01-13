-- create or replace view tisuper_com_abcvenda as

--declare &dataatual = select to_char(sysdate,'DD/MM/YYYY') from dual

Select
V.DTAVDA as DATA,
dc.categorian1 as CATEG_N1,
dc.categorian2 as CATEG_N2,
dc.categorian3 as CATEG_N3,
dc.categorian4 as CATEG_N4,
E.NOMEREDUZIDO as "EMPRESA",
A.SEQPRODUTO,
A.DESCCOMPLETA as "DESCRICAO_PRODUTO",
Count(distinct V.ROWIDDOCTO) as "NRODOCTOS",
sum(round((V.QTDITEM-V.QTDDEVOLITEM)/K.QTDEMBALAGEM,3)) as "QUANT",
sum((round(V.VLRITEM,2))-(round(V.VLRDEVOLITEM,2)-(0))) as "VALOR_TOTAL",
--------------------------------------------------------------------------------------
ROUND(SUM(
     FC5_ABCDISTRIBCONTRIB('L','L','N', round(V.VLRITEM, 2) ,'N', V.VLRICMSST, V.VLRFCPST,
     V.VLRICMSSTEMPORIG, E.UF, V.UFPESSOA, 'S', RE.VLRDESCREGRA, 'N', V.VLRIPIITEM,
     V.VLRIPIDEVOLITEM, 'N', V.VLRDESCFORANF, Y.CMDIAVLRNF - 0 , Y.CMDIAIPI ,
     nvl( Y.CMDIACREDPIS, 0 ) , nvl( Y.CMDIACREDCOFINS, 0 ) , Y.CMDIAICMSST, Y.CMDIADESPNF,
     Y.CMDIADESPFORANF, Y.CMDIADCTOFORANF,'S', a.propqtdprodutobase, V.QTDITEM,
     V.VLREMBDESCRESSARCST, V.ACMCOMPRAVENDA, V.PISITEM, V.COFINSITEM,
     decode( V.TIPCGO, 'S', Y.QTDVDA, nvl( Y.QTDDEVOL, Y.QTDVDA ) ),
     ( decode( V.TIPCGO, 'S', Y.VLRIMPOSTOVDA - nvl( Y.VLRIPIVDA, 0 ), nvl( Y.VLRIMPOSTODEVOL - nvl( V.VLRIPIDEVOLITEM, 0 ),
     Y.VLRIMPOSTOVDA - nvl( Y.VLRIPIVDA, 0 ) ) ) ),
     'N', V.VLRDESPOPERACIONALITEM, Y.VLRDESPESAVDA, 'N', nvl( Y.VLRVERBAVDAACR, 0 ),
     Y.QTDVERBAVDA, Y.VLRVERBAVDA - nvl( Y.VLRVERBAVDAINDEVIDA, 0 ), 'N',
     NVL(V.VLRTOTCOMISSAOITEM, 0), V.VLRDEVOLITEM, VLRDEVOLICMSST, V.DVLRFCPST,
     V.QTDDEVOLITEM, V.PISDEVOLITEM, V.COFINSDEVOLITEM, V.VLRDESPOPERACIONALITEMDEVOL,
     V.VLRTOTCOMISSAOITEMDEVOL, E.PERIRLUCRAT, E.PERCSLLLUCRAT, Y.CMDIACREDICMS,
     decode( V.ICMSEFETIVOITEM, 0, V.ICMSITEM, V.ICMSEFETIVOITEM ),
     V.VLRFCPICMS, V.PERCPMF, V.PEROUTROIMPOSTO,
     decode( V.ICMSEFETIVODEVOLITEM, 0, V.ICMSDEVOLITEM, V.ICMSEFETIVODEVOLITEM ),
     V.DVLRFCPICMS,
     CASE
       WHEN ('S') = 'N' then (nvl(y.cmdiavlrdescpistransf,0) + nvl(y.cmdiavlrdesccofinstransf,0) + nvl(y.cmdiavlrdescicmstransf,0) + nvl(y.cmdiavlrdescipitransf,0) + nvl(y.cmdiavlrdesclucrotransf,0) + nvl(y.cmdiavlrdescverbatransf,0) )
       ELSE 0
     END,
     CASE
       WHEN DV.UTILACRESCCUSTPRODRELAC = 'S' AND NVL(A.SEQPRODUTOBASE, A.SEQPRODUTOBASEANTIGO) IS NOT NULL THEN COALESCE(PR.PERCACRESCCUSTORELACVIG, NVL(F_RETACRESCCUSTORELACABC(V.SEQPRODUTO, V.DTAVDA),1))
       ELSE 1
     END,
     'N', 0, 0, 'S', V.VLRDESCMEDALHA, 'S', V.VLRDESCFORNEC, V.VLRDESCFORNECDEVOL,
     'N', V.VLRFRETEITEMRATEIO, V.VLRFRETEITEMRATEIODEV, 'S', V.VLRICMSSTEMBUTPROD,
     V.VLRICMSSTEMBUTPRODDEV, V.VLREMBDESCRESSARCSTDEVOL, v.vlrdescacordoverbapdv,
     nvl( Y.CMDIACREDIPI, 0 ), 'S', 'C' ) ),2)
as "CONTRIB_TOTAL",
--------------------------------------------------------------------------------------
sum(
(((Y.CMDIAVLRNF) + Y.CMDIAIPI - Y.CMDIACREDICMS - nvl( Y.CMDIACREDPIS, 0 ) - nvl( Y.CMDIACREDCOFINS, 0 ) - nvl( Y.CMDIACREDIPI, 0 ) + Y.CMDIAICMSST + Y.CMDIADESPNF + Y.CMDIADESPFORANF - Y.CMDIADCTOFORANF )
   *
   CASE WHEN DV.UTILACRESCCUSTPRODRELAC = 'S' AND NVL(A.SEQPRODUTOBASE, A.SEQPRODUTOBASEANTIGO) IS NOT NULL THEN COALESCE(PR.PERCACRESCCUSTORELACVIG, NVL(F_RETACRESCCUSTORELACABC(V.SEQPRODUTO, V.DTAVDA), 1))
        ELSE 1
   END
   *
   DECODE('S', 'N', 1, NVL( a.propqtdprodutobase, 1))
   - ( decode( Y.QTDVERBAVDA, 0, 0, Y.VLRVERBAVDA * NVL( a.propqtdprodutobase, 1 ) /
   DECODE(NVL(Y.QTDVDA,0), 0, Y.QTDVERBAVDA, Y.QTDVDA) ) )
   + decode (V.ACMCOMPRAVENDA,'N', 0, decode( 'N', 'S', 0,
       ( decode( nvl( Y.VLRVERBAVDAACR, 0 ), 0, 0, Y.VLRVERBAVDAACR * NVL( a.propqtdprodutobase, 1 ) /
       DECODE(NVL(Y.QTDVDA,0), 0, 1, Y.QTDVDA) ) ) ) ) )
   * (V.QTDITEM - V.QTDDEVOLITEM)
 ) as "CUSTO_LIQ"
--------------------------------------------------------------------------------------

From MRL_CUSTODIAFAM Y,
     MAP_PRODUTO A,
     MAP_PRODUTO PB,
     MAP_FAMDIVISAO D,
     MAP_FAMEMBALAGEM K,
     MAD_FAMSEGMENTO FAMSEG,
     MAX_EMPRESA E,
     MAX_DIVISAO DV,
     MAD_SEGMENTO SEG,
     MAP_PRODACRESCCUSTORELAC PR,
     MAXV_ABCDISTRIBBASE V,
     MRLV_DESCONTOREGRA RE,
     DIM_CATEGORIA DC

 Where 1=1
   and D.SEQFAMILIA = A.SEQFAMILIA
   and D.NRODIVISAO = V.NRODIVISAO
   and V.SEQPRODUTO = A.SEQPRODUTO
   and V.SEQPRODUTOCUSTO = PB.SEQPRODUTO
   and V.NRODIVISAO = D.NRODIVISAO
   and E.NROEMPRESA = V.NROEMPRESA
   and E.NRODIVISAO = DV.NRODIVISAO
   and Y.SEQFAMILIA = PB.SEQFAMILIA
   and Y.DTAENTRADASAIDA = V.DTAVDA
   and SEG.NROSEGMENTO = V.NROSEGMENTO
   and SEG.NRODIVISAO = V.NRODIVISAO
   and SEG.NROSEGMENTO = FAMSEG.NROSEGMENTO
   and FAMSEG.SEQFAMILIA = A.SEQFAMILIA
   and K.QTDEMBALAGEM = FAMSEG.PADRAOEMBVENDA
   and K.SEQFAMILIA = A.SEQFAMILIA
   and K.QTDEMBALAGEM = K.QTDEMBALAGEM
   and dc.nrodivisao = dv.nrodivisao
   and dc.seqfamilia = y.seqfamilia

   and V.SEQPRODUTO = PR.SEQPRODUTO(+)
   and V.DTAVDA = PR.DTAMOVIMENTACAO(+)
   and V.SEQPRODUTO = RE.SEQPRODUTO (+)
   and V.DTAVDA = RE.DATAFATURAMENTO (+)
   and V.NRODOCTO = RE.NUMERODF(+)
   and V.SERIEDOCTO = RE.SERIEDF(+)
   and V.NROEMPRESA = RE.NROEMPRESA(+)

   and Y.NROEMPRESA = nvl( E.NROEMPCUSTOABC, E.NROEMPRESA )
   and DECODE(V.TIPTABELA, 'S', V.CGOACMCOMPRAVENDA, V.ACMCOMPRAVENDA) in ( 'S', 'I' )

   and V.NROEMPRESA  in (11)
   and V.NROSEGMENTO in (6)
  and V.DTAVDA = to_date('15/11/2022','DD/MM/YYYY')  -- between '01-aug-2022' and '06-aug-2022'

Group by dc.categorian1,
         dc.categorian2,
         dc.categorian3,
         dc.categorian4,
         V.DTAVDA,
         E.NROEMPRESA,
         E.NOMEREDUZIDO,
         A.SEQPRODUTO,
         A.DESCCOMPLETA

Order by v.dtavda,
         dc.categorian1,
         dc.categorian2,
         dc.categorian3,
         dc.categorian4,
         A.DESCCOMPLETA


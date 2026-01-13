  select /*+RULE*/ E.NOMEREDUZIDO     as "Loja",
           
           GS.CAMINHOCOMPLETO as "Categoria",
           
           count(distinct V.SEQPRODUTO) as "SKUs Venda",   
           
           count(distinct V.NRODOCTO) as "TICKETS",   -- Não se pode somar TICKETS, pois está mesclado em categorias
           
           sum((round(V.VLRITEM, 2)) - (round(V.VLRDEVOLITEM, 2) - (0))) as "Valor",
           
           round(sum(decode(V.ACMCOMPRAVENDA,
                            'I',
                            (V.VLRITEM * (V.PERCPMF + V.PEROUTROIMPOSTO) / 100),
                            decode(Y.QTDVDA * V.QTDITEM,
                                   0,
                                   0,
                                   (Y.VLRIMPOSTOVDA - nvl(Y.VLRIPIVDA, 0)) *
                                   DECODE('S',
                                          'N',
                                          1,
                                          NVL(a.propqtdprodutobase, 1)) /
                                   Y.QTDVDA * V.QTDITEM)) -
                     decode(V.ACMCOMPRAVENDA,
                            'I',
                            (V.VLRDEVOLITEM * (V.PERCPMF + V.PEROUTROIMPOSTO) / 100),
                            decode(nvl(Y.QTDDEVOL, Y.QTDVDA) * V.QTDDEVOLITEM,
                                   0,
                                   0,
                                   (
                                    
                                    nvl(((Y.VLRIMPOSTODEVOL /
                                        decode(nvl(Y.QTDDEVOL, 0),
                                                 0,
                                                 1,
                                                 Y.QTDDEVOL)) * V.QTDDEVOLITEM) -
                                        nvl(V.VLRIPIDEVOLITEM, 0),
                                        Y.VLRIMPOSTOVDA - nvl(Y.VLRIPIVDA, 0))
                                   
                                   ) * DECODE('S',
                                              'N',
                                              1,
                                              NVL(a.propqtdprodutobase, 1)) /
                                   nvl(Y.QTDDEVOL, Y.QTDVDA) * V.QTDDEVOLITEM)) +
                     decode(V.ACMCOMPRAVENDA,
                            'I',
                            0,
                            decode(V.ICMSEFETIVOITEM,
                                   0,
                                   V.ICMSITEM,
                                   V.ICMSEFETIVOITEM) + V.VLRFCPICMS + V.PISITEM +
                            V.COFINSITEM -
                            decode(V.ICMSEFETIVODEVOLITEM,
                                   0,
                                   V.ICMSDEVOLITEM,
                                   V.ICMSEFETIVODEVOLITEM) - V.DVLRFCPICMS -
                            V.PISDEVOLITEM - V.COFINSDEVOLITEM)),
                 2) as "Imposto",
           
           round(sum(FC5_ABCDISTRIBCONTRIB('L',
                                           'L',
                                           'N',
                                           V.VLRITEM,
                                           'N',
                                           V.VLRICMSST,
                                           V.VLRFCPST,
                                           V.VLRICMSSTEMPORIG,
                                           E.UF,
                                           V.UFPESSOA,
                                           'S',
                                           RE.VLRDESCREGRA,
                                           'N',
                                           V.VLRIPIITEM,
                                           V.VLRIPIDEVOLITEM,
                                           'N',
                                           V.VLRDESCFORANF,
                                           Y.CMDIAVLRNF - 0,
                                           Y.CMDIAIPI,
                                           nvl(Y.CMDIACREDPIS, 0),
                                           nvl(Y.CMDIACREDCOFINS, 0),
                                           Y.CMDIAICMSST,
                                           Y.CMDIADESPNF,
                                           Y.CMDIADESPFORANF,
                                           Y.CMDIADCTOFORANF,
                                           'S',
                                           a.propqtdprodutobase,
                                           V.QTDITEM,
                                           V.VLREMBDESCRESSARCST,
                                           V.ACMCOMPRAVENDA,
                                           V.PISITEM,
                                           V.COFINSITEM,
                                           decode(V.TIPCGO,
                                                  'S',
                                                  Y.QTDVDA,
                                                  nvl(Y.QTDDEVOL, Y.QTDVDA)),
                                           (decode(V.TIPCGO,
                                                   'S',
                                                   Y.VLRIMPOSTOVDA -
                                                   nvl(Y.VLRIPIVDA, 0),
                                                   nvl(Y.VLRIMPOSTODEVOL -
                                                       nvl(V.VLRIPIDEVOLITEM, 0),
                                                       Y.VLRIMPOSTOVDA -
                                                       nvl(Y.VLRIPIVDA, 0)))),
                                           'N',
                                           V.VLRDESPOPERACIONALITEM,
                                           Y.VLRDESPESAVDA,
                                           'N',
                                           nvl(Y.VLRVERBAVDAACR, 0),
                                           Y.QTDVERBAVDA,
                                           Y.VLRVERBAVDA -
                                           nvl(Y.VLRVERBAVDAINDEVIDA, 0),
                                           'N',
                                           NVL(V.VLRTOTCOMISSAOITEM, 0),
                                           V.VLRDEVOLITEM,
                                           VLRDEVOLICMSST,
                                           V.DVLRFCPST,
                                           V.QTDDEVOLITEM,
                                           V.PISDEVOLITEM,
                                           V.COFINSDEVOLITEM,
                                           V.VLRDESPOPERACIONALITEMDEVOL,
                                           V.VLRTOTCOMISSAOITEMDEVOL,
                                           E.PERIRLUCRAT,
                                           E.PERCSLLLUCRAT,
                                           Y.CMDIACREDICMS,
                                           decode(V.ICMSEFETIVOITEM,
                                                  0,
                                                  V.ICMSITEM,
                                                  V.ICMSEFETIVOITEM),
                                           V.VLRFCPICMS,
                                           V.PERCPMF,
                                           V.PEROUTROIMPOSTO,
                                           decode(V.ICMSEFETIVODEVOLITEM,
                                                  0,
                                                  V.ICMSDEVOLITEM,
                                                  V.ICMSEFETIVODEVOLITEM),
                                           V.DVLRFCPICMS,
                                           case
                                             when ('S') = 'N' then
                                              (nvl(y.cmdiavlrdescpistransf, 0) +
                                              nvl(y.cmdiavlrdesccofinstransf, 0) +
                                              nvl(y.cmdiavlrdescicmstransf, 0) +
                                              nvl(y.cmdiavlrdescipitransf, 0) +
                                              nvl(y.cmdiavlrdesclucrotransf, 0) +
                                              nvl(y.cmdiavlrdescverbatransf, 0))
                                             
                                             else
                                              0
                                           end,
                                           CASE
                                             WHEN DV.UTILACRESCCUSTPRODRELAC = 'S' AND
                                                  NVL(A.SEQPRODUTOBASE, A.SEQPRODUTOBASEANTIGO) IS NOT NULL THEN
                                              COALESCE(PR.PERCACRESCCUSTORELACVIG,
                                                       NVL(F_RETACRESCCUSTORELACABC(V.SEQPRODUTO, V.DTAVDA), 1))
                                             ELSE
                                              1
                                           END,
                                           'N',
                                           0,
                                           0,
                                           'S',
                                           V.VLRDESCMEDALHA,
                                           'S',
                                           V.VLRDESCFORNEC,
                                           V.VLRDESCFORNECDEVOL,
                                           'N',
                                           V.VLRFRETEITEMRATEIO,
                                           V.VLRFRETEITEMRATEIODEV,
                                           'S',
                                           V.VLRICMSSTEMBUTPROD,
                                           V.VLRICMSSTEMBUTPRODDEV,
                                           V.VLREMBDESCRESSARCSTDEVOL,
                                           case
                                             when 'N' = 'S' then
                                              nvl(V.VLRDESCACORDOVERBAPDV, 0)
                                             else
                                              0
                                           end,
                                           nvl(Y.CMDIACREDIPI, 0),
                                           'S',
                                           'C')),
                 2) as "Contribuicao"    
      
      from MRL_CUSTODIAFAM          Y,
           MAXV_ABCDISTRIBBASE      V,
           MAP_PRODUTO              A,
           MAP_PRODUTO              PB,
           MAP_FAMDIVISAO           D,
           MAP_FAMEMBALAGEM         K,
           MAX_EMPRESA              E,
           MAX_DIVISAO              DV,
           MAP_PRODACRESCCUSTORELAC PR,
           MAXV_CATEGORIA           GS,
           MAP_FAMDIVCATEG          US,
           MAD_SEGMENTO             SEG,
           MAD_FAMSEGMENTO          FAMSEG,
           MRLV_DESCONTOREGRA       RE
     
     where D.SEQFAMILIA = A.SEQFAMILIA
       and D.NRODIVISAO = V.NRODIVISAO
       and V.SEQPRODUTO = A.SEQPRODUTO
       and V.SEQPRODUTOCUSTO = PB.SEQPRODUTO
       and V.NRODIVISAO = D.NRODIVISAO
       and E.NROEMPRESA = V.NROEMPRESA
       and E.NRODIVISAO = DV.NRODIVISAO
       AND V.SEQPRODUTO = PR.SEQPRODUTO(+)
       AND V.DTAVDA = PR.DTAMOVIMENTACAO(+)
       and V.DTAVDA BETWEEN 
                    DATE '2022-03-01' and 
                    DATE '2022-03-02'
       and Y.NROEMPRESA = nvl(E.NROEMPCUSTOABC, E.NROEMPRESA)
       and Y.DTAENTRADASAIDA = V.DTAVDA
       and K.SEQFAMILIA = A.SEQFAMILIA
       and K.QTDEMBALAGEM = K.QTDEMBALAGEM
       AND V.SEQPRODUTO = RE.SEQPRODUTO(+)
       AND V.DTAVDA = RE.DTAGERACAONF(+)
       AND V.NRODOCTO = RE.NUMERODF(+)
       AND V.SERIEDOCTO = RE.SERIEDF(+)
       AND V.NROSERIEECF = RE.NROSERIEECF(+)
       AND V.NROEMPRESA = RE.NROEMPRESADF(+)
       AND V.NROEMPRESA = RE.NROEMPRESA(+)
       and Y.SEQFAMILIA = PB.SEQFAMILIA
       and SEG.NROSEGMENTO = V.NROSEGMENTO
       and SEG.NRODIVISAO = V.NRODIVISAO
       and FAMSEG.SEQFAMILIA = A.SEQFAMILIA
       and SEG.NROSEGMENTO = FAMSEG.NROSEGMENTO
       and K.QTDEMBALAGEM = FAMSEG.PADRAOEMBVENDA
       and GS.NRODIVISAO = US.NRODIVISAO
       and GS.NIVELHIERARQUIA = 1
       and GS.TIPCATEGORIA = 'M'
       and GS.STATUSCATEGOR != 'I'
       and US.SEQFAMILIA = D.SEQFAMILIA
       and US.NRODIVISAO = D.NRODIVISAO
       and US.SEQCATEGORIA = GS.SEQCATEGORIA
       and US.STATUS = 'A'          
       and DECODE(V.TIPTABELA, 'S', V.CGOACMCOMPRAVENDA, V.ACMCOMPRAVENDA) in
           ('S', 'I')
     
     group by E.NOMEREDUZIDO, GS.CAMINHOCOMPLETO

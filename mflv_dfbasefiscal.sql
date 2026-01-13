create or replace view mflv_dfbasefiscal as
select a.rowid id_df, 'D' tipotabela, 'S' tipnotafiscal,
       a.numerodf, a.seriedf, a.nroserieecf, a.nroempresa,
       a.seqpessoa, a.dtamovimento dtaentrada, a.dtamovimento dtaemissao, a.dtahoremissao, a.statusdf,
       nvl(b.cfop, a.cfop) cfop, b.peraliquotaicms, b.peraliqicmsorig, b.peraliquotaipi,
       a.modelodf, a.seqnotafiscal, a.nrosegmento,
       a.seqgnre,
       a.nrocarga, a.ufdestino, a.observacao || ' ' || a.obsnfref observacao,
       a.dtavencimento, c.codgeraloper, a.nrocondicaopagto,
       a.nroformapagto, a.nrobancocobr,
       a.tipofrete, a.apporigem, a.indgeroureplicacao,
       a.vlrfrete_maxtransp, max(a.nroregtributacao) as nroregtributacao,
       sum((b.vlritem + nvl(b.vlracrescimo, 0) - nvl(b.vlrdesconto, 0) - nvl(b.vlrdescincondic, 0))) vlrcontabil,
       sum((b.vlritem + nvl(b.vlracrescimo, 0) - nvl(b.vlrdesconto, 0) - nvl(b.vlrdescincondic, 0))) VlrContabilsemfunrural,
       sum(b.bascalcicms) baseicms,
       sum(round(b.bascalcicms * b.peraliquotaicms / 100, 2)) vlricms,
       sum(b.vlrtotisento) vlrisento,
       sum(b.vlrtotoutra) vlroutras,
       sum(nvl(CASE WHEN NVL(D.INDVLRIPIDADOADICIONAL, NVL(C.INDVLRIPIDADOADICIONAL, 'N')) = 'N'
                    THEN B.BASECALCIPI
                    WHEN NVL(D.INDVLRIPIDADOADICIONAL, NVL(C.INDVLRIPIDADOADICIONAL, 'N')) = 'T'
                     AND NVL(B.SITUACAONFIPI,'50') IN ('50','00')
                    THEN B.BASECALCIPI
                    ELSE 0 END, 0)) baseipi,
       sum(nvl(CASE WHEN NVL(D.INDVLRIPIDADOADICIONAL, NVL(C.INDVLRIPIDADOADICIONAL, 'N')) = 'N'
                    THEN B.VLRIPI
                    WHEN NVL(D.INDVLRIPIDADOADICIONAL, NVL(C.INDVLRIPIDADOADICIONAL, 'N')) = 'T'
                     AND NVL(B.SITUACAONFIPI,'50') IN ('50','00')
                    THEN B.VLRIPI
                    ELSE 0 END, 0)) vlripi,
/*       sum(nvl(b.basecalcipi, 0)) baseipi,
       sum(nvl(b.vlripi, 0)) vlripi,*/
       sum(nvl(b.basecalcicmsst, 0)) baseicmsst,
       sum(nvl(b.peraliquotaicmsst, 0)) peraliquotaicmsst,
       sum(nvl(b.vlricmsst, 0)) vlricmsst,
       sum(nvl(b.vlricmsantecipado, 0)) vlricmsantecipado,
       sum(nvl(b.vlracrfinanceiro, 0)) vlracrfinanceiro,
       sum(nvl(b.vlrdesconto, 0)) vlrdesconto,
       sum(nvl(b.vlrtotisentoipi, 0)) vlrisentoipi,
       sum(nvl(b.vlrtotoutraipi, 0)) vlroutraipi,
       sum(nvl(b.vlrfretetransp, 0)) vlrfrete,
       sum(nvl(b.vlrseguro, 0)) vlrseguro,
       sum(nvl(b.vlrtotiss, 0)) vlriss,
       sum(nvl(b.vlrir, 0)) vlrir,
       sum(nvl(b.vlrtotdespacessoria, 0)) vlrdespacessoria,
       sum(nvl(b.qtdvolume, 0)) qtdvolume,
       sum(nvl(b.vlrpis, 0)) vlrpis,
       sum(nvl(b.vlrcofins, 0)) vlrcofins,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 7, b.bascalcicms, 0))) baseicms7,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 12, b.bascalcicms, 0))) baseicms12,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 17, b.bascalcicms, 0))) baseicms17,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 18, b.bascalcicms, 0))) baseicms18,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 25, b.bascalcicms, 0))) baseicms25,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 7, round(b.bascalcicms * b.peraliquotaicms / 100, 2), 0))) vlricms7,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 12, round(b.bascalcicms * b.peraliquotaicms / 100, 2), 0))) vlricms12,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 17, round(b.bascalcicms * b.peraliquotaicms / 100, 2), 0))) vlricms17,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 18, round(b.bascalcicms * b.peraliquotaicms / 100, 2), 0))) vlricms18,
       sum(decode(b.statusitem, 'C', 0, decode(b.peraliquotaicms, 25, round(b.bascalcicms * b.peraliquotaicms / 100, 2), 0))) vlricms25,
       sum(nvl(b.vlracrescimo, 0)) vlracrescimo,
       sum(nvl(b.vlrtotcomissao, 0)) as vlrcomissao,
       sum(nvl(b.vlritem, 0)) as vlritem,
       sum(nvl(b.quantidade, 0)) as quantidade,
       sum(nvl(b.vlrdescforanf, 0)) as vlrdescforanf,
       sum(nvl(b.vlrcsll, 0)) as vlrcsll,
       0 as vlrfunruralitem,
       0 vlricmspresumido,
       a.pesototbruto, a.pesototliquido,
       a.seqtransportador, a.placaveiculo, a.ufplacaveiculo,
       a.nrocheckout, c.gerlivrofiscal, a.indemissaonf,
       a.nropedidovenda, a.dtacancelamento, a.seqvendedor,
       c.tipdocfiscal, a.nrointernoreceb, a.observacaolf,
       a.nfechaveacesso, a.motivocancelou, a.statusnfe,
       a.usuemitiu, a.seqpessoaend, MAX(NVL(A.VLRINDENIZACAO, 0)) AS VLRINDENIZACAO,
       sum(decode(nvl(d.geradescicms, c.geradescicms), 'F', 0, nvl(b.vlrdescicms,0))) vlrdescicms,
       sum(nvl(b.vlrvpe,0)) as vlrvpe,
       sum(nvl(b.vlricmsvpe,0)) as vlricmsvpe,
       a.dtahorsaida,
       SUM(NVL(B.VLRDESCSF, 0)) AS VLRDESCSF,
       nvl(b.indusaprecofixo, 'N') indusaprecofixo,
       A.PONTOIMPRESSAOSEL AS PontoImpressaoSel,
       max(A.Pontoimpressaoautoriza) AS Pontoimpressaoautoriza,
       sum(nvl(b.vlrfreteitemrateio, 0)) as vlrfreteitemrateio,
       MAX(NVL(A.VLRBASEICMSFRETETRANSP,0)) AS VLRBASEICMSFRETETRANSP,
       MAX(NVL(A.PERALIQICMSFRETETRANSP,0)) AS PERALIQICMSFRETETRANSP,
       MAX(NVL(A.VLRICMSFRETETRANSP,0)) AS VLRICMSFRETETRANSP,
       MAX(NVL(A.VLRBASEICMSFRETETERC,0)) AS VLRBASEICMSFRETETERC,
       MAX(NVL(A.PERALIQICMSFRETETERC,0)) AS PERALIQICMSFRETETERC,
       A.LINKERP,
       SUM(NVL(B.VLRDESCINCONDIC,0)) AS VLRDESCINCONDIC,
       nvl(A.INDRETORNOCANCSEFAZ,'N') as INDRETORNOCANCSEFAZ,
       SUM(NVL(B.VLRDESPTRIBUTITEM,0)) AS VLRDESPTRIBUTITEM,
       SUM(NVL(B.VLRDESPNTRIBUTITEM,0)) AS VLRDESPNTRIBUTITEM,
       SUM(NVL(B.VLRBASEISS, 0)) AS VLRBASEISS,
       nvl(a.indsusppiscofins, 'N') AS INDSUSPPISCOFINS,
       SUM(NVL(B.VLRDESCSUFRAMA,0)) AS VLRDESCSUFRAMA,
       /*RP 111624 - Nos testes do Simples Nacional a Situação 18 estava incorreto*/
       sum( case when fc5_RetIndSituacaoNF_NFe(b.situacaonf, b.nroempresa) in ( /*7,*/ 8, 14, 15, 16, 17, /* 18,*/ /*19, 20,*/ 21, 22, 23 ) then 0  -- adicionado 7 evitar rejeição 531
                 when (b.vlricmsst > 0 and nvl(d.indemiteicms, c.indemiteicms) = 'S') then 0
                 when b.vlrdescsuframa > 0 then 0
            else  b.bascalcicms end ) baseicmstotnfe,
/*calefi*/
       sum( case when fc5_RetIndSituacaoNF_NFe(b.situacaonf, b.nroempresa) in (  8, 14, 15, 16, 17, /* 18,*/ /*19, 20,*/ 21, 22, 23 ) then 0
                 when (b.vlricmsst > 0 and nvl(d.indemiteicms, c.indemiteicms) = 'S') then 0
                 when b.vlrdescsuframa > 0 then 0
            else
               case when fc5_RetIndSituacaoNF_NFe(b.situacaonf, b.nroempresa) = '7' and b.peraliqicmsorig > 0 then
               case when nvl(b.perdiferido,0) = 100  then 0
                    when nvl(b.perdiferido,0) > 0 then
                      nvl(b.vlricms, round(b.bascalcicms * (b.peraliquotaicms / 100), 2)) - b.vlricmsdiferido
               else
                 nvl(b.vlricmsdif,  round(b.bascalcicms * (b.peraliqicmsorig / 100), 2) - round(b.bascalcicms * (b.peraliqicmsdif / 100), 2) ) end
               else
                   round(nvl(b.vlricms, Round(b.bascalcicms * (b.peraliquotaicms / 100),2)) - case when B.TIPOCALCICMSFISCI = 25 then
                                                                               Round(nvl(b.vlricms, b.bascalcicms * (b.peraliquotaicms / 100)) * (B.PERALIQICMSDIF / 100),2)
                                                                          else
                                                                               0
                                                                     end, 2)
               end
            end ) vlricmstotnfe,
       sum(case when fc5_RetIndSituacaoNF_NFe(b.situacaonf, b.nroempresa) in (  0, 8, 14, 15, 16, 17,/* 18,*/ /*19, 20,*/ 21, 22, 23 ) then 0
            else nvl(b.basecalcicmsst, 0) end ) baseicmssttotnfe,
       sum(case when fc5_RetIndSituacaoNF_NFe(b.situacaonf, b.nroempresa) in (  0, 8, 14, 15, 16, 17,/* 18,*/ /*19, 20,*/ 21, 22, 23 ) then 0
            else nvl(b.vlricmsst, 0) end ) vlricmssttotnfe,
       sum( CASE WHEN (b.vlricmsst > 0 and nvl(d.indemiteicms, c.indemiteicms) = 'S') THEN
                    b.bascalcicms
              ELSE
                    0
              END) AS BaseICMSObsSdic,
       sum( CASE WHEN (b.vlricmsst > 0 and nvl(d.indemiteicms, c.indemiteicms) = 'S') THEN
                    round(b.bascalcicms * b.peraliquotaicms / 100, 2)
              ELSE
                    0
              END) AS VlrICMSObsSdic,
       sum(nvl(CASE WHEN NVL(D.INDVLRIPIDADOADICIONAL, NVL(C.INDVLRIPIDADOADICIONAL, 'N')) = 'T'
                     AND NVL(B.SITUACAONFIPI,'50') NOT IN ('50','00')
                    THEN B.BASECALCIPI
                    when NVL(D.INDVLRIPIDADOADICIONAL, NVL(C.INDVLRIPIDADOADICIONAL, 'N')) = 'S'
                    then B.BASECALCIPI
                    ELSE 0 END, 0)) baseipiobsadc,
       sum(nvl(CASE WHEN NVL(D.INDVLRIPIDADOADICIONAL, NVL(C.INDVLRIPIDADOADICIONAL, 'N')) = 'T'
                     AND NVL(B.SITUACAONFIPI,'50') NOT IN ('50','00')
                    THEN B.VLRIPI
                    when NVL(D.INDVLRIPIDADOADICIONAL, NVL(C.INDVLRIPIDADOADICIONAL, 'N')) = 'S'
                    then B.VLRIPI
                    ELSE 0 END, 0)) vlripiobsadc,
       NVL(D.INDVLRIPIDADOADICIONAL, C.INDVLRIPIDADOADICIONAL) INDVLRIPIDADOADICIONAL,
       A.USUCANCELOUAUX,
       A.DTACANCELAMENTOAUX,
       A.USUCANCELOU,
       A.SEQTRANSPREDESP,
       A.SEQOPERADOR,
       A.VERSAOPESSOA,
       A.NFEAMBIENTE,
       A.SEQNF,
       A.NFENROPROTENVIO,
       sum(case when b.bascalcicms = 0 and fmap_familiafinalidade((select x.seqfamilia
                                                                   from   map_produto x
                                                                   where  x.seqproduto = b.seqproduto), b.nroempresa) = 'S' then
                b.vlritem + nvl(b.vlracrescimo, 0 ) - nvl(b.vlrdesconto, 0)
           else
                0
           end) vlrservico,
       max(A.NFEDTAENV) NFEDTAENV,
       sum(nvl(b.vlrdespesarateiodanfe,0)) as vlrdespesarateiodanfe,
       c.tipuso,
       sum( case when (nvl(d.indemiteicmsst, nvl(c.indemiteicmsst, 'N')) = 'N' or (nvl(d.indemiteicmsst, nvl(c.indemiteicmsst, 'N')) = 'C' and nvl(g.indcontribicms, 'N') = 'S'))
                 and fc5_RetIndSituacaoNF_NFe(b.situacaonf, b.nroempresa) in ( 8 ) then
                   nvl(b.vlricmsst, 0)
            else
              0
            end
       ) vlricmssttotoutrosdesp,
       sum( case when nvl(h.indutilcalcfcp, 'N') = 'S' then
                 case when (nvl(d.indemiteicmsst, nvl(c.indemiteicmsst, 'N')) = 'N' or (nvl(d.indemiteicmsst, nvl(c.indemiteicmsst, 'N')) = 'C' and nvl(g.indcontribicms, 'N') = 'S'))
                      and fc5_RetIndSituacaoNF_NFe(b.situacaonf, b.nroempresa) in ( 8 ) then
                        nvl(b.vlrfcpst, 0)
                 else
                   0
                 end
            when nvl(h.indutilcalcfcp, 'N') = 'N' and nvl(fc5maxparametro('FAT_CARGA', a.nroempresa, 'SOMA_VLR_FECP_ACRESCIMO'), 'S') = 'S' then
              nvl(b.vlrfecp, 0)
            else
              0
            end
       ) vlrfecptotoutradespnfe,
       sum(round(nvl(case when b.cfop IN (select COLUMN_VALUE
                            from table(cast(c5_ComplexIn.c5InTable(nvl(trim(nvl(fc5maxparametro('EXPORT_NFE', 0, 'LISTA_CFOP_ESTORNO_PISCOF'), '0')), 0)) as
                                c5InStrTable)) where COLUMN_VALUE is not null)
                          then 0
                          else
                            case when h.uf = 'DF' AND
                              fmap_familiafinalidade((select x.seqfamilia
                                                               from   map_produto x
                                                               where  x.seqproduto = b.seqproduto), b.nroempresa) = 'S'
                               then 0
                               else b.vlrpis
                            end
                          end
                  ,0)
              ,2)
          ) vlrpisnfe,
       sum(round(nvl(case when b.cfop IN (select COLUMN_VALUE
                            from table(cast(c5_ComplexIn.c5InTable(nvl(trim(nvl(fc5maxparametro('EXPORT_NFE', 0, 'LISTA_CFOP_ESTORNO_PISCOF'), '0')), 0)) as
                                c5InStrTable)) where COLUMN_VALUE is not null)
                          then 0
                          else
                            case when h.uf = 'DF' AND
                              fmap_familiafinalidade((select x.seqfamilia
                                                               from   map_produto x
                                                               where  x.seqproduto = b.seqproduto), b.nroempresa) = 'S'
                               then 0
                               else b.vlrcofins
                            end
                          end
                  ,0)
              ,2)
          ) vlrcofinsnfe,
       a.nfreferencianro,
       a.nfreferenciaserie,
       a.seqnfref,
       nvl(d.indfaturaicmsantec, c.indfaturaicmsantec) indfaturaicmsantec,
       max(a.indretornoevento) as indretornoevento,
       a.nfechavenova,
       a.jobnfeuser,
       a.jobnfeseg,
       max(a.dtaimpressao) dtaimpressao,
       a.jobnfeenvio,
       a.nfenroprotcancextemp,
       SUM(NVL(b.vlrdescbonif, 0)) AS VLRDESCBONIF,
       -- === RP 117453 ==== Inicio ====
       SUM(round(B.VLRITEM * (fc5buscaaliqcargatrib(B.SEQPRODUTO, a.nroempresa, a.seqpessoa, 'P', a.codgeraloper, 'P') / 100), 2)) AS VLRTOTTRIB,
       -- === RP 117453 ==== Fim =======
       -- === RP 118401 ==== Inicio ====
       SUM(B.VLRITEM * (fc5buscaaliqcargatrib(B.SEQPRODUTO, a.nroempresa, a.seqpessoa, 'P', a.codgeraloper, 'P') / 100)) AS VLRTOTTRIBSEMROUND,
       -- === RP 118401 ==== Fim =======
       A.INDFATCRUZADO,
       nvl(A.INDDEPOSITOFECHADO, 'N') as INDDEPOSITOFECHADO,
       a.qtddiasprazoregra,
       max(a.indnfintegrafiscal) as indnfintegrafiscal,
       sum(case when NVL(f.indpermsusppiscofins, 'S') = 'N' then
               round(nvl(b.vlrpis, 0), 2)
           else
                0
           end) VLRPISNFESUSP,
       sum(case when NVL(f.indpermsusppiscofins, 'S') = 'N' then
               round(nvl(b.vlrcofins, 0), 2)
           else
                0
           end) VLRCOFINSNFESUSP,
       max(b.classeenquadramentoipi) classeenquadramentoipi,
       max(b.codigoenquadramentoipi) codigoenquadramentoipi,
       max(b.codigoseloipi) codigoseloipi,
       sum(b.qtdseloipi) qtdseloipi,
       SUM(NVL(B.VLRDESCSUFRAMAICMS, 0)) AS VLRDESCSUFRAMAICMS,
       SUM(NVL(B.VLRDESCSUFRAMAPIS, 0)) AS VLRDESCSUFRAMAPIS,
       SUM(NVL(B.VLRDESCSUFRAMACOFINS, 0)) AS VLRDESCSUFRAMACOFINS,
       nvl(b.indcalcicmsdesonoutros, 'N') indcalcicmsdesonoutros,
       sum(nvl(b.vlrtoticmsdesonoutros,0)) as vlrtoticmsdesonoutros,
       sum(nvl(b.bascalcicmspartilha,0)) as bascalcicmspartilha,
       sum(b.peraliquotafecppartilha) peraliquotafcp,
       sum(nvl(b.peraliqintpartilhaicms,0)) as peraliqintpartilhaicms,
       sum(nvl(b.perpartilhaicms,0)) as perpartilhaicms,
       sum(nvl(b.vlrfecppartilha,0)) vlrfcp,
       sum(nvl(b.vlricmscalcdestino,0)) vlricmscalcdestino,
       sum(nvl(b.vlricmscalcorigem,0)) vlricmscalcorigem,
       MAX(a.observacaonfe) observacaonfe,
       max(nvl(a.indconsumidorfinal, 'N')) indconsumidorfinal,
       round(sum(nvl(case when b.cfop IN (select COLUMN_VALUE
                            from table(cast(c5_ComplexIn.c5InTable(nvl(trim(nvl(fc5maxparametro('EXPORT_NFE', 0, 'LISTA_CFOP_ESTORNO_PISCOF'), '0')), 0)) as
                                c5InStrTable)) where COLUMN_VALUE is not null)
                          then decode(b.indgeradebcredpis,'S',(b.bascalcpis * b.aliqpiscalc/100),b.vlrpis)
                          else 0
                          end
                  ,0)
          ),6) vlrpiscfop,
       round(sum(nvl(case when b.cfop IN (select COLUMN_VALUE
                            from table(cast(c5_ComplexIn.c5InTable(nvl(trim(nvl(fc5maxparametro('EXPORT_NFE', 0, 'LISTA_CFOP_ESTORNO_PISCOF'), '0')), 0)) as
                                c5InStrTable)) where COLUMN_VALUE is not null)
                          then decode(b.indgeradebcredcofins,'S',(b.bascalcofins * b.aliqcofinscalc/100),b.vlrcofins)
                          else 0
                          end
                  ,0)
          ),6) vlrcofinscfop,
       sum( case when b.Lancamentost in ('O', 'S') then
              0
            else
              nvl(b.vlricmsst, 0) + CASE
                                      WHEN SUBSTR(b.situacaonf, 2, 2) IN ('00', '20', '60') THEN
                                        NVL(b.vlrfcpst, 0)
                                      ELSE
                                        0
                                    END
            end
       ) vlricmssttotoutronfe,
       sum(nvl(b.bascalcicmsstsubst, 0)) bascalcicmsstsubst,
       sum(nvl(b.vlricmsstsubst, 0)) vlricmsstsubst,
       MAX(A.CODOPERADOR) codoperador,
       max(peraliqicmsdeson)  peraliqicmsdeson,
       max(nvl(b.peraliqicmsdif,0)) peraliqicmsdif,
       max(a.indboletonddigital) indboletonddigital,
       sum(nvl(b.BASEFCPST,0)) as basefcpst,
       max(b.PERALIQFCPST) as peraliqfcpst,
       sum(nvl(b.VLRFCPST,0)) as vlrfcpst,
       sum(nvl(b.BASEFCPICMS,0)) as basefcpicms,
       max(b.PERALIQFCPICMS) as peraliqfcpicms,
       sum(nvl(b.VLRFCPICMS,0)) as vlrfcpicms,
       sum(nvl(b.BASEFCPDISTRIB,0)) as BASEFCPDISTRIB,
       max(b.PERALIQFCPDISTRIB) as PERALIQFCPDISTRIB,
       sum(nvl(b.VLRFCPDISTRIB,0)) as VLRFCPDISTRIB,
       sum(nvl(b.vlrfcpstsubst, 0)) VLRFCPSTSUBST,
       sum(nvl(b.basefcpstsubst, 0)) BASEFCPSTSUBST,
       a.dtahoraimp, a.dtahoraimpcanc, a.dtahoraimpdeneg,
       max(NumeroRECOPI) as NumeroRECOPI,
       max(b.perdiferido) as PERDIFERIDO,
       MAX(nvl(b.indsubtraiicmsdesontotitem, 'S')) as indsubtraiicmsdesontotitem,
       max(a.cnpjintermediador) as cnpjintermediador,
       max(a.nomeintermediador) as nomeintermediador,
       MAX(b.indmotivodesoicms) as indmotivodesoicms,
       sum(round(nvl(case when b.cfop IN (select COLUMN_VALUE
                            from table(cast(c5_ComplexIn.c5InTable(nvl(trim(nvl(fc5maxparametro('EXPORT_NFE', 0, 'LISTA_CFOP_ESTORNO_PISCOF'), '0')), 0)) as
                                c5InStrTable)) where COLUMN_VALUE is not null)
                          then 0
                          else
                            case when h.uf = 'DF' AND
                              fmap_familiafinalidade((select x.seqfamilia
                                                               from   map_produto x
                                                               where  x.seqproduto = b.seqproduto), b.nroempresa) = 'S'
                               then b.vlrpis
                               else null
                             end
                          end
                  ,0)
              ,2)
          ) vlrpisissnfe,
       sum(round(nvl(case when b.cfop IN (select COLUMN_VALUE
                            from table(cast(c5_ComplexIn.c5InTable(nvl(trim(nvl(fc5maxparametro('EXPORT_NFE', 0, 'LISTA_CFOP_ESTORNO_PISCOF'), '0')), 0)) as
                                c5InStrTable)) where COLUMN_VALUE is not null)
                          then 0
                          else
                            case when h.uf = 'DF' AND
                              fmap_familiafinalidade((select x.seqfamilia
                                                               from   map_produto x
                                                               where  x.seqproduto = b.seqproduto), b.nroempresa) = 'S'
                               then  b.vlrcofins
                               else null
                             end
                          end
                  ,0)
              ,2)
          ) vlrcofinsissnfe
from   mfl_doctofiscal a, mfl_dfitem b, max_codgeraloper c, max_codgeraloper d, map_produto e, map_familia f, ge_pessoa g, max_empresa h
where  a.numerodf        =          b.numerodf
and    a.seriedf         =          b.seriedf
and    a.nroserieecf     =          b.nroserieecf
and    a.nroempresa      =          b.nroempresa
and    a.codgeraloper    =          c.codgeraloper
and    b.codgeraloper    =          d.codgeraloper(+)
and    b.seqproduto      =          e.seqproduto
and    e.seqfamilia      =          f.seqfamilia
and    nvl(a.seqnf, 0)   =          nvl(b.seqnf, nvl(a.seqnf, 0))
and    a.seqpessoa       =          g.seqpessoa
and    a.nroempresa      =          h.nroempresa
--and    c.gerlivrofiscal  =          'S'
group  by
       a.rowid, 'D', 'S',
       a.numerodf, a.seriedf, a.nroserieecf, a.nroempresa,
       a.seqpessoa, a.dtamovimento, a.dtamovimento, a.dtahoremissao, a.statusdf,
       nvl(b.cfop, a.cfop), b.peraliquotaicms, b.peraliqicmsorig, b.peraliquotaipi,
       a.modelodf, a.seqnotafiscal, a.nrosegmento,
       a.nrocarga, a.ufdestino, a.observacao || ' ' || a.obsnfref, a.nrobancocobr,
       a.seqgnre,
       c.codgeraloper, a.nrocondicaopagto, a.nroformapagto,
       a.tipofrete, a.dtavencimento, a.pesototbruto, a.pesototliquido,
       a.seqtransportador, a.placaveiculo, a.ufplacaveiculo,
       a.nrocheckout, c.gerlivrofiscal, a.indemissaonf,
       a.nropedidovenda, a.dtacancelamento, a.seqvendedor,
       c.tipdocfiscal, a.apporigem, a.indgeroureplicacao,
       a.vlrfrete_maxtransp,
       a.nrointernoreceb, a.observacaolf, a.nfechaveacesso,
       a.motivocancelou, a.statusnfe,a.usuemitiu,
       a.seqpessoaend,a.dtahorsaida,
       nvl(b.indusaprecofixo, 'N'),
       A.PONTOIMPRESSAOSEL, A.LINKERP,
       nvl(A.INDRETORNOCANCSEFAZ,'N'),
       nvl(a.indsusppiscofins, 'N'),
       nvl(D.INDVLRIPIDADOADICIONAL, C.INDVLRIPIDADOADICIONAL),
       A.USUCANCELOUAUX,
       A.DTACANCELAMENTOAUX,
       A.USUCANCELOU,
       A.SEQTRANSPREDESP,
       A.SEQOPERADOR,
       A.VERSAOPESSOA,
       A.NFEAMBIENTE,
       A.SEQNF,
       A.NFENROPROTENVIO, c.tipuso,
       a.nfreferencianro,
       a.nfreferenciaserie,
       a.seqnfref,
       nvl(d.indfaturaicmsantec, c.indfaturaicmsantec),
       a.nfechavenova,
       a.jobnfeuser,
       a.jobnfeseg,
       a.jobnfeenvio,
       a.nfenroprotcancextemp,
       a.indfatcruzado,
       nvl(A.INDDEPOSITOFECHADO, 'N'),
       a.qtddiasprazoregra,
       b.indcalcicmsdesonoutros,
       a.dtahoraimp, a.dtahoraimpcanc, a.dtahoraimpdeneg
;

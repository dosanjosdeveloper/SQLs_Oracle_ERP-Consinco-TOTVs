/* Query Válida d(-_-)b */ --  131
SELECT rr.seqreceitarendto,
       rr.seqproduto,
       rc.seqreceitarendto,
       rc.receitarendto,
       rc.statusrecrendto
       FROM MRL_RRCOMPONENTE rr
        JOIN MRL_RECEITARENDTO rc ON rc.seqreceitarendto = rr.seqreceitarendto
--        JOIN MRL_RRFPRODUTOFINAL rf ON 
         WHERE rr.seqproduto in (2043947,21434,2045745,1702416,1950916,2043920,
                                 2043998,2043980,1929968,2043530,1951025,1951076,
                                 21379,1951203,2042606,62415,2043882,2043971,1951696,
                                 2043912,2043995,21198,21499)
         AND rr.statusrrcomponente = 'A'
         AND rc.statusrecrendto = 'A'

/*
select * from MRL_RRCOMPONENTE rc where rc.seqproduto in (21379,21408,2044587)
select * from MRL_RECEITARENDTO rr where rr.seqreceitarendto in (37292,32573,32574)
select * from MRL_RRPRODUTOFINAL rpf where rpf.seqreceitarendto in (32573,32574)

SELECT * FROM mfl_dfitem f
       
 mfl_doctofiscal a, mfl_dfitem b, max_codgeraloper c, max_codgeraloper d, map_produto e, map_familia f, ge_pessoa g, max_empresa h
-- MRL_SETORPROD, MRL_RECEITARENDTO, MRL_RRCOMPONENTE, MAP_FAMEMBALAGEM, MRL_RRPTODUTOFINAL
select * from map_famdivcateg where seqcategoria = 7527 and nrodivisao = 1 and status = 'A'
select * from map_categoria where categoria like '%02 PERECIVEIS ACOUGUE%' and nrodivisao = 1 --seqcategoria = 7527
select * from map_familia
select * from map_produto where seqproduto in (1878425,21408)
select * from Mrl_Rrprodutofinal rpf where rpf.seqreceitarendto in (32573,32574)

 -- receitarendto like '%RESERVA%' --37292,32573,32574

select * from mfl_doctofiscal a where a.numerodf = 977545

select * from mfl_dfitem b where b.nroempresa = 3 and b.seqproduto = 2043548 and b.numerodf in (458446,822798)
select * from max_codgeraloper c where c.codgeraloper in (314,317,520,545,536,537)
select * from map_produto where seqproduto in (2044773,2044765,2044757,2044110,2044137,2044153,2044145,
2044366,2044358,1951319,2043432,21234,1950690,2043327,1951319,2043432,21234,2043319,1950754,1950720,1950924,1317059,2043939,
2044820,2044803,2044811,2044790,2044781,1950738,2043599,2043580,2043572,1950835,1950878,1950860,2043564,2043548,2044102,2043556,
2044609,2044587,1951068,1951106,2042673,1951114,21408,1878425,1951181,1951238,2044412,1612174,1612212,1612182,21380,2042665,21397,2042657,2043629,
2043602,2043610,1279920,2044749,2044390,2044455,2044420,2044447,2044501,2044439,2044498,2044439,1950770,2044714,2044722,2044986,1951688,1951254,1951700,1951718,
2044560,2044579,2044552,2044544,1950975,2044730,1950967,2045940,2043300,2043289,2095807,1935801,1860089,2095823,1859722,2095815,2095726,2095734,1859730,2095696,21481,
2095769,2095785,21466,2095777)

select * from map_produto where seqproduto in (2043947,21434,2045745,1702416,1950916,2043920,
                                               2043998,2043980,1929968,2043530,1951025,1951076,
                                               21379,1951203,2042606,62415,2043882,2043971,1951696,
                                               2043912,2043995,21198,21499)


*/



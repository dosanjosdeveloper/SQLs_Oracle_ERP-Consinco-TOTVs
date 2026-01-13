SELECT t.*,t.rowid FROM FI_TITULO t WHERE t.nrotitulo = 20240819 AND t.codespecie IN ('CARDEB') AND t.nroempresa  in (1) --AND t.vlroriginal in (474.55,1458.34) -- seqtitulo in 20240819 (835719210,835719374,835719655,835719793) | seqexpfçuxocaixa in (1241204)
SELECT t.*,t.rowid FROM FI_TITULO t WHERE t.nrotitulo = 20240819 AND t.codespecie IN ('TICKET') AND t.nroempresa  in (1,3) AND t.vlroriginal in (474.55,1458.34)


SELECT c.*,c.rowid FROM FI_TITULO c WHERE c.seqtitulo in (select t.seqtitulo from fi_titoperacao t where t.nroprocesso in (835718534) and t.codoperacao in (932,999,77) )

-- ,t.rowid
select t.*,t.rowid from fi_titoperacao t where t.nroprocesso in (835718534) and t.codoperacao in (932,999,77) 

 --and t.codoperacao in (932,999)       --(835719210,835719374,835719655,835719793)(835720280,833087520) -- SeqTitulo 835720280 "Descancelado" em 18/09/2024

select r.*,r.rowid from fi_titoperacao r 
    where r.dtacancelou = '12sep2024' 
    and r.usucancelou = 'FN_FRANCI' 
    and  r.justcancel = 'BAIXA INCORRETA CONCILIADORA/AJUSTE' 
    and r.codoperacao in (934,932,77) 
   order by r.seqtitulo  --and r.codoperacao in (934,932,77) and r.seqtitulo = 788781789 -- 

SELECT * FROM FI_TITULO t where t.seqtitulo in (select r.seqtitulo from fi_titoperacao r 
    where --r.dtacancelou = '12sep2024' 
    -- r.usucancelou = 'FN_FRANCI' 
     r.justcancel = 'BAIXA INCORRETA CONCILIADORA/AJUSTE' 
    and r.codoperacao in (999,934,932,77) 
   ) 

select * from fi_titulo o where o.seqtitulo in (835720017)
select t.*,t.rowid from fi_titoperacao t where t.seqtitulo in (835720197,835720218,835720234,835720256,835720317) --(835720141, 35720100, 835720078, 835720017, 835720280,833087520) 

select * from fi_titulobco where seqtitulo in (835719210,835719374,835719655,835719793) -- Nada Aqui. . .


select * from fi_titoperacao r 
    where --r.dtacancelou = '12sep2024' 
    -- r.usucancelou = 'FN_FRANCI' 
     r.justcancel = 'BAIXA INCORRETA CONCILIADORA/AJUSTE' 
    and r.codoperacao in (934,932,77)
    order by r.seqtitulo 
    
    -- 835720017, 835720078, 835720100,835720141, 835720197, 835720218, 835720234, 835720256, 835720280, 835720317
    
    
    -- select * from fi_titoperacao t where t.seqtitulo in (835718702)   -- (835719210,835719374,835719655,835719793) 

--select * from fi_titoperacao r where r.dtacancelou = '12sep2024' and r.usucancelou = 'FN_FRANCI' and  r.justcancel = 'BAIXA INCORRETA CONCILIADORA/AJUSTE' 

select * from fi_titoperacao r 
    where --r.dtacancelou = '12sep2024' 
    -- r.usucancelou = 'FN_FRANCI' 
     r.justcancel = 'BAIXA INCORRETA CONCILIADORA/AJUSTE' 
    and r.codoperacao in (934,932,77)
    order by r.seqtitulo  

select
    nroempresa,
    count(*) as QTD_DOCTOS_UM_ITEM
      from (select
           di.nroempresa,
           di.seqdocto
           from consincomonitor.tb_doctoitem di
           where di.nroempresa in (11,12,14,16,19,20,22)
           and trunc(di.dtahoremissao) = '06nov2025'
           group by di.nroempresa, di.seqdocto
           having count(*) = 1
           )
     group by nroempresa
     order by nroempresa;
/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
select
    nomereduzido,
    count(*) as QTD_DOCTOS_UM_ITEM
      from (select
           e.nomereduzido,
           di.seqdocto
           from consincomonitor.tb_doctoitem di, max_empresa e
           where di.nroempresa = e.nroempresa
           and di.nroempresa in (11,12,14,16,19,20,22)
           and trunc(di.dtahoremissao) = '06nov2025'
           group by e.nomereduzido, di.seqdocto
           having count(*) = 1 
           -- AND MAX(di.quantidade) = 1
           )
     group by nomereduzido
     order by nomereduzido;

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/     
 
SELECT
    di.nroEMPRESA,
    COUNT(DISTINCT CASE WHEN sub.QTD_ITENS = 1 THEN di.SEQDOCTO END) AS CUPONS_COM_1_ITEM,
    COUNT(DISTINCT di.SEQDOCTO) AS TOTAL_CUPONS,
    round(
      count(DISTINCT CASE WHEN sub.QTD_ITENS = 1 THEN di.SEQDOCTO END) * 100 /
      count(DISTINCT di.SEQDOCTO),
      2
    ) as TICKET_1_ITEM_PERCNT
    
FROM consincomonitor.tb_DOCTOITEM di
JOIN (
    SELECT nroEMPRESA, SEQDOCTO, COUNT(*) AS QTD_ITENS
    FROM consincomonitor.tb_DOCTOITEM
    where
    trunc(dtahoremissao) = '06nov2025'
    and nroempresa in (SELECT F.NROEMPRESA FROM MAX_EMPRESA F WHERE F.NRODIVISAO = 2 )
    GROUP BY nroEMPRESA, SEQDOCTO 
) sub
ON di.nroEMPRESA = sub.nroEMPRESA AND di.SEQDOCTO = sub.SEQDOCTO
GROUP BY di.nroEMPRESA
ORDER BY di.nroEMPRESA;

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/  

select
    nomereduzido,
    count(distinct b.seqdocto) as TOTAL_CUPOMS,
    count(distinct case when sub.qtd_itens = 1 then b.seqdocto end) as CUPONS_COM_1_ITEM
      from consincomonitor.tb_doctoitem b
      join
         (select
           e.nomereduzido,
           di.seqdocto,
           count(*) as qtd_itens
           from consincomonitor.tb_doctoitem di, max_empresa e
           where di.nroempresa = e.nroempresa
           and di.nroempresa in (11,12,14,16,19,20)
           and trunc(di.dtahoremissao) = '06nov2025'
           group by e.nomereduzido, di.seqdocto
           having count(*) = 1
           ) sub
           on nomereduzido = sub.nomereduzido and b.seqdocto = sub.seqdocto
     group by nomereduzido
     order by nomereduzido;

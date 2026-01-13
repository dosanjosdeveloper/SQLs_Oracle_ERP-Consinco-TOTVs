-- SELECT * FROM TILOCAL_TICKET_ATENDIMENTO;
SELECT MAX(numero) FROM TILOCAL_TICKET_ATENDIMENTO;
-- SELECT * FROM TILOCAL_TICKET_ATENDIMENTO;
-- SELECT MAX(numero) FROM TILOCAL_TICKET_ATENDIMENTO;

-- INSERT INTO TILOCAL_TICKET_ATENDIMENTO (numero,servico,empresa, dathoremissao) VALUES (16,'Teste Glicêmico','FM01_MATRIZ',TO_DATE('2025-10-01 09:10:30','YYYY-MM-DD HH24:MI:SS')); 

-- UPDATE TILOCAL_TICKET_ATENDIMENTO SET servico = 'Aplicação Injetáveis' WHERE servico = 'Aplicaçõa Injetáveis'; 

 SELECT 
    b.empresa, 
    LPAD(count(b.servico),3,0) ||' - '|| b.servico as TOTAL_MES 
      FROM TILOCAL_TICKET_ATENDIMENTO b
 group by b.servico,b.empresa;
 
 SELECT a.nroempresa,a.nomereduzido FROM CONSINCO.MAX_EMPRESA A WHERE A.NRODIVISAO = 2 ;
 
SELECT * FROM TILOCAL_VIEW_EMPRESA 

CREATE OR REPLACE VIEW SUPERNORTE.TILOCAL_VIEW_EMPRESA AS
SELECT 
    a.nroempresa,a.nomereduzido
FROM 
    CONSINCO.MAX_EMPRESA a
WHERE 
    a.nrodivisao = 2;




     
/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
     SELECT 
   a.numero,
   a.servico,
   a.empresa,
   TO_CHAR(a.dathoremissao, 'DD/MM/YYYY HH24:MI:SS') as DATA_EMISSAO
  FROM
   supernorte.tilocal_ticket_atendimento a
   WHERE
    a.empresa like '%FM01_MATRIZ'
    and  servico = 'Teste Glicêmico'
   AND  TRUNC(a.dathoremissao) BETWEEN to_date('01/10/2025','DD/MM/YYYY') AND to_date('31/10/2025','DD/MM/YYYY')
   ORDER BY a.dathoremissao;
SELECT 
   a.empresa,
   a.servico,
   count(a.numero) as TOTAL_TICKETS
--   TO_CHAR(a.dathoremissao, 'DD/MM/YYYY HH24:MI:SS') as DATA_EMISSAO
  FROM
   supernorte.tilocal_ticket_atendimento a
   WHERE
     TRUNC(a.dathoremissao) BETWEEN to_date('01/10/2025','DD/MM/YYYY') AND to_date('31/10/2025','DD/MM/YYYY')
   GROUP BY a.empresa, a.servico
   ORDER BY a.empresa,a.servico;


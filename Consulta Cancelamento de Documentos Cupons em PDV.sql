

-- with todo as (
select                        
    d.nroempresa EMPRESA,
    d.nrocheckout PDV,
    d.seqdocto SEQ_REG_PDV,
    d.dtamovimento AS DIA_MOVIMENTO,
    d.coo as DOCTO_CUPOM,
    d.sequsuario||'-'||(select u.apelido from tb_usuario u where u.sequsuario = d.sequsuario) as OPERADOR_CX,
                 (select SUM(di.vlrtotal) 
                        from tb_doctoitem di
                          where di.nroempresa = d.nroempresa
                          and di.nrocheckout = d.nrocheckout
                          and di.seqdocto = d.seqdocto
                          and di.status = 'V')as VALOR_TOTAL_DOC,
    d.seqturno as TURNO
    from tb_docto d, tb_doctocupom c
      where d.nroempresa = c.nroempresa
        and d.nrocheckout = c.nrocheckout
        and d.seqdocto = c.seqdocto            
        and d.dtamovimento between '10mar2025' and '15mar2025'
        and d.nroempresa = 11
        and d.nrocheckout in (1,2,3)
        and c.status = 'C'

-- )
        
-- select * from todo;


        

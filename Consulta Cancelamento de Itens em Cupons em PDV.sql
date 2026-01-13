-- select * from tb_doctoitem

select                        
    d.nroempresa EMPRESA,
    d.nrocheckout PDV,
    d.seqdocto SEQ_REG_PDV,
    d.dtamovimento AS DIA_MOVIMENTO,
    d.coo as DOCTO_CUPOM,
    d.sequsuario||'-'||(select u.apelido from tb_usuario u where u.sequsuario = d.sequsuario) as OPERADOR_CX,
    di.seqproduto||' - ' ||(select p.desccompleta from tb_produto p where p.seqproduto = di.seqproduto )as PRODUTO,
    di.quantidade as QUANTIDADE,
    di.vlrtotal,                 
    d.seqturno as TURNO
    from tb_docto d, tb_doctoitem di
      where d.nroempresa = di.nroempresa
        and d.nrocheckout = di.nrocheckout
        and d.seqdocto = di.seqdocto            
        and d.dtamovimento between '10mar2025' and '15mar2025'
        and d.nroempresa = 11
        and d.nrocheckout in (1,2,3)
        and di.status = 'C'
        
      order by di.dtahoremissao

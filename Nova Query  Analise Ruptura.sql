--select * from mlf_nfitemlote


select 
    b.numeronf, 
    b.seqpessoa, 
    b.serienf,
    b.tipnotafiscal, 
    b.nroempresa, 
    b.seqproduto, 
    b.quantidade, 
    b.dtamovtoitem,
    b.cgoremessa,
    b.dtapedido 
      from MLF_NFITEM b 
       where b.nroempresa = 11
       and b.seqproduto = 1450506
       and b.dtamovtoitem between to_date('01/01/2025','DD/MM/YYYY') and to_date('08/11/2025','DD/MM/YYYY')


/* MRL_PRODUTOEMPRESA */
select a.seqproduto,
       a.nroempresa,
       a.statuscompra,
       a.estqloja,
       a.dtaultentrada,
       a.dtaultcompra,
       a.dtaultmovsaida,
       a.dtapenultmovsaida
   from mrl_produtoempresa a 
     where a.nroempresa in (11)
     and a.statuscompra = 'A'
     and a.seqproduto = 1450506

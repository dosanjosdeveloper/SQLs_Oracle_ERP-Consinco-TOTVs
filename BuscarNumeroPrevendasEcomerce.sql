Select
a.nroempresa as EMPRESA,
a.nropedvenda as PEDIDO,
a.seqpessoa||' - '||p.nomerazao as CLIENTE,
a.codgeraloper||' - '||c.DESCRICAO as CGO,
a.dtainclusao as DATA_HORA,
a.vlrtotpedido as VALOR_PEDIDO,
a.vlrtotfrete as VALOR_FRETE


from edi_pedvenda a, ge_pessoa p, ge_cgo c
where a.seqpessoa = p.seqpessoa
  and a.codgeraloper = c.CGO
  and a.nroempresa = 1
  and a.dtainclusao like TO_DATE ('25/06/2020','DD/MM/YYYY')

Order by a.dtainclusao
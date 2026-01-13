Select
 Decode (cl.statuscliente,'A','ATIVO','I','INATIVO') as STATUS_CLIENTE,
 r.apelido as VENDEDOR,
 p.seqpessoa as COD_CLIENTE,
 p.nomerazao as RAZAO_SOCIAL,
 p.fantasia as CLIENTE_FANTASIA,
 p.grupo as CANAL,
 case
         when p.fisicajuridica = 'F' then (LPAD(p.nrocgccpf,9,'0')||'-'||LPAD(p.digcgccpf,2,'0'))
         when p.fisicajuridica = 'J' then (LPAD(p.nrocgccpf,12,'0')||'-'||LPAD(p.digcgccpf,2,'0'))
         else 'Algo Saiu Errado'
 end as CNPJ_CPF,
 
 p.atividade as ATIVIDADE_SUB_CANAL,
 p.cidade,
 p.bairro,
 p.logradouro,
 p.nrologradouro,
 TO_CHAR (cl.dtacadastro,'DD/MM/YYYY') as DATA_CADASTRO,
 p.foneddd1||'-'|| p.fonenro1 as FONE_1,
 p.foneddd2||'-'|| p.fonenro2 as FONE_2,
 p.foneddd3||'-'|| p.fonenro3 as FONE_3,
 mr.descrota as ROTA,
 mp.descpraca as PRACA
  
From ge_pessoa p, mad_clienterep c, mad_representante r, mad_clienteend ce, mad_praca mp, mad_rota mr, mrl_cliente cl
Where p.seqpessoa = c.seqpessoa
  and c.nrorepresentante = r.nrorepresentante
  and ce.seqpessoa = p.seqpessoa
  and ce.seqpraca = mp.seqpraca
  and mp.seqrota = mr.seqrota
  and cl.seqpessoa = p.seqpessoa
  
  and r.nroequipe in (15,20)
  and c.nrorepresentante not in (13,1300)
  and cl.statuscliente = 'A'
 
 Order by r.apelido, p.nomerazao, p.cidade, mr.descrota, mp.descpraca

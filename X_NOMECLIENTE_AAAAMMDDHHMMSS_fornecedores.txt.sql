
/* RETORNA TODOS OS FORNECEDORES COM OU SEM CONTATOS CADASTRADOS 3840*/
SELECT g.nomerazao,
       CASE 
        WHEN g.fisicajuridica = 'J' THEN LPAD(g.nrocgccpf,12,'0')||LPAD(g.digcgccpf,2,'0')
        WHEN g.fisicajuridica = 'F' THEN LPAD(g.nrocgccpf,9,'0')||LPAD(g.digcgccpf,2,'0')
       END as CPF_CNPJ_FORNECEDOR,
       g.fantasia, 
       NULL as GRUPO_2, 
       c.nomerazao, 
       f.emailcontato, 1 as FIXO_1, 
       0 as FIXO_2
         FROM MAF_FORNECEDOR f
          LEFT JOIN  MAF_FORNECCONTATO c 
                   ON f.seqfornecedor = c.seqfornecedor 
                     AND c.indprincipal = 'S'
          JOIN GE_PESSOA g 
              ON f.seqfornecedor = g.seqpessoa 
  WHERE f.statusgeral = 'A'
  -- AND f.dtaalteracao = TRUNC(sysdate -1) --Para quando Enviar primeira carga full e depois diariamente somente os cadastros novos e/ou alterados

select * from ge_pessoa

/* RETORNA SOMENTE OS FORNECEDORES COM CONTATOS CADASTRADOS */
 /*SELECT g.nomerazao, 
       g.seqpessoa, 
       g.fantasia, 
       'NULL' as GRUPO_DOIS, 
       c.nomerazao, 
       f.emailcontato, 1 as FIXO_UM, 
       0 as FIXO_DOIS, 
       f.dtaalteracao
         FROM MAF_FORNECEDOR f
          JOIN  MAF_FORNECCONTATO c 
                   ON f.seqfornecedor = c.seqfornecedor 
          JOIN GE_PESSOA g 
              ON f.seqfornecedor = g.seqpessoa 
       WHERE f.statusgeral = 'A'
        AND c.indprincipal = 'S'
  */

/* TABELAS USADAS */
-- GE_PESSOA
-- MAF_FORNECEDOR
-- MAF_FORNECCONTATO


 

select m.nroempresa AS "Loja",
           m.nomereduzido AS "Nome",
           m.nrodivisao AS "Divisao"
      from max_empresa m
      where m.nroempresa = 13
     order by m.nomereduzido;
     
     
SELECT t.descricao as "Descricao",
           r.lote as "Lote",
           t.conta as "Conta",
           r.filial AS "Loja",
           SUM(r.valor) AS "Valor"
      FROM ct_razao r, ct_planoconta t
     WHERE r.conta NOT IN {fora}  -- Fora das contas da DRE
       and r.conta = t.conta
       AND r.dtalancamento BETWEEN '01AUG2025'
                               AND '31AUG2025'
       AND r.dtacancelou IS NULL
       AND r.usucancelou IS NULL
       and t.nroempresa = 1
     GROUP BY r.filial, t.descricao, t.conta, r.lote
     ORDER BY t.conta, r.filial
     
/*
     
     select m.nroempresa AS "Loja",
           m.nomereduzido AS "Nome",
           m.nrodivisao AS "Divisao"
      from max_empresa m
     order by m.nomereduzido
     
*/


SELECT --t.descricao as "Nivel3",
               {l} as "Linha",
               t.conta as "Conta",
               r.filial AS "Loja",
               SUM(r.valor) AS "Valor"
          FROM ct_razao r, ct_planoconta t
         WHERE r.conta IN (SELECT *
                             FROM CT_LINHAEXPORT l -- Nomes e fórmulas para se chagar nos títulos e gerar os saldos  4.413 linhas 18 Modelos
                            WHERE L.NROLINHA = {l}
                              AND L.NROMODELO = 92501
                              AND L.CONTA IS NOT NULL)
           and r.conta = t.conta
           and r.lote <> 912  -- Lote de Encerramento
           AND r.dtalancamento BETWEEN DATE '{data_ini.strftime("%Y-%m-%d")}' 
                                   AND DATE '{data_fim.strftime("%Y-%m-%d")}'
           AND r.dtacancelou IS NULL
           AND r.usucancelou IS NULL
           and t.nroempresa = 1
        
-- and r.filial in (1,18,2) -- DELETAR ! ! !  a menos que queira especificar determinadas lojas
         GROUP BY r.filial, t.descricao, t.conta
         ORDER BY t.conta, r.filial


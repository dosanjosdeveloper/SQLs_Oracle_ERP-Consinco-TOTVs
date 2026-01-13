SELECT 
    e.nomereduzido AS EMPRESA,
    'R$' || TO_CHAR(SUM(a.vlrlancto), '999G999G990D00', 'NLS_NUMERIC_CHARACTERS=,.') AS VALOR_REGISTRADO,
    'R$' || TO_CHAR(NVL(apur.valor_apurado, 0), '999G999G990D00', 'NLS_NUMERIC_CHARACTERS=,.') AS VALOR_APURADO,
    'R$' || TO_CHAR(
        SUM(a.vlrlancto) - NVL(apur.valor_apurado, 0), 
        '999G999G990D00', 
        'NLS_NUMERIC_CHARACTERS=,.'
    ) AS DIFERENCA
        FROM 
             fi_tsnmovimentodetalhadoimp a
             JOIN fi_tscodmovimento b 
               ON a.nroformapagto = b.nroformapagto 
               AND a.codmovimento = b.codmovimento
             JOIN max_empresa e 
               ON a.nroempresa = e.nroempresa
            LEFT JOIN (
                       SELECT 
                         nroempresa, 
                          SUM(valor) AS valor_apurado
                            FROM 
                               fi_tsmovtoopedetalhe
                                 WHERE 
                                   tipo = 'CTD'
                                   AND dtamovimento BETWEEN TO_DATE('05apr2025', 'DDMONYYYY') AND TO_DATE('05apr2025', 'DDMONYYYY')
                        GROUP BY 
                          nroempresa
                      ) apur 
         ON a.nroempresa = apur.nroempresa
    WHERE 
      a.dtamovimento BETWEEN TO_DATE('05apr2025', 'DDMONYYYY') AND TO_DATE('05apr2025', 'DDMONYYYY')
       AND a.nroempresa NOT IN (17, 18, 100)
       AND a.tipo = 'CTD'
       GROUP BY 
       e.nomereduzido, apur.valor_apurado
   ORDER BY 
    e.nomereduzido;

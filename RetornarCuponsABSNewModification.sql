SELECT to_char (dtaMovimento,'DD/MM/YYYY' ) data, nroCheckout pdv, coo, nronotafiscal NUMERO_NF, total FROM (
  SELECT d.dtaMovimento, d.nroCheckout, d.coo, r.nronotafiscal, SUM(i.vlrTotal) total
                                             , SUM(CASE 
                                                    WHEN f.seqfamilia > 0 THEN 0
                                                    ELSE 1
                                                   END) invalido
  FROM CONSINCOMONITOR.tb_docto d
  JOIN CONSINCOMONITOR.tb_doctoitem i ON i.nroEmpresa  = d.nroEmpresa
                                     AND i.nroCheckout = d.nroCheckout
                                     AND i.seqDocto    = d.seqdocto
                                     AND i.status      = 'V'
  JOIN CONSINCOMONITOR.Tb_Doctocupom r ON d.seqdocto = r.seqdocto
                                     and   d.nroempresa = r.nroempresa
                                   and i.nrocheckout = r.nrocheckout
  JOIN CONSINCO.map_produto p ON p.seqproduto = i.seqProduto
  LEFT JOIN (
    SELECT f.seqfamilia
    FROM map_familia f
    JOIN map_famdivcateg fc ON fc.seqfamilia = f.seqfamilia
    JOIN map_categoria c ON c.seqcategoria = fc.seqcategoria
    WHERE (
      regexp_like (c.categoria, 
        'ACUCAR|ARROZ|BACON|BISCOITO|CAFE|CARNE|FARINHA|MILHO|FLOCOS|LEITE|EMBUTIDOS|FRANGO|MAIONESE|LACTEOS|PAO|PEIXE|SAL|SARDINHA|SUCO|TEMPERO')
      OR
      regexp_like (c.categoria, 
        'FLV|FRUTA|VINAGRE|HORTIFRUTI|LA DE ACO|DESINFETANTE|DETERGENTE|ESPONJA|DE CHAO|PAPEL HIGIENICO|ALVEJANTE|VASSOURA|SABAO PO|SABAO BARRA')
      )
    AND NOT regexp_like (c.categoria, 'CORRIDA|RACAO|MODELAR')
    AND  c.nivelhierarquia = 3
  ) f ON f.seqFamilia = p.seqFamilia
  WHERE d.nroEmpresa = 1
    AND d.nrocheckout in (9,8,7,6,5,4,3)
    AND d.dtaMovimento BETWEEN to_date('27/02/2022','DD/MM/YYYY') AND to_date('26/03/2022','DD/MM/YYYY')
  GROUP BY d.dtaMovimento, d.nroCheckout, d.coo, r.nronotafiscal
) WHERE invalido = 0
ORDER BY pdv, coo, total DESC ---Edited by Rafael dos Anjos


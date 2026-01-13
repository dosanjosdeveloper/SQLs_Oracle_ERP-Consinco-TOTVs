SELECT t.nroempresamae,
       t.codmovimento, -- 189
       f.codmovimento, 
       f.descricao, 
       f.codredetef, 
       f.codbandeiratef, 
       f.parcvlrini, 
       f.parcvlrfim,
       t.taxaadm||' %' TAXA_COBRADA
       FROM FI_TSCODMOVIMENTO f
         JOIN FI_TSEMPCODMOVIMENTO t ON t.codmovimento = f.codmovimento
          WHERE f.nroformapagto in (7,6,13)
          AND f.codredetef in (181)

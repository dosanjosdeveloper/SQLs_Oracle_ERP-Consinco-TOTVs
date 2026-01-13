SELECT * FROM tb_conveniocompra 
WHERE nroempresa = 8 
AND seqpessoa = 13752 
AND dtamovimento 
BETWEEN  to_date('03/02/2022','DD/MM/YYYY') AND to_date('01/03/2022','DD/MM/YYYY')

/*
SELECT sum(vlrtotal) FROM tb_conveniocompra 
WHERE nroempresa = 8 
AND seqpessoa = 13752 
AND dtamovimento 
BETWEEN  to_date('03/02/2022','DD/MM/YYYY') AND to_date('01/03/2022','DD/MM/YYYY')
*/

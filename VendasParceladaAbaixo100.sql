 SELECT nroempresa,nrocheckout,dtahoremissao,seqdocto,nroformapagto,valor,vlrtotal,qtdparcelatef,dtabasecobranca FROM consincomonitor.tb_doctopagto WHERE qtdparcelatef > '1' 
-- SELECT * FROM tb_doctopagto WHERE qtdparcelatef > '1' 
and nroformapagto='13' 
and vlrtotal < '100' 
and dtabasecobranca between TO_DATE('01/12/2018','DD/MM/YYYY')
and TO_DATE('15/03/2019','DD/MM/YYYY') 
order by nroempresa,dtahoremissao,vlrtotal
select * from tb_doctopagto d where d.nroformapagto in (8,14) and d.valor > 0.0 and 
    trunc(d.dtahoremissao) between '001oct2025' and '01oct2025' and d.nroempresa in (11);

-- select * from tb_formapagto a where a.formapagto like '% POS %'
/*
declare
   nome number := '&valor';
begin
   dbms_output.put_line('Valor digitado foi: '||nome);
end;
*/


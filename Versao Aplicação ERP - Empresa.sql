-- Consulta Versão
select * from ge_atualizacao a 
order by a.dtaultatualizacao desc;

-- Consulta Empresa
select a.nomereduzido, a.* from 
ge_empresa a;

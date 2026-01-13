-- call pkg_cargamonitor.sp_importarcargaperiodo(3,'TB_PRODPRECO',sysdate -3);

select * from tb_empresasegmento s where s.nrosegmento in (3) order by s.nroempresa, s.nrosegmento-- s.nroempresa = 3

-- Update para Ativar Empresa Segmento --
-- UPDATE tb_empresasegmento SET ativo = 'S' WHERE nroempresa = 3 AND nrosegmento = 3

-- Segmento por familia --
select * from tb_famsegmento f where f.nrosegmento in (3) and f.seqfamilia = 44645

select * from tb_formapagtoempresa t where t.nroformapagto = 252 and t.nroempresa in (1,2,3,5,6,7,8) and t.nrosegmento = 3

-- Update para Ativar Forma de Pagamento em PDV --
-- UPDATE tb_formapagtoempresa SET ativo = 'S' WHERE nroformapagto = 252 AND nroempresa = 3 AND nrosegmento = 3





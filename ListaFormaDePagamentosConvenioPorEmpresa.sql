-- select cfp.nroformapagto||' - '|| cfp.formapagto as FORMA_PAGTO from consincomonitor.tb_formapagto cfp where cfp.ativo = 'S' and cfp.especie = 'V'  -- cfp.nroformapagto, cfp.formapagto
-- select * from consincomonitor.tb_formapagtoempresa cfpe where cfpe.nroempresa in (11) and cfpe.nrosegmento = 6 and cfpe.ativo = 'S'

select (select ge.nomereduzido from ge_empresa ge where ge.nroempresa = cfpe.nroempresa) as EMPRESA,cfp.nroformapagto||' - '|| cfp.formapagto as FORMA_PAGTO from consincomonitor.tb_formapagtoempresa cfpe
join consincomonitor.tb_formapagto cfp on cfp.nroformapagto = cfpe.nroformapagto
where cfpe.nroempresa in (11,12,16) and cfpe.nrosegmento = 6 and cfpe.ativo = 'S'
and cfp.especie = 'V'
order by cfpe.nroempresa,cfpe.nroformapagto

/*
Ops! Houve um equivoco ao fornecer informação, visto que as informaçãoes passada para Bianca foi das formas de pagamento ativos nas lojas para exbirem no AcruxMonitor.
Quantdo ativo na retaguarda, não significa que estará disponível no PDV. O mesmo tem que ser ativo no AcruxMonitor no caminho AcruxMonitor>>Cadastro>>Formas e Condições de Pagamentos>>Formas Pagamentos por Impressoras.
***********************OBSOLETO ***********************

-- select * from mrl_formapagto fp where fp.Codespecie = 'CONVEN'
-- select * from mrl_formapagtoemp fpe where fpe.nroempresa in (11)and fpe.status = 'A' 

select fp.nroformapagto, fp.seqpessoaconvenio||' - '||fp.formapagto FORMA_PAGTO, FP.CODESPECIE, (select ge.nomereduzido from ge_empresa ge where ge.nroempresa = fpe.nroempresa) as Empresa from mrl_formapagtoemp fpe 
join mrl_formapagto fp on fpe.nroformapagto = fp.nroformapagto
where fpe.nroempresa in (11,12,16) and fpe.status = 'A' and fp.Codespecie = 'CONVEN'
*/

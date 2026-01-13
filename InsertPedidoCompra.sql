-- Tabela Pedido de Compra -- 
select * from mac_gercompra b where b.seqgercompra in ('200831','200772') -- b.seqfornecprincipal in ('18312',) and

-- Tabela Itens Pedido de Compra -- 
select * from mac_gercompraitem a where a.seqgercompra in ('200831') and a.nroempresa = '11' and a.seqproduto = '1769839' -- 200772, 200738, 200831


select trunc(sysdate - 60) from dual

-- Criar o número Lote Pedido 
-- insert
 into mac_gercompra ( seqgercompra*, seqcomprador, descritivo,situacaolote, dtahorinclusao,usuinclusao,dtahoralteracao,usualteracao,tipoabastecate , qtdabastecate , dtaabastecate,
periodomedvend,qtdmedvda,dtainiciomedvda,indtipomedvda, criterioemissaovendas, tipoembalagem,tipolote,dtalimiterecebto,pzoadicobertura,tipopzoadiccobertura,nroempresagerallote, codgeraloper,status,indrestringeloja,
agendadomingo,agendasegunda, agendaterca,agendaquarta,agendaquinta,agendasexta,agendasabado,tipomodelocompra, indconsiderarsldpendareceber,indconsiderasldpendaexpedir,indconsiderarqtdacompar,indusaagendafornecedorcotacao
incsugcompraloja,tippedidosuprim,indconssldpendareceberloja,indconssldpendaexpedirloja,indconsqtdacomprarloja,indcalccsugcompraformula,indtipocalcformula,indconsestoquecentralsug,
tiporecebtoem,finalizaauto,indsuglastropalete,indcalcfaixamedia,apporigem,indtransfaauto,indqtddtarecebdifitem,criterioemissaocompras,indlotecotacao,utilnatimorto,integracomprasmobile,indusaregiaocompra,
indcotacaoweb,indgerediaut,indtidtarecebdif,negociacao,conslotependlibcompracot,indpermvisprecovdaempabastec,indutilcompraencarte,indvisestqcentralalabast,indconsestqdisploja,seqfornecprincipal,
indpedbonifacordopromoc,indvisinfcusto,utiladicsugestpromoc,indacatasugauto,tipolimrecebtoem,considerasldpendareceberpextra,considerasldpendaexpedirpextra,consideraqtdacomprarpextra,indutilprodsubsituto,indcotacaoflv,
tempogeracaolote
)

values( 'autoincrement','44 - Victor','PANPHARMA DISTRIBUIDORA DE MEDICAMENTOS','G', sysdate, 'CP_VICTOR', sysdate,'CP_VICTOR','Próximos N Dias',30,'DD/MM/YYYY',
'Media Geral Atual',60,'DD/MM/YYYY','N','MesAtualAnt', 'C','C','DD/MM/YYYY',0,'D',11,3,'A','N',
'N','N','N','N','N','N','N','A','S','N','N','N',
'N','B','N','N','N','N','C','N',
'Data Personalizada','N','N','N',1,'N,'N','SemAtualAnt','N','A','N',0,
'N','N','N','N','S','N','N','N','S',18312,
'N','N','N','N','Data Personalizada','N','N','N','N','N',
30)

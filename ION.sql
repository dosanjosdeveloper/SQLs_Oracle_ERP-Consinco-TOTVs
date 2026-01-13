/*---------- Retorna Código e Embalagem Produtos  --------------*/
select * from ionv_sync.ionv_produtos_regiao t where t.codprod in ('193')
select * from ionv_sync.ionv_estoque  awhere a.codprod in (1344455)

/*---------- Retorna Código e Embalagem Produtos  --------------*/
select * from ionv_sync.ionv_produtos a where a.codprod in (2129132,2117827,2129140)
select * from ionv_sync.ionv_produtos_embalagens a where a.codprod in (21700,21730)

/*---------- Retorna Filiais Disponiveis --------------*/
select * from ionv_sync.ionv_filiais a --where a.codfilial = '10';

/*---------- Retorna Regiões(Segmento) Disponiveis --------------*/
select * from ionv_sync.ionv_regioes

/*---------- Retorna Fornecedores Disponiveis --------------*/
select * from ionv_sync.ionv_fornecedores r where r.codfornec like '24114'

select * from ionv_sync.ionv_clientes_creddisp a where a.codcli in (23447)

select * from ionv_sync.ionv_estoque a where a.codprod IN (36055,36096,788066,2091712,2091720)--in (1344455,225) -- w.codfilial = '13' and w.codprod in ('16251','1996681')

-- select * from ionv_sync.ionv_vendedor where codvendedor = '1325'

-- select * from ionv_sync.ionv_vendedor_clientes where codvendedor = 1320 and codcli = 27657

select * from ionv_sync.ionv_clientes 


select * from ionv_sync.ionv_clientes_creddisp where codcli = 16750

select * from ionv_sync.ionv_produtos where codprod IN (3207,4648)--(36055,36096,788066,2091712,2091720)

select * from ionv_sync.ionv_

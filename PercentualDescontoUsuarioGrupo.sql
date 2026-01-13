-- select * from tb_usuario u where u.percdescmaximo > 0.00 and u.ativo = 'S'
-- select u.sequsuario,u.nome,u.percdescmaximo from tb_usuario u where u.percdescmaximo > 0.00 and u.ativo = 'S' order by u.percdescmaximo
-- select g.seqgrupo,g.nome,g.percdescmaximo from tb_grupo g where g.percdescmaximo > 0.00

select g.nome||' - '||gu.seqgrupo Grupos_Usuarios, u.nome||' - '||gu.sequsuario Usuarios,
g.percdescmaximo Desconto_Grupo, u.percdescmaximo Desconto_Usuario 
from tb_grupousuario gu
join tb_grupo g on g.seqgrupo = gu.seqgrupo
join tb_usuario u on u.sequsuario = gu.sequsuario
where -- u.percdescmaximo > 0.00 
u.ativo = 'S'
and g.percdescmaximo > 0.00
order by g.nome,u.nome


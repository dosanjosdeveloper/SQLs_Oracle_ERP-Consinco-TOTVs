select 
   'USER      ' TIPO ,u.sequsuario||' - '||u.nome USERS_OR_GROUP, 
   u.percdescmaximo ||'%' AS PERCETUAL_DESC,
   u.ativo  
      from tb_usuario u 
         where u.ativo in ('S')
         and u.percdescmaximo > 0.00
union

select 
   'GROUP    ' as TIPO,g.seqgrupo||' - '||g.nome USERS_OR_GROUP,
   g.percdescmaximo ||'%' AS PERCETUAL_DESC,
   g.ativo
      from tb_grupo g
         where g.ativo = 'S'
         and g.percdescmaximo > 0.00
         
         
/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX */
SELECT 
   'USER' AS TIPO,
   u.sequsuario || ' - ' || u.nome AS USERS_OR_GROUP, 
   TO_CHAR(u.percdescmaximo * 100, '99990.9') || '%' AS PERCENTUAL_DESC,
   u.ativo  
FROM tb_usuario u 
WHERE u.ativo = 'S'
AND u.percdescmaximo > 0.00

UNION ALL

SELECT 
   'GROUP' AS TIPO,
   g.seqgrupo || ' - ' || g.nome AS USERS_OR_GROUP,
   TO_CHAR(g.percdescmaximo * 100, '99990.9') || '%' AS PERCENTUAL_DESC,
   g.ativo
FROM tb_grupo g
WHERE g.ativo = 'S'
AND g.percdescmaximo > 0.00;

         

         

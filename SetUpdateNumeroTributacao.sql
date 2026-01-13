-- 87385

--Update map_famdivisao fd
--set fd.nrotributacao = 501
--Where fd.nrodivisao = 2
--and fd.nrotributacao = 1
--  select count(seqfamilia) from map_famdivisao where nrotributacao = 501 and nrodivisao = 1
-- select * from map_famdivisao where nrotributacao = 501 and nrodivisao = 1

select * from map_famdivisao where seqfamilia = 92427

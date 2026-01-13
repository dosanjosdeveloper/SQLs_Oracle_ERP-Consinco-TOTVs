select * from consincomonitor.tb_doctocupom a where a.nrocheckout = 03
and a.nroempresa = 8 and a.seqdocto in (1208824 );

select * from consincomonitor.tb_doctonfe a where a.nrocheckout = 03
and a.nroempresa = 8 and a.seqdocto in (1208824 );

select * from consincomonitor.tb_doctoitem a where a.nrocheckout = 03
and a.nroempresa = 08 and a.seqdocto in (1208824 );

select * from consincomonitor.tb_doctopagto a where a.nrocheckout = 03
and a.nroempresa = 08 and a.seqdocto in (1208824 ) for update; --6,21

select a.replicacao, a.* from consincomonitor.tb_docto a where a.seqdocto in (1358868)
and a.nroempresa = 8 and a.nrocheckout in (1);

select * from consinco.rf_notamestre a where a.nroempresa = 8
and a.serie in (101) and a.nronota in (818016);

select * from consinco.mfl_doctofiscal a where
a.nroempresa = 16 and
a.seriedf in (113,119) and
a.numerodf in (192,241);

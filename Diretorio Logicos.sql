SELECT * FROM DBA_NETWORK_ACLS

SELECT * FROM all_directories



declare
obj_param_smtp c5_tp_param_smtp;
begin
obj_param_smtp := c5_tp_param_smtp(13); --> empresa
sp_envia_email(obj_param => obj_param_smtp,
psDestinatario => 'ti01@supernorte.com.br',
psAssunto => 'Teste',
psMensagem => 'Teste',
psindusahtml => 'N');
end;


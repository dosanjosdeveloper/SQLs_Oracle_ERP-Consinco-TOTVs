-- Script Consinco para Envio de Email do Banco de Dados
declare
obj_param_smtp c5_tp_param_smtp;
begin
obj_param_smtp := c5_tp_param_smtp(13);
sp_envia_email(obj_param => obj_param_smtp,
psDestinatario => 'ti01@supernorte.com.br',
psAssunto => 'Teste',
psMensagem => 'Teste',
psindusahtml => 'N');
end;

-- Para verificar as ACLs já existentes:
SELECT * FROM DBA_NETWORK_ACLS

-- Verificando se o UTL_MAIL está instalado e configurado
SELECT object_name, object_type
FROM all_objects
WHERE object_name = 'UTL_MAIL';

-- 
BEGIN
  UTL_MAIL.send(
    sender     => 'rafael.dosanjos@outlook.com',
    recipients => 'ti01@supernorte.com.br',
    subject    => 'Teste de E-mail via Oracle',
    message    => 'Este é um e-mail enviado a partir de uma rotina no Oracle.',
    mime_type  => 'text/plain'
  );
END;

-- Alternativa com UTL_SMTP (caso UTL_MAIL não esteja disponível):
DECLARE
  c  UTL_SMTP.connection;
  v_from    VARCHAR2(100) := 'ti01@supernorte.com.br';
  v_to      VARCHAR2(100) := 'rafael.dosanjos@outlook.com.br';
  v_subject VARCHAR2(100) := 'Assunto: Teste Oracle';
  v_message VARCHAR2(1000) := 'Olá, este é um e-mail de teste enviado via Oracle.';
BEGIN
  c := UTL_SMTP.open_connection('smtp-legacy.office365.com', 587);
  UTL_SMTP.helo(c, 'supernorte.com.br');
  UTL_SMTP.mail(c, v_from);
  UTL_SMTP.rcpt(c, v_to);
  UTL_SMTP.open_data(c);
  UTL_SMTP.write_data(c, 'From: ' || v_from || CHR(13));
  UTL_SMTP.write_data(c, 'To: ' || v_to || CHR(13));
  UTL_SMTP.write_data(c, 'Subject: ' || v_subject || CHR(13));
  UTL_SMTP.write_data(c, CHR(13) || v_message);
  UTL_SMTP.close_data(c);
  UTL_SMTP.quit(c);
END;

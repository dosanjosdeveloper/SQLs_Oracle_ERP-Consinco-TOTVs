-- Create table
create table MNTR_CERTIFICADO
(
  cnpj_loja          nvarchar2(14) not null,
  nome_loja          nvarchar2(50) not null,
  dta_validade       date not null,
  loja_ativa         char(1) not null,
  tpo_certificado    char(2) not null,
  dtahor_ultimaatual timestamp not null
)
;
-- Add comments to the columns 
comment on column MNTR_CERTIFICADO.cnpj_loja
  is 'CNPJ da loja como identificador unico';
comment on column MNTR_CERTIFICADO.nome_loja
  is 'Nome reduzido da loja';
comment on column MNTR_CERTIFICADO.dta_validade
  is 'Data do certificado a expirar ';
comment on column MNTR_CERTIFICADO.loja_ativa
  is 'Se a loja ainda esta ativa';
comment on column MNTR_CERTIFICADO.tpo_certificado
  is 'Tipo de Certificado se A1 ou A3 ou outro que surgir';
comment on column MNTR_CERTIFICADO.dtahor_ultimaatual
  is 'Data da utilma atualizacao de dados podendo ser da criacao';
  
  
  select * from mntr_certificado

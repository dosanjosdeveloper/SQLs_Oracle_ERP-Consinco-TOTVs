/*** Sequência View ***/
-- mflv_basenf >> Para outra View
-- mlfv_dfbasefiscal
-- mlfv_nfbasefiscal
-- mflv_dfbasefiscal = Encontrado

/** Tabelas View mflv_dfbasefiscal **/
from   mfl_doctofiscal a, mfl_dfitem b, max_codgeraloper c, max_codgeraloper d, map_produto e, map_familia f, ge_pessoa g, max_empresa h

/** Tabelas View mlfv_nasenf **/
from   mlf_notafiscal a, ge_pessoa c, max_empserienf e
from   mfl_doctofiscal b, ge_pessoa d, max_empserienf f

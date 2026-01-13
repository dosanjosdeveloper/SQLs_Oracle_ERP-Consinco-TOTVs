-- SELECT * FROM tisuper_com_vestcasa;
-- select * from tb_formapagto a where a.nroformapagto = 168

SHOW ERRORS PACKAGE 'PKG_ETL_GERENCIAL';

SELECT line, position, text
FROM user_errors
WHERE name = 'PKG_ETL_GERENCIAL'
ORDER BY line;

SELECT object_name, object_type, status
FROM user_objects
WHERE object_name = 'PKG_ETL_GERENCIAL';


SELECT DBMS_METADATA.GET_DDL('PACKAGE', 'PKG_ETL_GERENCIAL')
FROM dual;

SELECT DBMS_METADATA.GET_DDL('PACKAGE_BODY', 'PKG_ETL_GERENCIAL')
FROM dual;

SELECT text
FROM user_source
WHERE name = 'PKG_ETL_GERENCIAL'
ORDER BY line;

insert into ONT_DB_LOOKUP
(C_DOMAIN_ID, C_PROJECT_PATH, C_OWNER_ID, C_DB_FULLSCHEMA, C_DB_DATASOURCE, C_DB_SERVERTYPE, C_DB_NICENAME)
VALUES
('{{ shrine_i2b2_domain }}','{{ shrine_i2b2_project }}/','@','{{ shrine_i2b2_ont.schema }}','java:/{{ shrine_i2b2_ont.datasrc }}','{{ i2b2_db_type | upper }}','{{ shrine_i2b2_project }}');

-- TODO: schema work for crc lookup?
insert into CRC_DB_LOOKUP
(C_DOMAIN_ID, C_PROJECT_PATH, C_OWNER_ID, C_DB_FULLSCHEMA, C_DB_DATASOURCE, C_DB_SERVERTYPE, C_DB_NICENAME)
VALUES
( '{{ shrine_i2b2_domain }}', '/{{ shrine_i2b2_project }}/', '@', '{{ i2b2_cell.Crcdata.schema }}', 'java:/{{ i2b2_cell.Crcdata.datasrc }}', '{{ i2b2_db_type | upper }}', '{{ shrine_i2b2_project }}' );

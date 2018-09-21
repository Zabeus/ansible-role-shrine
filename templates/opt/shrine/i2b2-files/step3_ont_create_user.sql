-- modified to fit Postgres 2014-07-23
create user {{ shrine_i2b2_ont.owner }} with password '{{ shrine_i2b2_ont.pass | i2b2_pass }}';

-- create matching schema
create schema authorization {{ shrine_i2b2_ont.schema }};

-- i2b2metadata.table_access
grant all privileges on all tables in schema {{ shrine_i2b2_ont.schema }} to {{ shrine_i2b2_ont.owner }};
grant all privileges on all sequences in schema {{ shrine_i2b2_ont.schema }}to {{ shrine_i2b2_ont.owner }};
grant all privileges on all functions in schema {{ shrine_i2b2_ont.schema }} to {{ shrine_i2b2_ont.owner }};

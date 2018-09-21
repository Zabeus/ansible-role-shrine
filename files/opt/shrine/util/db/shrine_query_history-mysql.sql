alter table ERROR_RESULT add column CODEC varchar(256) not null default "Pre-1.20 Error";
alter table ERROR_RESULT add column STAMP varchar(256) not null default "Unknown time and machine";
alter table ERROR_RESULT add column SUMMARY text not null;
alter table ERROR_RESULT add column PROBLEM_DESCRIPTION text not null;
alter table ERROR_RESULT add column DETAILS text not null;
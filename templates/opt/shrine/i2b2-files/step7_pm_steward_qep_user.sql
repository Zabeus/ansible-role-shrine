{% if using_shrine_steward | bool %}
{% for user in steward_qep_user %}
-- CREATE USER {{ user.name }} for SHRINE Data Steward
insert into PM_USER_DATA
(user_id, full_name, password, status_cd)
values
('{{ user.name }}', '{{ user.full_name }}', '{{ user.pass | i2b2_pass }}', 'A');

insert into PM_PROJECT_USER_ROLES
(PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
values
('{{ shrine_i2b2_project }}', '{{ user.name }}', 'USER', 'A');

insert into PM_PROJECT_USER_ROLES
(PROJECT_ID, USER_ID, USER_ROLE_CD, STATUS_CD)
values
('{{ shrine_i2b2_project }}', '{{ user.name }}', 'DATA_OBFSC', 'A');

insert into PM_USER_PARAMS
(datatype_cd, user_id, param_name_cd, value, status_cd)
values
('T', '{{ user.name }}', 'qep', true, 'A');

{% endfor %}
{% else %}
-- This file intentionally left blank, since using_shrine_steward is set to false.
{% endif %}
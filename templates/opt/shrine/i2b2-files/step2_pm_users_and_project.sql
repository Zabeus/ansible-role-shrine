{% for user in shrine_user %}
-- CREATE USER {{ user.name }}
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

{% endfor %}

-- CREATE THE PROJECT for SHRINE
insert into PM_PROJECT_DATA
(project_id, project_name, project_wiki, project_path, status_cd)
values
('{{ shrine_i2b2_project }}', '{{ shrine_i2b2_project }}', 'http://open.med.harvard.edu/display/SHRINE', '/{{ shrine_i2b2_project }}', 'A');

-- captures information and registers the cells associated to the hive.
insert into PM_CELL_DATA
(cell_id, project_path, name, method_cd, url, can_override, status_cd)
values
('CRC', '/{{ shrine_i2b2_project }}', 'SHRINE Federated Query', 'REST', 'https://{{ shrine_ip }}:{{ shrine_ports.https }}/shrine/rest/i2b2/', 1, 'A');

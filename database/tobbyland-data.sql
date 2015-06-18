--
-- member table data
--

INSERT INTO MEMBER (member_id, password, nickname, email, method, task, exam)
VALUES ('ADMIN','1234','ADMIN','a','a','a','a');


--
-- member_roles table data
--

INSERT INTO MEMBER_ROLES (member_id, ROLE)
VALUES ('ADMIN','ROLE_ADMIN');

INSERT INTO MEMBER_ROLES (member_id, ROLE)
VALUES ('ADMIN','ROLE_USER');


--
-- tendency table data
--

insert into tendency
values ('a1', '독고다이형');

insert into tendency
values ('a2', '토론형');

insert into tendency
values ('a3', '실습형');

insert into tendency
values ('b1', '텀프로젝트');

insert into tendency
values ('b2', '팀플레이');

insert into tendency
values ('b3', '개인과제');

insert into tendency
values ('c1', '서술형');

insert into tendency
values ('c2', '혼합형');

insert into tendency
values ('c3', '오픈북');

insert into tendency
values ('c4', '실습');









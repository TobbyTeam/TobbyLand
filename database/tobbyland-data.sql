USE tobbyland;

--
-- tendency table data
--

INSERT INTO tendency (tendency_id, title)
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


--
-- member table data
--

INSERT INTO MEMBER (member_id, password, nickname, email, method, task, exam)
VALUES ('ADMIN','1234','ADMIN','babsang24@hanmail.net','a1','b1','c1');


--
-- member_roles table data
--

INSERT INTO MEMBER_ROLES (member_id, ROLE)
VALUES ('ADMIN','ROLE_ADMIN');

INSERT INTO MEMBER_ROLES (member_id, ROLE)
VALUES ('ADMIN','ROLE_USER');


--
-- lecture table data
--

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','sysem','ebiz','kim', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','data','nano','박상욱', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기업데이터','나노','이영석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학','기계','나경상', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전기회로','전기','박준규', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C언어','컴공','이영호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학','기계','나경상', 10);







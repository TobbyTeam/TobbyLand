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
VALUES ('admin','1234','ADMIN','babsang24@hanmail.net','a1','b1','c1');


--
-- member_roles table data
--

INSERT INTO MEMBER_ROLES (member_id, ROLE)
VALUES ('admin','ROLE_ADMIN');

INSERT INTO MEMBER_ROLES (member_id, ROLE)
VALUES ('admin','ROLE_USER');


--
-- department table data
--

INSERT INTO DEPARTMENT (department_name)
VALUES ('기계공학과');

INSERT INTO DEPARTMENT (department_name)
VALUES ('기계설계공학과');

INSERT INTO DEPARTMENT (department_name)
VALUES ('메카트로닉스공학과');

INSERT INTO DEPARTMENT (department_name)
VALUES ('전자공학부');

INSERT INTO DEPARTMENT (department_name)
VALUES ('컴퓨터공학부');

INSERT INTO DEPARTMENT (department_name)
VALUES ('게임공학부');

INSERT INTO DEPARTMENT (department_name)
VALUES ('신소재공학과');

INSERT INTO DEPARTMENT (department_name)
VALUES ('생명화학공학과');

INSERT INTO DEPARTMENT (department_name)
VALUES ('디자인학부');

INSERT INTO DEPARTMENT (department_name)
VALUES ('경영학부');

INSERT INTO DEPARTMENT (department_name)
VALUES ('나노광공학과');

INSERT INTO DEPARTMENT (department_name)
VALUES ('에너지전기공학과');

INSERT INTO DEPARTMENT (department_name)
VALUES ('지식융합학부');


--
-- department table data
--

INSERT INTO SEMESTER (semester)
VALUES ('13-1학기');

INSERT INTO SEMESTER (semester)
VALUES ('13-2학기');

INSERT INTO SEMESTER (semester)
VALUES ('14-1학기');

INSERT INTO SEMESTER (semester)
VALUES ('14-2학기');

INSERT INTO SEMESTER (semester)
VALUES ('15-1학기');

INSERT INTO SEMESTER (semester)
VALUES ('15-2학기');


--
-- lecture table data
--

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','시스템분석설계','기계공학과','임홍순', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','데이터베이스','기계설계공학과','이충석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기업데이터','메카트로닉스공학과','이영석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학','전자공학부','나경상', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전기회로','게임공학부','박준규', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C언어','나노광공학과','이영호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제어학','경영학부','장진영', 10);







USE tobbyland;

--
-- tendency table data
--

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('a1', '독고다이형');

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('a2', '토론형');

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('a3', '실습형');

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('b1', '텀프로젝트');

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('b2', '팀플레이');

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('b3', '개인과제');

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('c1', '서술형');

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('c2', '혼합형');

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('c3', '오픈북');

INSERT INTO TENDENCY (TENDENCY_ID, TITLE)
VALUES ('c4', '실습');


--
-- role table data
--

INSERT INTO ROLE (role, role_name)
VALUES ('ROLE_ADMIN', '운영자');

INSERT INTO ROLE (role, role_name)
VALUES ('ROLE_USER', '일반유저');

INSERT INTO ROLE (role, role_name)
VALUES ('ROLE_MANAGER', '관리자');


--
-- member table data
--

INSERT INTO MEMBER (member_id, password, nickname, email, method, task, exam, enabled)
VALUES ('admin','1234','ADMIN','babsang24@hanmail.net','a1','b1','c1', 1);


--
-- member_roles table data
--

INSERT INTO MEMBER_ROLE (member_id, ROLE)
VALUES ('admin','ROLE_ADMIN');

INSERT INTO MEMBER_ROLE (member_id, ROLE)
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
VALUES ('나노-광공학과');

INSERT INTO DEPARTMENT (department_name)
VALUES ('에너지·전기공학과');

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

--  기계공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','정역학','기계공학과','박승철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터프로그래밍기초','기계공학과','김인태', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터프로그래밍기초','기계공학과','정찬우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계제작실습','기계공학과','김덕기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','재료역학1','기계공학과','이종길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','열역학1','기계공학과','한진호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','2D CAD도면기초','기계공학과','김찬우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','2D CAD도면기초','기계공학과','홍미경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','동역학','기계공학과','홍미경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','열전달','기계공학과','이응호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','열전달','기계공학과','김택영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','생산자동화','기계공학과','윤원수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유체역학2','기계공학과','김택영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유체역학2','기계공학과','이응호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','재료실험','기계공학과','이진교', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계요소설계','기계공학과','이종항', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계요소설계','기계공학과','이진교', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','3D CAD','기계공학과','심진형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','열유체실험','기계공학과','이응호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','냉동공학','기계공학과','박승철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','냉동공학','기계공학과','김주형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','나노공학','기계공학과','조언정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','정밀가공','기계공학과','박철우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','CAE해석과 설계','기계공학과','이종길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','김경엽', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','김택영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','박승철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','박철우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','서진성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','유택인', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','윤원수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','이종길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','심진형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','조언정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','한진호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계공학과','이종항', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계2','기계공학과','지도교수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','플랜트공학','기계공학과','김경엽', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계시스템제어','기계공학과','윤원수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','혁신공학설계 및 트리즈','기계공학과','박영수', 10);


-- 기계설계공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계설계학개론','기계설계공학과','이경원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계설계학개론','기계설계공학과','신형철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','도면작성 및 2D CAD','기계설계공학과','양해정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','도면작성 및 2D CAD','기계설계공학과','이선후', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C프로그래밍','기계설계공학과','손병희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업화학1','기계설계공학과','김미래', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업화학1','기계설계공학과','이형용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초전기전자실습','기계설계공학과','황달연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계공학실험','기계설계공학과','이택성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터응용계측실습','기계설계공학과','강병훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','재료역학1','기계설계공학과','이재학', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','재료역학1','기계설계공학과','최원석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계재료 및 제작법','기계설계공학과','장태익', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(진동계측 및 기계진단)','기계설계공학과','신형철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(반도체 장비 시스템 설계 실무)','기계설계공학과','강병훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','측정실습','기계설계공학과','조용호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','동역학','기계설계공학과','이경원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유한요소법','기계설계공학과','이택성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','열역학 및 열전달','기계설계공학과','장태익', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','자동제어','기계설계공학과','황달연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','심화 3D CAD','기계설계공학과','김창식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','PLC유공압실습','기계설계공학과','조용호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프레스DIE설계','기계설계공학과','김욱배', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(치공구 설계 실무)','기계설계공학과','서정환', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','3D CAM','기계설계공학과','정찬웅', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','나노공학','기계설계공학과','김광', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계시스템응용설계','기계설계공학과','신형철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계설계공학과','강병훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계설계공학과','김광', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계설계공학과','김욱배', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계설계공학과','신형철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계설계공학과','양해정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계설계공학과','이경원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계설계공학과','이택성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계설계공학과','이재학', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','기계설계공학과','황달연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계2','기계설계공학과','지도교수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','금형CAE','기계설계공학과','최승일', 10);


-- 메카트로닉스공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','메카트로닉스 입문','메카트로닉스공학과','주형길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기계공작법','메카트로닉스공학과','신문균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','창의적공학설계','메카트로닉스공학과','차동혁', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전기회로1','메카트로닉스공학과','김영중', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전기회로2','메카트로닉스공학과','황상연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업역학','메카트로닉스공학과','남대훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자회로실험','메카트로닉스공학과','이경재', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자회로실험','메카트로닉스공학과','임관수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자회로','메카트로닉스공학과','장두원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C프로그래밍1','메카트로닉스공학과','이석원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C프로그래밍1','메카트로닉스공학과','한진현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제어공학','메카트로닉스공학과','정명진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제어공학','메카트로닉스공학과','김기현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','센서','메카트로닉스공학과','강대진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','센서','메카트로닉스공학과','임상성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','마이크로컴퓨터구조','메카트로닉스공학과','남윤석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','비주얼프로그래밍','메카트로닉스공학과','허헌', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','비주얼프로그래밍','메카트로닉스공학과','한진현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','현장실습기획','메카트로닉스공학과','주형길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','동역학','메카트로닉스공학과','이원봉', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','서보전동기1','메카트로닉스공학과','주형길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','머신비젼','메카트로닉스공학과','정부영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제어기설계','메카트로닉스공학과','이양희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','시스템설계','메카트로닉스공학과','차동혁', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','시스템설계','메카트로닉스공학과','심재홍', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','시스템설계','메카트로닉스공학과','홍준기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','강대진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','김영중', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','남대훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','남윤석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','심재홍', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','이석원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','이양희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','정명진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','주형길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','차동혁', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','메카트로닉스공학과','허헌', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계2','메카트로닉스공학과','지도교수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','지능로봇','메카트로닉스공학과','박영제', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(제어기를 적용한 정밀모션제어)','메카트로닉스공학과','황상연', 10);


-- 전자공학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','창의적 공학설계','전자공학부','설봉환', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍언어(1학년)','전자공학부','김수민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍언어(1학년)','전자공학부','김문철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍언어(1학년)','전자공학부','박진성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍언어(2학년)','전자공학부','김수민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍언어(2학년)','전자공학부','김석우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털공학및실습','전자공학부','신수현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털공학및실습','전자공학부','남충모', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털공학및실습','전자공학부','윤종호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털공학및실습','전자공학부','김성용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자회로 및 실습1','전자공학부','최웅세', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자회로 및 실습1','전자공학부','박상규', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자회로 및 실습1','전자공학부','박상규', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','회로이론1','전자공학부','정두희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','회로이론1','전자공학부','박상규', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','회로이론1','전자공학부','정계택', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','Visual C++','전자공학부','윤완오', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','Visual C++','전자공학부','유길현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','윈도우 프로그래밍','전자공학부','유길현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신호 및 시스템','전자공학부','한진수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신호 및 시스템','전자공학부','김승남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','VHDL 및 실습','전자공학부','최종성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','VHDL 및 실습','전자공학부','윤호근', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','Professional Practice Seminar','전자공학부','이유진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','정보통신네트워크기초','전자공학부','이제호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','정보통신네트워크기초','전자공학부','전철항', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털통신1','전자공학부','김정곤', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털통신1','전자공학부','이종락', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털통신1','전자공학부','류영권', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','마이크로프로세서1','전자공학부','김완중', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','마이크로프로세서1','전자공학부','송창헌', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','마이크로프로세서1','전자공학부','엄수홍', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','창의적IT소프트웨어','전자공학부','김평수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','반도체공학','전자공학부','정인호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','반도체공학','전자공학부','남충모', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털신호처리','전자공학부','김준수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','자료구조 및 알고리즘','전자공학부','김평수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','IT융합개론','전자공학부','손대일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(이동로봇제어)','전자공학부','이응혁', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','초고속통신망','전자공학부','이재명', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','이동통신공학','전자공학부','최성연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','이동통신공학','전자공학부','김광훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','임베디드시스템SW','전자공학부','박진성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','멀티미디어프로그래밍실습','전자공학부','김문철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','최웅세', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','최성연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','최정훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','한진수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','이응혁', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','김정곤', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','남충모', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','이재명', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','이제호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','김응태', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','정두희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','김평수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','정인호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','김문철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','김준수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','전자공학부','김수민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계2','전자공학부','지도교수', 10);


-- 컴퓨터공학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전산학기초','컴퓨터공학부','나보균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전산학기초','컴퓨터공학부','이정준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전산학기초','컴퓨터공학부','김경엽', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전산학기초','컴퓨터공학부','장창기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전산학기초','컴퓨터공학부','공기석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','소셜미디어','컴퓨터공학부','김은주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반생물학','컴퓨터공학부','이준경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유닉스기초','컴퓨터공학부','전광일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유닉스기초','컴퓨터공학부','이영남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유닉스기초','컴퓨터공학부','김명준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유닉스기초','컴퓨터공학부','허훈식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','이산수학','컴퓨터공학부','방영철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','이산수학','컴퓨터공학부','서대영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍','컴퓨터공학부','이상호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍','컴퓨터공학부','나보균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍','컴퓨터공학부','서대영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍','컴퓨터공학부','박정민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','자료구조','컴퓨터공학부','공기석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','자료구조','컴퓨터공학부','방영철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','자료구조','컴퓨터공학부','박정민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','자료구조','컴퓨터공학부','이정준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','객체지향언어','컴퓨터공학부','노영주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','객체지향언어','컴퓨터공학부','이상호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','객체지향언어','컴퓨터공학부','한웅진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','객체지향언어','컴퓨터공학부','허훈식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','논리회로','컴퓨터공학부','정성택', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','논리회로','컴퓨터공학부','김명준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','논리회로','컴퓨터공학부','김경엽', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','웹프로그래밍기초','컴퓨터공학부','한경숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(스마트앱 설계 및 응용)','컴퓨터공학부','전광일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(ARM Cortex-M3) 시스템 프로그래밍','컴퓨터공학부','최진구', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','운영체제','컴퓨터공학부','전광일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','운영체제','컴퓨터공학부','이창우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','운영체제','컴퓨터공학부','강동현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','운영체제','컴퓨터공학부','허훈식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','운영체제','컴퓨터공학부','공기석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털신호처리','컴퓨터공학부','배유석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털신호처리','컴퓨터공학부','정성택', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','소프트웨어공학','컴퓨터공학부','한익주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','소프트웨어공학','컴퓨터공학부','박정민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','소프트웨어공학','컴퓨터공학부','이영남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','마이크로프로세서응용','컴퓨터공학부','이창우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','마이크로프로세서응용','컴퓨터공학부','최진구', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','네트워크프로그래밍','컴퓨터공학부','이보경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','네트워크프로그래밍','컴퓨터공학부','정의훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','네트워크프로그래밍','컴퓨터공학부','김명준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','모바일멀티미디어프로그래밍','컴퓨터공학부','나보균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','모바일멀티미디어프로그래밍','컴퓨터공학부','이상호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','모바일멀티미디어프로그래밍','컴퓨터공학부','노영주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','모바일프로그래밍','컴퓨터공학부','정의훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','소프트웨어보안','컴퓨터공학부','한경숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','빅데이터','컴퓨터공학부','이정준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','공기석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','김영곤', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','나보균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','노영주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','박정민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','방영철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','배유석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','서대영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','이보경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','이상호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','이정준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','전광일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','정성택', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','정의훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','최진구', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','한경숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','컴퓨터공학부','한익주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계2','컴퓨터공학부','지도교수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','수치해석','컴퓨터공학부','전영민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','엔터프라이즈컴퓨팅','컴퓨터공학부','한익주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','엔터프라이즈컴퓨팅','컴퓨터공학부','노영주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','엔터프라이즈컴퓨팅','컴퓨터공학부','이영남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','네트워크매니지먼트','컴퓨터공학부','정의훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','네트워크매니지먼트','컴퓨터공학부','이보경', 10);


-- 게임공학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','게임학기초','게임공학부','손기훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전공입문','게임공학부','장지웅', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전공입문','게임공학부','이대현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','스토리텔링','게임공학부','손기훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C프로그래밍','게임공학부','오황석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C프로그래밍','게임공학부','김경철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C프로그래밍','게임공학부','문혜경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C프로그래밍','게임공학부','이형구', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','자료구조','게임공학부','장지웅', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','자료구조','게임공학부','이형구', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','자료구조','게임공학부','오황석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터구조','게임공학부','주영배', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','윈도우프로그래밍','게임공학부','송인희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','3D모델링1','게임공학부','김현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','융합게임설계및제작1','게임공학부','이용희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','C++프로그래밍','게임공학부','윤정현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','게임개발론','게임공학부','손기훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','네트워크 기초','게임공학부','김재경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','네트워크 기초','게임공학부','고병수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','3D게임프로그래밍1','게임공학부','이용희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','스크립트언어','게임공학부','이재영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','STL','게임공학부','윤정현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','게임인터페이스설계','게임공학부','노병남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','3D애니메이션1','게임공학부','이현기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','게임설계1','게임공학부','김태환', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','게임엔진1','게임공학부','이용희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','모바일프로그래밍1','게임공학부','???', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','게임서버프로그래밍','게임공학부','김경철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','스마트폰게임프로그래밍','게임공학부','김영식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','스마트폰게임프로그래밍','게임공학부','오황석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','게임엔진프로그래밍','게임공학부','이대현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','이재영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','김경철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','송인희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','윤정현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','장지웅', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','이형구', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','이용희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','김재경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','오황석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','김영식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','이대현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계2','게임공학부','이대현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','이재영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','김재경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','게임공학부','윤정현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전공특강','게임공학부','김영식', 10);


-- 신소재공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신소재공학개론1','신소재공학과','강찬형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신소재공학개론1','신소재공학과','이성의', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리화학','신소재공학과','김경민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신소재공학개론2','신소재공학과','이희균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','세라믹공학','신소재공학과','최우석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신소재공학실험','신소재공학과','정걸채', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','재료조직학','신소재공학과','정걸채', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','철강재료공학','신소재공학과','구명회', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','철강재료공학','신소재공학과','정용석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','비철금속재료학','신소재공학과','한요섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','상변태론','신소재공학과','이희균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','반도체재료공학','신소재공학과','최진성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디스플레이소자공학','신소재공학과','고재준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디스플레이소자공학','신소재공학과','이성의', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','플라즈마공학','신소재공학과','문제도', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리야금실험','신소재공학과','???', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신소재 시험 및 평가','신소재공학과','박현균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신소재기기분석','신소재공학과','임실묵', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(기능성 표시소자)','신소재공학과','이성의', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(신금속 제조공학)','신소재공학과','박현균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(고기능성박막)','신소재공학과','강찬형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','합금설계','신소재공학과','???', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','PCB공학 및 실습','신소재공학과','조진기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','철강제조공정','신소재공학과','허완욱', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','철강제조공정','신소재공학과','구명회', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','재료손상분석','신소재공학과','구명회', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','재료손상분석','신소재공학과','정걸채', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전지재료','신소재공학과','강찬형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','신소재공학과','조진기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','신소재공학과','정걸채', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','신소재공학과','임실묵', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','신소재공학과','박현균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','신소재공학과','이희균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','신소재공학과','강찬형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','신소재공학과','이성의', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','신소재공학과','정용석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계2','신소재공학과','조진기', 10);


-- 생명화학공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반생물학','생명화학공학과','이준경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반생물학','생명화학공학과','신흥섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','확률 및 통계','생명화학공학과','서만철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유기화학1','생명화학공학과','정혜진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유기화학1','생명화학공학과','한신호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유유체유동','생명화학공학과','김승언', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리화학','생명화학공학과','조영상', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','유기화학실험','생명화학공학과','차윤종', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','응용미생물학','생명화학공학과','김정근', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','응용미생물학실험','생명화학공학과','김정근', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공정제어','생명화학공학과','류지헌', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기기분석및실습','생명화학공학과','신흥섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전기화학및실습','생명화학공학과','이규남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','식품화학','생명화학공학과','임재각', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','생화학','생명화학공학과','이강문', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','고분자','생명화학공학과','박승준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(전기화학적에너지저장)','생명화학공학과','류지헌', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','분리 및 정제공정','생명화학공학과','김승언', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','환경공학실습','생명화학공학과','이규남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','환경공학실습','생명화학공학과','박희재', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','생물공학 및 실습','생명화학공학과','김미선', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','생명화학공학과','김덕현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','생명화학공학과','한신호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','생명화학공학과','서만철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','생명화학공학과','김정근', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','생명화학공학과','임재각', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','생명화학공학과','이강문', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','생명화학공학과','박승준', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','생명화학공학과','신흥섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','생명화학공학과','조영상', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계2','생명화학공학과','조영상', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','화장품공학및실습','생명화학공학과','서만철', 10);


-- 디자인학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','한국역사와 문화','디자인학부','서영희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','한국역사와 문화','디자인학부','오제연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','한국역사와 문화','디자인학부','정진숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인론','디자인학부','신상영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인론','디자인학부','홍성수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인론','디자인학부','김억', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','2D조형','디자인학부','박노섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','2D그래픽스','디자인학부','강은정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초드로잉','디자인학부','전진용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초드로잉','디자인학부','박희면', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인문화리서치','디자인학부','권오재', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컬러플래닝','디자인학부','제나나', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컬러플래닝','디자인학부','이상희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인발상기법2','디자인학부','박노섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','조형심리학','디자인학부','윤지원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터그래픽스2','디자인학부','고영미', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초제품디자인','디자인학부','장영주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초제품디자인','디자인학부','구기설', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초제품디자인','디자인학부','강민성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초제품디자인','디자인학부','박노섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제품3D설계기초','디자인학부','정동원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제품3D설계기초','디자인학부','강용원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컨셉디자인발상','디자인학부','박노섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','조형연구','디자인학부','이진승', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','서비스디자인방법론','디자인학부','김억', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','행동유도디자인','디자인학부','강아영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','3D컴퓨터모델링','디자인학부','강은정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제품디자인실무','디자인학부','신상영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제품디자인실무','디자인학부','구기설', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제품디자인실무','디자인학부','장영주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인기획','디자인학부','박희면', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인영어','디자인학부','박수용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털정보디자인1','디자인학부','권오재', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','지속가능디자인','디자인학부','장영주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제품3D설계실무','디자인학부','정동원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프레젠테이션연구','디자인학부','민경택', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인공학기초','디자인학부','홍성수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','해석공학디자인','디자인학부','한민섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초시뮬레이션','디자인학부','백성실', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','서비스디자인기획','디자인학부','김억', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미디어융합디자인','디자인학부','강아영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','4D시뮬레이션디자인','디자인학부','강은정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','인터페이스디자인','디자인학부','권오재', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털컨텐츠디자인','디자인학부','강은정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털컨텐츠디자인','디자인학부','류제성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','캡스톤디자인1','디자인학부','신상영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','캡스톤디자인1','디자인학부','장영주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','캡스톤디자인1','디자인학부','홍성수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','캡스톤디자인1','디자인학부','구기설', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','캡스톤디자인1','디자인학부','김억', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','캡스톤디자인1','디자인학부','권오재', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','캡스톤디자인2','디자인학부','지도교수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인마케팅','디자인학부','전명섭', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디자인마케팅','디자인학부','윤지원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','감성디자인','디자인학부','전진용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','감성디자인','디자인학부','이진승', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터시뮬레이션','디자인학부','우정환', 10);


-- 경영학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영수학1','경영학부','장정환', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영수학1','경영학부','최숙자', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영학원론','경영학부','류옥현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영학원론','경영학부','이광숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영학원론','경영학부','백낙기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영학원론','경영학부','김성수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','회계원리','경영학부','안동희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','문제해결과프로그래밍','경영학부','박주철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍기초','경영학부','이충석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로그래밍기초','경영학부','김덕은', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영통계학','경영학부','서종현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영통계학','경영학부','염난영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','마케팅관리','경영학부','염난영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','마케팅관리','경영학부','전유현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','마케팅관리','경영학부','이재광', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','웹프로그래밍기초','경영학부','박주철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','웹프로그래밍기초','경영학부','이영곤', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','웹프로그래밍기초','경영학부','정동민', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','시스템분석설계','경영학부','공재근', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','시스템분석설계','경영학부','정세현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','시스템분석설계','경영학부','임홍순', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','문제해결과프로그래밍','경영학부','공재근', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','조직행동론','경영학부','류석종', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','조직행동론','경영학부','백낙기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','관리회계실무','경영학부','이광숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','관리회계실무','경영학부','안동희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','재무관리','경영학부','고혁진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','재무관리','경영학부','류석종', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH융합(스마트환경하의 창업과 기술경영/MOT)','경영학부','김용범', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','데이터베이스설계','경영학부','이충석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','SW 프레임워크','경영학부','김병곤', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','모바일서비스디자인','경영학부','이영곤', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','비즈니스영어1','경영학부','이금희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물류관리','경영학부','류옥현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','ERP회계','경영학부','지경숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영환경 및 산업분석','경영학부','노성호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기업데이터분석','경영학부','임홍순', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','B2B 마케팅실무','경영학부','황순귀', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기업정책/제도','경영학부','노성호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영혁신방법론','경영학부','이재광', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프로젝트관리','경영학부','김성수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','클라우드서비스관리','경영학부','장진영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','노성호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','류옥현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','이재광', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','이충석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','이영곤', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','서종현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','안동희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','고혁진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','백낙기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','이광숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)1','경영학부','김성수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영캡스톤디자인(졸업연구)2','경영학부','이광숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영전략론','경영학부','김영록', 10);


-- 나노-광공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','나노광공학개론1','나노-광공학과','송용원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','나노광공학개론1','나노-광공학과','박병우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','나노광공학개론1','나노-광공학과','안승언', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자기학','나노-광공학과','안승언', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자기학','나노-광공학과','이덕희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기하광학','나노-광공학과','민해식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','광학실험','나노-광공학과','박상배', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','광기구설계제도','나노-광공학과','장요환', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','광기구설계제도','나노-광공학과','김영일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','광부품가공학','나노-광공학과','유경선', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','나노재료공학','나노-광공학과','박병우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH융합(미래융합전략)','나노-광공학과','송용원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','광학계설계','나노-광공학과','정미숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','초정밀가공','나노-광공학과','유경선', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','광계측공학','나노-광공학과','서정철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','나노반도체공학','나노-광공학과','신종언', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','반도체공정','나노-광공학과','김창규', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','반도체실험','나노-광공학과','장종진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','박막실습','나노-광공학과','황상호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','EH전공(KINECT를 이용한 3차원 입체영상 처리)','나노-광공학과','김영일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','레이저공학','나노-광공학과','이덕희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','태양광공학','나노-광공학과','김경국', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','품질공학','나노-광공학과','신용균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','조명공학','나노-광공학과','이덕희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','LED공학','나노-광공학과','이성남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','광전소자실험','나노-광공학과','이성남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','나노-광공학과','현동훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','나노-광공학과','김영일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','나노-광공학과','송용원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','나노-광공학과','정미숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','나노-광공학과','서정철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','나노-광공학과','이성남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','나노-광공학과','김경국', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','나노-광공학과','김창규', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계2','나노-광공학과','이성남', 10);


-- 에너지·전기공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','창의적 공학설계','에너지·전기공학과','이동건', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전기에너지개론','에너지·전기공학과','홍계원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전기에너지개론','에너지·전기공학과','김성수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터프로그래밍 및 실습','에너지·전기공학과','조철주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터프로그래밍 및 실습','에너지·전기공학과','임관수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전기전자회로실습1','에너지·전기공학과','송길호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','논리회로 및 실습','에너지·전기공학과','이경수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','논리회로 및 실습','에너지·전기공학과','조철주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','회로이론1','에너지·전기공학과','김우석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자기학1','에너지·전기공학과','최경달', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신재생에너지실습1','에너지·전기공학과','장홍순', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전자회로','에너지·전기공학과','송길호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','제어공학1','에너지·전기공학과','임계영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전기기기','에너지·전기공학과','최경달', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신재생에너지시스템실습','에너지·전기공학과','이경수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','에너지전기재료2','에너지·전기공학과','홍계원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','풍력시스템','에너지·전기공학과','김태균', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','전력시스템실습','에너지·전기공학과','김성수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','트리즈연구기법','에너지·전기공학과','유인규', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','신호 및 시스템','에너지·전기공학과','김승남', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기후변화와 에너지환경','에너지·전기공학과','강승진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기후변화와 에너지환경','에너지·전기공학과','전대천', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','에너지·전기공학과','홍계원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','에너지·전기공학과','임계영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','에너지·전기공학과','최경달', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','에너지·전기공학과','김성수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','에너지·전기공학과','장홍순', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','에너지·전기공학과','이동건', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','에너지·전기공학과','김우석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','에너지·전기공학과','이경수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','종합설계1','에너지·전기공학과','이동건', 10);


-- 지식융합학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','이규용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','로렌 윙거트', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','클락 스튜어트', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','다냐 존스', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','컬럼 루웬', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','알렉샌더 그레벳', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','제이슨 알렌', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','윌리엄 스미스', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','스티븐 무어', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','덴 시우라', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','피터 김', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','캐슬린 머피', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','이교선', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','김은수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 잉글리쉬','지식융합학부','김미용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기술지식과 공공정책','지식융합학부','신승근', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','한국경제론','지식융합학부','박상철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초중국어','지식융합학부','이승신', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','말하기','지식융합학부','최재선', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','말하기','지식융합학부','강신주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','실용한문','지식융합학부','박현숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','한국역사와 문화','지식융합학부','오제연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','한국역사와 문화','지식융합학부','정진숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','동아시아사','지식융합학부','문미정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','동아시아사','지식융합학부','허지예', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','과학기술과 윤리','지식융합학부','변학문', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','지식재산권과 특허관리','지식융합학부','양태열', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','지식재산권과 특허관리','지식융합학부','장인석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기술지식과 공공정책','지식융합학부','고용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영학의 이해','지식융합학부','오일근', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','경영학의 이해','지식융합학부','이병윤', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','인간행동과 사회환경','지식융합학부','최보라', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','인간행동과 사회환경','지식융합학부','정선아', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','리더와 리더십','지식융합학부','원경림', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','디지털시대의 미디어아트','지식융합학부','주하영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글로벌 기후변화와 에너지 문제','지식융합학부','강승진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','세계속의 한국','지식융합학부','박준형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','스포츠 클라이밍','지식융합학부','양재봉', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','실용영어','지식융합학부','이정현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','실용영어','지식융합학부','박우영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','영어청취와 발음연습','지식융합학부','지난영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','영어청취와 발음연습','지식융합학부','김소연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','철학개론','지식융합학부','윤삼석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','골프','지식융합학부','김석기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','골프','지식융합학부','김지혁', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학생활과 진로','지식융합학부','초청강사', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','환경관리론','지식융합학부','김기범', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공학과 마케팅','지식융합학부','박혜정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공학과 마케팅','지식융합학부','백민자', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','음악의 이해','지식융합학부','임창배', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','음악의 이해','지식융합학부','조연신', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','음악의 이해','지식융합학부','황순학', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','스포츠와 문화','지식융합학부','김석기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','스포츠와 문화','지식융합학부','이강우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','사진이론과 실습','지식융합학부','김영석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','현대사회와 패션','지식융합학부','김진희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미술의 이해','지식융합학부','김미정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공학과 경제','지식융합학부','박성택', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','한국경제론','지식융합학부','이동헌', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','고용과법률','지식융합학부','이상희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','고용과법률','지식융합학부','강현주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기초일본어','지식융합학부','조미경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','시사영어','지식융합학부','조영미', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','문학과 인간의 이해','지식융합학부','이병순', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','한국근현대사','지식융합학부','오제연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','한국근현대사','지식융합학부','정진숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','사회학','지식융합학부','박한경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','인간관계의 심리학','지식융합학부','안혜정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','인간관계의 심리학','지식융합학부','김미숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','생활과 법률','지식융합학부','김근철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','축구','지식융합학부','이강우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','축구','지식융합학부','김석기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','농구','지식융합학부','김석기', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','농구','지식융합학부','이강우', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','생활스포츠','지식융합학부','이서연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','생활스포츠','지식융합학부','백선아', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','문화콘텐츠 입문','지식융합학부','조택희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','(sdu)직업생활과 바른 글쓰기','지식융합학부','지정교수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','(sdu)디지털시대의 건축이야기','지식융합학부','지정교수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','인증영어','지식융합학부','김소연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','인증영어','지식융합학부','박우영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','기업가정신과기업윤리','지식융합학부','전혜진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','교육학개론','지식융합학부','윤순경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','비즈니스영작문','지식융합학부','이수길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','외국인을 위한 한국현대사회의 이해','지식융합학부','박준형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','영어1','지식융합학부','김문숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','영어1','지식융합학부','강문애', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','영어1','지식융합학부','이정현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','영어1','지식융합학부','이수길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','영어1','지식융합학부','한현숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','영어1','지식융합학부','김소연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','영어1','지식융합학부','조영미', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','고급영어1','지식융합학부','이수길', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','고급영어1','지식융합학부','한현숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','고급영어1','지식융합학부','강문애', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','고급영어1','지식융합학부','김문숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','고급영어1','지식융합학부','조영미', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학영어1','지식융합학부','박우영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학영어1','지식융합학부','허숙', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학영어1','지식융합학부','지난영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학영어1','지식융합학부','정에스더', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학영어1','지식융합학부','류경호', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글쓰기','지식융합학부','강신주', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글쓰기','지식융합학부','유정일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글쓰기','지식융합학부','송경란', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글쓰기','지식융합학부','이병순', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글쓰기','지식융합학부','김경완', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글쓰기','지식융합학부','구번일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글쓰기','지식융합학부','김윤정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글쓰기','지식융합학부','최재선', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','글쓰기','지식융합학부','장미영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','변희영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','박혜형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','한광희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','김기택', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','강우석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','이영수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','심호진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','박경원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','강창현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','김미래', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','미적분학1','지식융합학부','이형용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반화학1','지식융합학부','심재철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반화학1','지식융합학부','박종현', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반화학1','지식융합학부','송수석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반화학1','지식융합학부','김호진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반화학실험1','지식융합학부','장석용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반화학실험1','지식융합학부','김호진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반화학실험1','지식융합학부','심재철', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반물리학1','지식융합학부','김형식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반물리학1','지식융합학부','송호식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반물리학1','지식융합학부','이규용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반물리학1','지식융합학부','신동훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반물리학1','지식융합학부','유순유', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반물리학1','지식융합학부','김남화', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반물리학1','지식융합학부','류영선', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','김형식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','송호식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','유순유', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','용남식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','김남화', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','정부성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','신동훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','류영선', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','정부성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','물리학실험1','지식융합학부','유병수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학물리학1','지식융합학부','류영선', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학물리학1','지식융합학부','유병수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학물리학1','지식융합학부','이규용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학물리학1','지식융합학부','정부성', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','대학물리학1','지식융합학부','용남식', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프레시맨세미나','지식융합학부','이규용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프레시맨세미나','지식융합학부','서영희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프레시맨세미나','지식융합학부','유병수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프레시맨세미나','지식융합학부','박혜정', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','프레시맨세미나','지식융합학부','김미래', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업수학1','지식융합학부','박경원', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업수학1','지식융합학부','이영수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업수학1','지식융합학부','최종배', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업수학1','지식융합학부','김영일', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업수학1','지식융합학부','한광희', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업수학1','지식융합학부','금교은', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업수학1','지식융합학부','장정환', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업수학1','지식융합학부','김기택', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','공업수학1','지식융합학부','이형용', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','수학1','지식융합학부','강창헌', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','수학1','지식융합학부','최숙자', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','수학1','지식융합학부','이영수', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','수학1','지식융합학부','심호진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','수학1','지식융합학부','최종배', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','수학1','지식융합학부','변희영', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터활용','지식융합학부','최우진', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터활용','지식융합학부','정재훈', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터활용','지식융합학부','신성욱', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','컴퓨터활용','지식융합학부','박수연', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','선형대수학','지식융합학부','배유석', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','선형대수학','지식융합학부','최숙자', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','선형대수학','지식융합학부','박혜형', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반생물학','지식융합학부','이준경', 10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES ('admin','일반생물학','지식융합학부','신흥섭', 10);

USE tobbyland;

--
-- tendency table data
--

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('독고다이형');

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('토론형');

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('실습형');

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('텀프로젝트');

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('팀플레이');

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('개인과제');

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('서술형');

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('혼합형');

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('오픈북');

INSERT INTO TENDENCY (TENDENCY_TITLE)
VALUES ('실습');


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

INSERT INTO MEMBER (user_id, password, nickname, email, answer, method, task, exam, enabled)
VALUES ('admin','$2a$10$sp5fhJ6mjqapitptq.mzxehukY.2.6WLsZ1M4fpGgtr9L/8oI7vwe','운영자','babsang24@hanmail.net','보라',1,4,7,1);


--
-- member_roles table data
--

INSERT INTO MEMBER_ROLE (member_id, ROLE)
VALUES (1,'ROLE_ADMIN');

INSERT INTO MEMBER_ROLE (member_id, ROLE)
VALUES (1,'ROLE_USER');


--
-- department table data
--

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('기계공학과', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('기계설계공학과', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('메카트로닉스공학과', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('전자공학부', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('컴퓨터공학부', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('게임공학부', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('신소재공학과', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('생명화학공학과', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('디자인학부', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('경영학부', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('나노-광공학과', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('에너지·전기공학과', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('지식융합학부', 'dept');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('사이트공지사항', 'notice');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('학교 공지사항', 'notice');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('익명게시판', 'etc');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('일기장', 'etc');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('중고장터', 'etc');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('복덕방', 'etc');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('소비자포럼', 'etc');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('스터디', 'etc');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('과목교환', 'etc');

INSERT INTO DEPARTMENT (department_name, kind)
VALUES ('취업상담', 'etc');


--
-- department table data
--

INSERT INTO SEMESTER (SEMESTER_TITLE)
VALUES ('벙커 데이터');

INSERT INTO SEMESTER (SEMESTER_TITLE)
VALUES ('13-1학기');

INSERT INTO SEMESTER (SEMESTER_TITLE)
VALUES ('13-2학기');

INSERT INTO SEMESTER (SEMESTER_TITLE)
VALUES ('14-1학기');

INSERT INTO SEMESTER (SEMESTER_TITLE)
VALUES ('14-2학기');

INSERT INTO SEMESTER (SEMESTER_TITLE)
VALUES ('15-1학기');

INSERT INTO SEMESTER (SEMESTER_TITLE)
VALUES ('15-2학기');


--
-- lecture table data
--

--  기계공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'정역학',1,'박승철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터프로그래밍기초',1,'김인태',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터프로그래밍기초',1,'정찬우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계제작실습',1,'김덕기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료역학1',1,'이종길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열역학1',1,'한진호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'2D CAD도면기초',1,'김찬우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'2D CAD도면기초',1,'홍미경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'동역학',1,'홍미경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열전달',1,'이응호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열전달',1,'김택영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생산자동화',1,'윤원수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유체역학2',1,'김택영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유체역학2',1,'이응호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료실험',1,'이진교',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계요소설계',1,'이종항',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계요소설계',1,'이진교',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D CAD',1,'심진형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열유체실험',1,'이응호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'냉동공학',1,'박승철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'냉동공학',1,'김주형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노공학',1,'조언정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'정밀가공',1,'박철우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'CAE해석과 설계',1,'이종길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'김경엽',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'김택영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'박승철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'박철우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'서진성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'유택인',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'윤원수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'이종길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'심진형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'조언정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'한진호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',1,'이종항',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계2',1,'지도교수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'플랜트공학',1,'김경엽',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계시스템제어',1,'윤원수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'혁신공학설계 및 트리즈',1,'박영수',10);


-- 기계설계공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계설계학개론',2,'이경원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계설계학개론',2,'신형철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'도면작성 및 2D CAD',2,'양해정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'도면작성 및 2D CAD',2,'이선후',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍',2,'손병희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업화학1',2,'김미래',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업화학1',2,'이형용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초전기전자실습',2,'황달연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계공학실험',2,'이택성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터응용계측실습',2,'강병훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료역학1',2,'이재학',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료역학1',2,'최원석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계재료 및 제작법',2,'장태익',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(진동계측 및 기계진단)',2,'신형철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(반도체 장비 시스템 설계 실무)',2,'강병훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'측정실습',2,'조용호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'동역학',2,'이경원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유한요소법',2,'이택성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열역학 및 열전달',2,'장태익',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자동제어',2,'황달연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'심화 3D CAD',2,'김창식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'PLC유공압실습',2,'조용호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프레스DIE설계',2,'김욱배',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(치공구 설계 실무)',2,'서정환',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D CAM',2,'정찬웅',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노공학',2,'김광',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계시스템응용설계',2,'신형철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',2,'강병훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',2,'김광',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',2,'김욱배',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',2,'신형철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',2,'양해정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',2,'이경원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',2,'이택성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',2,'이재학',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',2,'황달연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계2',2,'지도교수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'금형CAE',2,'최승일',10);


-- 메카트로닉스공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'메카트로닉스 입문',3,'주형길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계공작법',3,'신문균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적공학설계',3,'차동혁',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기회로1',3,'김영중',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기회로2',3,'황상연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업역학',3,'남대훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자회로실험',3,'이경재',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자회로실험',3,'임관수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자회로',3,'장두원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍1',3,'이석원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍1',3,'한진현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제어공학',3,'정명진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제어공학',3,'김기현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'센서',3,'강대진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'센서',3,'임상성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로컴퓨터구조',3,'남윤석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'비주얼프로그래밍',3,'허헌',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'비주얼프로그래밍',3,'한진현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'현장실습기획',3,'주형길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'동역학',3,'이원봉',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'서보전동기1',3,'주형길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'머신비젼',3,'정부영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제어기설계',3,'이양희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'시스템설계',3,'차동혁',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'시스템설계',3,'심재홍',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'시스템설계',3,'홍준기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'강대진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'김영중',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'남대훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'남윤석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'심재홍',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'이석원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'이양희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'정명진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'주형길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'차동혁',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',3,'허헌',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계2',3,'지도교수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'지능로봇',3,'박영제',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(제어기를 적용한 정밀모션제어)',3,'황상연',10);


-- 전자공학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적 공학설계',4,'설봉환',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍언어(1학년)',4,'김수민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍언어(1학년)',4,'김문철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍언어(1학년)',4,'박진성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍언어(2학년)',4,'김수민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍언어(2학년)',4,'김석우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털공학및실습',4,'신수현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털공학및실습',4,'남충모',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털공학및실습',4,'윤종호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털공학및실습',4,'김성용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자회로 및 실습1',4,'최웅세',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자회로 및 실습1',4,'박상규',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자회로 및 실습1',4,'박상규',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회로이론1',4,'정두희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회로이론1',4,'박상규',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회로이론1',4,'정계택',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'Visual C++',4,'윤완오',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'Visual C++',4,'유길현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'윈도우 프로그래밍',4,'유길현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신호 및 시스템',4,'한진수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신호 및 시스템',4,'김승남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'VHDL 및 실습',4,'최종성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'VHDL 및 실습',4,'윤호근',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'Professional Practice Seminar',4,'이유진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'정보통신네트워크기초',4,'이제호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'정보통신네트워크기초',4,'전철항',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털통신1',4,'김정곤',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털통신1',4,'이종락',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털통신1',4,'류영권',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로프로세서1',4,'김완중',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로프로세서1',4,'송창헌',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로프로세서1',4,'엄수홍',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적IT소프트웨어',4,'김평수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'반도체공학',4,'정인호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'반도체공학',4,'남충모',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털신호처리',4,'김준수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조 및 알고리즘',4,'김평수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'IT융합개론',4,'손대일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(이동로봇제어)',4,'이응혁',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'초고속통신망',4,'이재명',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'이동통신공학',4,'최성연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'이동통신공학',4,'김광훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'임베디드시스템SW',4,'박진성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'멀티미디어프로그래밍실습',4,'김문철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'최웅세',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'최성연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'최정훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'한진수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'이응혁',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'김정곤',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'남충모',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'이재명',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'이제호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'김응태',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'정두희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'김평수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'정인호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'김문철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'김준수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',4,'김수민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계2',4,'지도교수',10);


-- 컴퓨터공학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전산학기초',5,'나보균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전산학기초',5,'이정준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전산학기초',5,'김경엽',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전산학기초',5,'장창기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전산학기초',5,'공기석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'소셜미디어',5,'김은주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반생물학',5,'이준경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유닉스기초',5,'전광일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유닉스기초',5,'이영남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유닉스기초',5,'김명준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유닉스기초',5,'허훈식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'이산수학',5,'방영철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'이산수학',5,'서대영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'이상호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'나보균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'서대영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'박정민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',5,'공기석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',5,'방영철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',5,'박정민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',5,'이정준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'객체지향언어',5,'노영주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'객체지향언어',5,'이상호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'객체지향언어',5,'한웅진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'객체지향언어',5,'허훈식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'논리회로',5,'정성택',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'논리회로',5,'김명준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'논리회로',5,'김경엽',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'웹프로그래밍기초',5,'한경숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(스마트앱 설계 및 응용)',5,'전광일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(ARM Cortex-M3) 시스템 프로그래밍',5,'최진구',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'운영체제',5,'전광일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'운영체제',5,'이창우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'운영체제',5,'강동현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'운영체제',5,'허훈식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'운영체제',5,'공기석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털신호처리',5,'배유석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털신호처리',5,'정성택',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'소프트웨어공학',5,'한익주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'소프트웨어공학',5,'박정민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'소프트웨어공학',5,'이영남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로프로세서응용',5,'이창우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로프로세서응용',5,'최진구',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'네트워크프로그래밍',5,'이보경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'네트워크프로그래밍',5,'정의훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'네트워크프로그래밍',5,'김명준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'모바일멀티미디어프로그래밍',5,'나보균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'모바일멀티미디어프로그래밍',5,'이상호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'모바일멀티미디어프로그래밍',5,'노영주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'모바일프로그래밍',5,'정의훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'소프트웨어보안',5,'한경숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'빅데이터',5,'이정준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'공기석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'김영곤',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'나보균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'노영주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'박정민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'방영철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'배유석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'서대영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'이보경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'이상호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'이정준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'전광일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'정성택',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'정의훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'최진구',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'한경숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',5,'한익주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계2',5,'지도교수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'수치해석',5,'전영민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'엔터프라이즈컴퓨팅',5,'한익주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'엔터프라이즈컴퓨팅',5,'노영주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'엔터프라이즈컴퓨팅',5,'이영남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'네트워크매니지먼트',5,'정의훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'네트워크매니지먼트',5,'이보경',10);


-- 게임공학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임학기초',6,'손기훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전공입문',6,'장지웅',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전공입문',6,'이대현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'스토리텔링',6,'손기훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍',6,'오황석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍',6,'김경철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍',6,'문혜경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍',6,'이형구',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',6,'장지웅',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',6,'이형구',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',6,'오황석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터구조',6,'주영배',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'윈도우프로그래밍',6,'송인희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D모델링1',6,'김현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'융합게임설계및제작1',6,'이용희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C++프로그래밍',6,'윤정현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임개발론',6,'손기훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'네트워크 기초',6,'김재경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'네트워크 기초',6,'고병수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D게임프로그래밍1',6,'이용희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'스크립트언어',6,'이재영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'STL',6,'윤정현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임인터페이스설계',6,'노병남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D애니메이션1',6,'이현기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임설계1',6,'김태환',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임엔진1',6,'이용희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'모바일프로그래밍1',6,'???',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임서버프로그래밍',6,'김경철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'스마트폰게임프로그래밍',6,'김영식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'스마트폰게임프로그래밍',6,'오황석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임엔진프로그래밍',6,'이대현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'이재영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'김경철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'송인희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'윤정현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'장지웅',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'이형구',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'이용희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'김재경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'오황석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'김영식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'이대현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계2',6,'이대현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'이재영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'김재경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',6,'윤정현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전공특강',6,'김영식',10);


-- 신소재공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신소재공학개론1',7,'강찬형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신소재공학개론1',7,'이성의',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리화학',7,'김경민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신소재공학개론2',7,'이희균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'세라믹공학',7,'최우석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신소재공학실험',7,'정걸채',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료조직학',7,'정걸채',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'철강재료공학',7,'구명회',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'철강재료공학',7,'정용석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'비철금속재료학',7,'한요섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'상변태론',7,'이희균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'반도체재료공학',7,'최진성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디스플레이소자공학',7,'고재준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디스플레이소자공학',7,'이성의',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'플라즈마공학',7,'문제도',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리야금실험',7,'???',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신소재 시험 및 평가',7,'박현균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신소재기기분석',7,'임실묵',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(기능성 표시소자)',7,'이성의',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(신금속 제조공학)',7,'박현균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(고기능성박막)',7,'강찬형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'합금설계',7,'???',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'PCB공학 및 실습',7,'조진기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'철강제조공정',7,'허완욱',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'철강제조공정',7,'구명회',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료손상분석',7,'구명회',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료손상분석',7,'정걸채',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전지재료',7,'강찬형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',7,'조진기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',7,'정걸채',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',7,'임실묵',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',7,'박현균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',7,'이희균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',7,'강찬형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',7,'이성의',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',7,'정용석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계2',7,'조진기',10);


-- 생명화학공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반생물학',8,'이준경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반생물학',8,'신흥섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'확률 및 통계',8,'서만철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유기화학1',8,'정혜진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유기화학1',8,'한신호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유유체유동',8,'김승언',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리화학',8,'조영상',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유기화학실험',8,'차윤종',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'응용미생물학',8,'김정근',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'응용미생물학실험',8,'김정근',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공정제어',8,'류지헌',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기기분석및실습',8,'신흥섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기화학및실습',8,'이규남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'식품화학',8,'임재각',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생화학',8,'이강문',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고분자',8,'박승준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(전기화학적에너지저장)',8,'류지헌',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'분리 및 정제공정',8,'김승언',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'환경공학실습',8,'이규남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'환경공학실습',8,'박희재',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생물공학 및 실습',8,'김미선',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',8,'김덕현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',8,'한신호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',8,'서만철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',8,'김정근',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',8,'임재각',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',8,'이강문',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',8,'박승준',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',8,'신흥섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',8,'조영상',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계2',8,'조영상',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'화장품공학및실습',8,'서만철',10);


-- 디자인학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'한국역사와 문화',9,'서영희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'한국역사와 문화',9,'오제연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'한국역사와 문화',9,'정진숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인론',9,'신상영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인론',9,'홍성수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인론',9,'김억',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'2D조형',9,'박노섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'2D그래픽스',9,'강은정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초드로잉',9,'전진용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초드로잉',9,'박희면',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인문화리서치',9,'권오재',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컬러플래닝',9,'제나나',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컬러플래닝',9,'이상희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인발상기법2',9,'박노섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'조형심리학',9,'윤지원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터그래픽스2',9,'고영미',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초제품디자인',9,'장영주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초제품디자인',9,'구기설',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초제품디자인',9,'강민성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초제품디자인',9,'박노섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품3D설계기초',9,'정동원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품3D설계기초',9,'강용원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컨셉디자인발상',9,'박노섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'조형연구',9,'이진승',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'서비스디자인방법론',9,'김억',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'행동유도디자인',9,'강아영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D컴퓨터모델링',9,'강은정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품디자인실무',9,'신상영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품디자인실무',9,'구기설',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품디자인실무',9,'장영주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인기획',9,'박희면',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인영어',9,'박수용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털정보디자인1',9,'권오재',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'지속가능디자인',9,'장영주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품3D설계실무',9,'정동원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프레젠테이션연구',9,'민경택',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인공학기초',9,'홍성수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'해석공학디자인',9,'한민섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초시뮬레이션',9,'백성실',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'서비스디자인기획',9,'김억',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미디어융합디자인',9,'강아영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'4D시뮬레이션디자인',9,'강은정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인터페이스디자인',9,'권오재',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털컨텐츠디자인',9,'강은정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털컨텐츠디자인',9,'류제성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'캡스톤디자인1',9,'신상영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'캡스톤디자인1',9,'장영주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'캡스톤디자인1',9,'홍성수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'캡스톤디자인1',9,'구기설',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'캡스톤디자인1',9,'김억',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'캡스톤디자인1',9,'권오재',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'캡스톤디자인2',9,'지도교수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인마케팅',9,'전명섭',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인마케팅',9,'윤지원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'감성디자인',9,'전진용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'감성디자인',9,'이진승',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터시뮬레이션',9,'우정환',10);


-- 경영학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영수학1',10,'장정환',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영수학1',10,'최숙자',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영학원론',10,'류옥현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영학원론',10,'이광숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영학원론',10,'백낙기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영학원론',10,'김성수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회계원리',10,'안동희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'문제해결과프로그래밍',10,'박주철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍기초',10,'이충석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍기초',10,'김덕은',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영통계학',10,'서종현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영통계학',10,'염난영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마케팅관리',10,'염난영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마케팅관리',10,'전유현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마케팅관리',10,'이재광',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'웹프로그래밍기초',10,'박주철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'웹프로그래밍기초',10,'이영곤',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'웹프로그래밍기초',10,'정동민',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'시스템분석설계',10,'공재근',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'시스템분석설계',10,'정세현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'시스템분석설계',10,'임홍순',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'문제해결과프로그래밍',10,'공재근',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'조직행동론',10,'류석종',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'조직행동론',10,'백낙기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'관리회계실무',10,'이광숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'관리회계실무',10,'안동희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재무관리',10,'고혁진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재무관리',10,'류석종',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH융합(스마트환경하의 창업과 기술경영/MOT)',10,'김용범',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'데이터베이스설계',10,'이충석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'SW 프레임워크',10,'김병곤',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'모바일서비스디자인',10,'이영곤',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'비즈니스영어1',10,'이금희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물류관리',10,'류옥현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'ERP회계',10,'지경숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영환경 및 산업분석',10,'노성호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기업데이터분석',10,'임홍순',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'B2B 마케팅실무',10,'황순귀',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기업정책/제도',10,'노성호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영혁신방법론',10,'이재광',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로젝트관리',10,'김성수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'클라우드서비스관리',10,'장진영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'노성호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'류옥현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'이재광',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'이충석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'이영곤',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'서종현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'안동희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'고혁진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'백낙기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'이광숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)1',10,'김성수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영캡스톤디자인(졸업연구)2',10,'이광숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영전략론',10,'김영록',10);


-- 나노-광공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노광공학개론1',11,'송용원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노광공학개론1',11,'박병우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노광공학개론1',11,'안승언',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자기학',11,'안승언',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자기학',11,'이덕희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기하광학',11,'민해식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광학실험',11,'박상배',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광기구설계제도',11,'장요환',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광기구설계제도',11,'김영일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광부품가공학',11,'유경선',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노재료공학',11,'박병우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH융합(미래융합전략)',11,'송용원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광학계설계',11,'정미숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'초정밀가공',11,'유경선',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광계측공학',11,'서정철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노반도체공학',11,'신종언',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'반도체공정',11,'김창규',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'반도체실험',11,'장종진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'박막실습',11,'황상호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(KINECT를 이용한 3차원 입체영상 처리)',11,'김영일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'레이저공학',11,'이덕희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'태양광공학',11,'김경국',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'품질공학',11,'신용균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'조명공학',11,'이덕희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'LED공학',11,'이성남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광전소자실험',11,'이성남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',11,'현동훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',11,'김영일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',11,'송용원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',11,'정미숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',11,'서정철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',11,'이성남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',11,'김경국',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',11,'김창규',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계2',11,'이성남',10);


-- 에너지·전기공학과 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적 공학설계',12,'이동건',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기에너지개론',12,'홍계원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기에너지개론',12,'김성수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터프로그래밍 및 실습',12,'조철주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터프로그래밍 및 실습',12,'임관수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기전자회로실습1',12,'송길호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'논리회로 및 실습',12,'이경수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'논리회로 및 실습',12,'조철주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회로이론1',12,'김우석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자기학1',12,'최경달',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신재생에너지실습1',12,'장홍순',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자회로',12,'송길호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제어공학1',12,'임계영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기기기',12,'최경달',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신재생에너지시스템실습',12,'이경수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'에너지전기재료2',12,'홍계원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'풍력시스템',12,'김태균',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전력시스템실습',12,'김성수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'트리즈연구기법',12,'유인규',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신호 및 시스템',12,'김승남',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기후변화와 에너지환경',12,'강승진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기후변화와 에너지환경',12,'전대천',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',12,'홍계원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',12,'임계영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',12,'최경달',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',12,'김성수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',12,'장홍순',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',12,'이동건',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',12,'김우석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',12,'이경수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'종합설계1',12,'이동건',10);


-- 지식융합학부 data

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'이규용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'로렌 윙거트',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'클락 스튜어트',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'다냐 존스',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'컬럼 루웬',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'알렉샌더 그레벳',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'제이슨 알렌',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'윌리엄 스미스',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'스티븐 무어',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'덴 시우라',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'피터 김',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'캐슬린 머피',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'이교선',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'김은수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 잉글리쉬',13,'김미용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기술지식과 공공정책',13,'신승근',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'한국경제론',13,'박상철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초중국어',13,'이승신',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'말하기',13,'최재선',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'말하기',13,'강신주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'실용한문',13,'박현숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'한국역사와 문화',13,'오제연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'한국역사와 문화',13,'정진숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'동아시아사',13,'문미정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'동아시아사',13,'허지예',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'과학기술과 윤리',13,'변학문',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'지식재산권과 특허관리',13,'양태열',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'지식재산권과 특허관리',13,'장인석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기술지식과 공공정책',13,'고용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영학의 이해',13,'오일근',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영학의 이해',13,'이병윤',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인간행동과 사회환경',13,'최보라',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인간행동과 사회환경',13,'정선아',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'리더와 리더십',13,'원경림',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털시대의 미디어아트',13,'주하영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글로벌 기후변화와 에너지 문제',13,'강승진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'세계속의 한국',13,'박준형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'스포츠 클라이밍',13,'양재봉',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'실용영어',13,'이정현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'실용영어',13,'박우영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어청취와 발음연습',13,'지난영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어청취와 발음연습',13,'김소연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'철학개론',13,'윤삼석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'골프',13,'김석기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'골프',13,'김지혁',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학생활과 진로',13,'초청강사',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'환경관리론',13,'김기범',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공학과 마케팅',13,'박혜정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공학과 마케팅',13,'백민자',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'음악의 이해',13,'임창배',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'음악의 이해',13,'조연신',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'음악의 이해',13,'황순학',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'스포츠와 문화',13,'김석기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'스포츠와 문화',13,'이강우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'사진이론과 실습',13,'김영석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'현대사회와 패션',13,'김진희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미술의 이해',13,'김미정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공학과 경제',13,'박성택',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'한국경제론',13,'이동헌',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고용과법률',13,'이상희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고용과법률',13,'강현주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초일본어',13,'조미경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'시사영어',13,'조영미',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'문학과 인간의 이해',13,'이병순',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'한국근현대사',13,'오제연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'한국근현대사',13,'정진숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'사회학',13,'박한경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인간관계의 심리학',13,'안혜정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인간관계의 심리학',13,'김미숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생활과 법률',13,'김근철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'축구',13,'이강우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'축구',13,'김석기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'농구',13,'김석기',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'농구',13,'이강우',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생활스포츠',13,'이서연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생활스포츠',13,'백선아',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'문화콘텐츠 입문',13,'조택희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'(sdu)직업생활과 바른 글쓰기',13,'지정교수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'(sdu)디지털시대의 건축이야기',13,'지정교수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인증영어',13,'김소연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인증영어',13,'박우영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기업가정신과기업윤리',13,'전혜진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'교육학개론',13,'윤순경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'비즈니스영작문',13,'이수길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'외국인을 위한 한국현대사회의 이해',13,'박준형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어1',13,'김문숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어1',13,'강문애',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어1',13,'이정현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어1',13,'이수길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어1',13,'한현숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어1',13,'김소연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어1',13,'조영미',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급영어1',13,'이수길',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급영어1',13,'한현숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급영어1',13,'강문애',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급영어1',13,'김문숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급영어1',13,'조영미',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어1',13,'박우영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어1',13,'허숙',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어1',13,'지난영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어1',13,'정에스더',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어1',13,'류경호',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글쓰기',13,'강신주',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글쓰기',13,'유정일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글쓰기',13,'송경란',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글쓰기',13,'이병순',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글쓰기',13,'김경완',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글쓰기',13,'구번일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글쓰기',13,'김윤정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글쓰기',13,'최재선',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'글쓰기',13,'장미영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'변희영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'박혜형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'한광희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'김기택',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'강우석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'이영수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'심호진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'박경원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'강창현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'김미래',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학1',13,'이형용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학1',13,'심재철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학1',13,'박종현',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학1',13,'송수석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학1',13,'김호진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학실험1',13,'장석용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학실험1',13,'김호진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학실험1',13,'심재철',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학1',13,'김형식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학1',13,'송호식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학1',13,'이규용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학1',13,'신동훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학1',13,'유순유',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학1',13,'김남화',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학1',13,'류영선',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'김형식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'송호식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'유순유',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'용남식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'김남화',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'정부성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'신동훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'류영선',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'정부성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험1',13,'유병수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학물리학1',13,'류영선',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학물리학1',13,'유병수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학물리학1',13,'이규용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학물리학1',13,'정부성',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학물리학1',13,'용남식',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프레시맨세미나',13,'이규용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프레시맨세미나',13,'서영희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프레시맨세미나',13,'유병수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프레시맨세미나',13,'박혜정',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프레시맨세미나',13,'김미래',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학1',13,'박경원',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학1',13,'이영수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학1',13,'최종배',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학1',13,'김영일',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학1',13,'한광희',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학1',13,'금교은',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학1',13,'장정환',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학1',13,'김기택',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학1',13,'이형용',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'수학1',13,'강창헌',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'수학1',13,'최숙자',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'수학1',13,'이영수',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'수학1',13,'심호진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'수학1',13,'최종배',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'수학1',13,'변희영',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터활용',13,'최우진',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터활용',13,'정재훈',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터활용',13,'신성욱',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터활용',13,'박수연',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'선형대수학',13,'배유석',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'선형대수학',13,'최숙자',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'선형대수학',13,'박혜형',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반생물학',13,'이준경',10);

INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반생물학',13,'신흥섭',10);



--2학기

--  기계공학과 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학2',1,'이진교',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'측정공학',1,'박문수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'측정공학',1,'유택인',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의공학설계',1,'조언정',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'Introduction to Modern Physical Science',1,'이규용',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계제작실습',1,'김덕기',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계제작실습',1,'김덕기',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계재료학',1,'박철우',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료역학2',1,'이종길',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열역학2',1,'한진호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유체역학1',1,'김경엽',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'2D CAD실용설계',1,'홍미경',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'2D CAD실용설계',1,'김찬우',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계진동학',1,'서진성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공학전산해석',1,'이강원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료실험',1,'이진교',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D CAD응용설계',1,'심진형',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열유체실험',1,'이응호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'메카트로닉스',1,'윤원수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생산제조공학',1,'이종항',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생산관리',1,'정찬우',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공기조화',1,'박승철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'CFD 응용',1,'이응호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열유체시스템설계',1,'김택영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'TOPICS in　ME',1,'김주형',10);
--  기계설계공학과 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학2',2,'장태익',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(전산 공학해석 및 응용',2,'이택성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(전산 공학해석 및 응용',2,'이택성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기구학 및 해석',2,'이경원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'정역학',2,'이택성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로컨트롤러응용설계',2,'황달연',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유체역학',2,'장태익',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D CAD(Solidworks)',2,'채호석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계제작실습',2,'양해정',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료역학2',2,'이재학',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료역학2',2,'최원석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계요소설계',2,'김욱배',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'플라스틱MOD설계',2,'최재훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'플라스틱MOD설계',2,'김욱배',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적설계',2,'조용호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자제품기구설계',2,'김광',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자제품기구설계',2,'이국환',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계진동학',2,'신형철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D CAD(CATIA)',2,'채호석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'최적설계',2,'강병훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공차설계',2,'서정환',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D CAD(Pro E)',2,'김창식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'품질과 표준',2,'정동호',10);
--  메카트로닉스공학과 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학2',3,'박경원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학2',3,'최종배',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터응용설계',3,'신문균',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기회로1',3,'황상연',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기회로1',3,'김경덕',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기회로2',3,'김영중',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'PLC제어',3,'남대훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료역학',3,'심재홍',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털회로',3,'이양희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털회로실험',3,'허헌',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털회로실험',3,'이양희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털회로실험',3,'남윤석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신호및시스템',3,'허헌',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'시스템제어공학',3,'정명진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'시스템제어공학',3,'김기현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로컴퓨터응용',3,'남윤석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C 프로그래밍2',3,'이석원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C 프로그래밍2',3,'한진현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'계측공학',3,'임상성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기계요소설계',3,'이원봉',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'PC제어응용',3,'이경재',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'서보전동기2',3,'주형길',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제어용통신',3,'차동혁',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의설계기법',3,'유진희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'메카트로닉스시스템',3,'김기현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(로봇을 하용한 시스템설계 및 제어)',3,'황상연',10);
--  전자공학전공 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(디지털방송시스템)',4,'김응태',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(센서활용)',4,'이응혁',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'객체지향언어',4,'최정훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'객체지향언어',4,'이재명',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초전자공학',4,'이종락',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초전자공학',4,'최성연',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기초전자공학',4,'신수현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'Introduction to Modern Electrical and Electronics Engineering',4,'김수민',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'확률및통계학',4,'김수민',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'확률및통계학',4,'전철항',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'확률및통계학',4,'이제호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'선형대수학',4,'김승남',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'선형대수학',4,'이종락',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자기학',4,'남충모',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'통신이론',4,'이제호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'통신이론',4,'한진수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'통신이론',4,'류영권',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'통신이론',4,'이재명',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'통신이론',4,'최성연',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회로이론2',4,'정계택',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회로이론2',4,'박상규',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회로이론2',4,'정두희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자회로 및 실습2',4,'최웅세',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자회로 및 실습2',4,'박상규',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털시스템및실습',4,'엄수홍',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털시스템및실습',4,'윤완오',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털시스템및실습',4,'김성용',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'Professional Practice Seminar',4,'이유진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털통신2',4,'김정곤',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'정보통신프로토콜설계',4,'김양중',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'정보통신프로토콜설계',4,'권선준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로프로세서2',4,'김완중',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로프로세서2',4,'송창헌',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'System on Chip 설계실습',4,'최종성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'System on Chip 설계실습',4,'윤호근',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'RF기초 및 회로설계',4,'정인호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영상신호처리',4,'김문철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영상신호처리',4,'김응태',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'DSP시스템및실습',4,'김수민',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'DSP시스템및실습',4,'김준수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'차세대통신시스템',4,'김광훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'임베디드응용SW',4,'박진성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'차세대디스플레이',4,'김문철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'임베디드 응용프로그래밍',4,'김평수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'임베디드 소프트웨어',4,'김수민',10);
--  컴퓨터공학부 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH융합(공학적난제 해결방안 설계)',5,'전광일',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH융합(공학적난제 해결방안 설계',5,'전광일',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적공학설계',5,'장창기',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적공학설계',5,'이영남',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적공학설계',5,'김명준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'한익주',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'박정민',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'나보균',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'최종필',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'김명준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍',5,'정의훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'Introduction to Modern Computer Science',5,'서대영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',5,'박정민',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',5,'방영철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',5,'나보균',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',5,'이상호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자료구조',5,'노영주',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'확률 및 통계학',5,'정성택',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'확률 및 통계학',5,'배유석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'확률 및 통계학',5,'김경엽',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'확률 및 통계학',5,'최종필',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'웹 프로그래밍',5,'한경숙',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'웹 프로그래밍',5,'정의훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'웹 프로그래밍',5,'허훈식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터구조',5,'김명준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터구조',5,'오세춘',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터구조',5,'최진구',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터구조',5,'최종필',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'클라우드컴퓨팅',5,'이정준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'클라우드컴퓨팅',5,'맹상영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'데이터베이스',5,'이정준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'데이터베이스',5,'이상호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'데이터베이스',5,'김경엽',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'데이터베이스',5,'이창헌',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'정보보안개론',5,'조병철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'알고리즘',5,'서대영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'알고리즘',5,'방영철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'알고리즘',5,'차봉상',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급프로그래밍',5,'공기석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급프로그래밍',5,'나보균',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급프로그래밍',5,'전광일',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'윈도우프로그래밍',5,'허훈식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'윈도우프로그래밍',5,'한웅진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자바',5,'공기석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자바',5,'노영주',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자바',5,'한경숙',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'자바',5,'이상호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'객체지향분석설계',5,'박정민',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'객체지향분석설계',5,'이영남',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'객체지향분석설계',5,'한익주',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영상처리',5,'정성택',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영상처리',5,'배유석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터네트워크',5,'이보경',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터네트워크',5,'정의훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터네트워크',5,'김경엽',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인공지능',5,'배유석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'임베디드시스템',5,'공기석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'임베디드시스템',5,'전광일',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영정보',5,'노영주',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영정보',5,'허훈식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'트리즈기법',5,'이영남',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'트리즈기법',5,'이정준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'네트워크보안',5,'이보경',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'임베디드시스템',5,'이창우',10);
-- 게임공학부 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전산학개론',6,'문혜경',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적공학설계',6,'김경철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임설계기초',6,'김태환',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'운영체제기초',6,'오황석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍',6,'임창주',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍',6,'고병수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C++프로그래밍',6,'이형구',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C++프로그래밍',6,'윤정현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'JAVA프로그래밍',6,'김영식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'그래픽저작도구',6,'이현기',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'이산수학',6,'이용희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'운영체제',6,'오황석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'운영체제',6,'문혜경',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임수학',6,'김영식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'알고리즘',6,'이재영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'알고리즘',6,'천일용',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'2D게임프로그래밍',6,'이대현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터 그래픽스',6,'송인희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D모델링2',6,'김현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'융합게임설계및제작1',6,'손기훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'융합게임설계및제작1',6,'조성혜',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임소프트웨어공학',6,'김상일',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임소프트웨어공학',6,'박진호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임기획',6,'손기훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인공지능',6,'이형구',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'네트워크 게임 프로그래밍',6,'김재경',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D게임프로그래밍2',6,'이용희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'데이터베이스',6,'장지웅',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'융합게임설계및제작2',6,'이용희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'가상현실게임',6,'임창주',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임사운드',6,'배진택',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임설계2',6,'손기훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'게임엔진2',6,'이용희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'모바일프로그래밍2',6,'김영식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D애니메이션2',6,'김현',10);
-- 신소재공학과 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(금속제조공정모사)',7,'박현균',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(리튬이온전지)',7,'강찬형',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신소재공학개론2',7,'강찬형',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신소재공학개론2',7,'이성의',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적 공학설계',7,'신용균',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적 공학설계',7,'이희철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료열역학',7,'구명회',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료강도학',7,'김휘준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료강도학',7,'박현균',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'반응속도공학 및 실습',7,'정용석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자소자재료공학',7,'문제도',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'현대물리',7,'강찬형',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'현대물리',7,'박훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료조직분석',7,'정걸채',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'표면개질공학 및 실습',7,'정걸채',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'분말공정',7,'이희균',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'박막재료공학',7,'임실묵',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'반도체제조공정및실습',7,'최진성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디스플레이 제조공정',7,'고재준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디스플레이 제조공정',7,'이성의',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자세라믹스 및 실습',7,'최우석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'X선회절론및실습',7,'조진기',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로나노시스템',7,'이희철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리야금학',7,'김경민',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'에너지-환경재료',7,'임실묵',10);
-- 생명화학공학과 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학2',8,'조영상',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(진단 생화학)',8,'신흥섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(기능성분말)',8,'조영상',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적 공학설계',8,'송수석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'Introduction to Modern Chemical Science & Biotechnology',8,'신흥섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유기화학2',8,'정혜전',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유기화학2',8,'한신호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'분석화학',8,'서만철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'분석화학',8,'신흥섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'분석화학실험',8,'서만철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'무기화학',8,'류지헌',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생화학실험',8,'신흥섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열 및 물질전달',8,'조영상',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'열 및 물질전달',8,'박승준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'반응공학',8,'최기섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'분자생물학',8,'이강문',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생명화공수치해석',8,'박승준',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'환경공학',8,'길인섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기능성 식품',8,'임재각',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'발효공학',8,'김정근',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'화공양론',8,'임재각',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업화학',8,'김승언',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생명화학공학실습',8,'김승언',10);
-- 디자인학부 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'CAD',9,'정동원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'컴퓨터그래픽스1',9,'고영미',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D조형',9,'전진용',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인방법론',9,'박희면',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인재료및가공',9,'전명섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1, '응용제품디자인',9,'장영주',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생활문화디자인',9,'김경수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생활문화디자인',9,'윤지원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털정보디자인 2',9,'강은정',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인트렌드연구',9,'고영미',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인트렌드연구',9,'전진용',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'유니버셜디자인',9,'신상영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품시스템디자인',9,'장영주',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품시스템디자인',9,'구기설',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디지털사진기법',9,'이원철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품3D설계응용',9,'정동원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인매니지먼트',9,'박희면',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인터페이스디자인',9,'권오재',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인역학',9,'한민섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D그래픽스',9,'이진승',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'CAID',9,'정동원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'구조드로잉',9,'전진용',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인방법전략',9,'홍성수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인간공학디자인',9,'박노섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'응용제품디자인',9,'구기설',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'상세설계디자인',9,'한민섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디자인융합공학',9,'윤상영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'설계디자인실무',9,'한민섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'VR시뮬레이션',9,'백성실',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'3D정보디자인',9,'민경택',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'발상과 표현',9,'강아영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'2D디지털디자인',9,'강은정',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'스케치실무',9,'박노섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품서비스디자인',9,'김억',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'UX디자인개론',9,'권오재',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'콘텐츠융합디자인',9,'강아영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'응용제품디자인',9,'박노섭',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'IT융합디자인실무',9,'류제성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인터랙션디자인',9,'권오재',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공공서비스디자인',9,'김억',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제품3D설계응용',9,'손동섭',10);
-- 경영학부 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH융합(스마트환경하의 창업과 기술경영/MOT)',10,'김용범',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영학원론',10,'김성수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영통계학',10,'서종현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회계원리',10,'류석종',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회계원리',10,'박성화',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회계원리',10,'이광숙',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경제학원론',10,'노성호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경제학원론',10,'김영록',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍응용',10,'이충석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'프로그래밍응용',10,'김덕은',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생성/운영관리',10,'정세현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'생성/운영관리',10,'류옥현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인적자원관리',10,'백낙기',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인적자원관리',10,'류석종',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영정보시스템',10,'정세현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영정보시스템',10,'김성수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'웹프로그래밍응용',10,'박주철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'웹프로그래밍응용',10,'이영곤',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'데이터베이스운영',10,'공재근',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'인터넷마케팅',10,'이재광',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'서버운영관리',10,'강동현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'TRIZ경영',10,'이경원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창업론',10,'고혁진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'무역실무',10,'김용재',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영세미나',10,'이충석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'비즈니스 커뮤니케이션',10,'황순귀',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'지식서비스디자인',10,'이영곤',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'비즈니스영어2',10,'이금희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'무역학원론',10,'김용재',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'무역학원론',10,'이규현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마케팅조사론',10,'염난영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'중급회계',10,'이광숙',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'품질관리실무',10,'서종현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제조프로세스',10,'류옥현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'기술창업실무',10,'고혁진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'국제마케팅',10,'김용재',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'중남미상관습',10,'김용재',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영전략론',10,'백낙기',10);
-- 나노-광공학과 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(첨단박막 기술개발)',11,'송용원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광학물리학',11,'박상배',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍언어실습',11,'한진현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의성공학설계',11,'김영일',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'수리물리',11,'김영일',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'파동광학',11,'이덕희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'초정밀금형설계',11,'유경선',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광전자회로실습',11,'안승언',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노열역학',11,'김경국',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노전자물성론',11,'이성남',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'재료물성학',11,'송용원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광학생산시스템공학',11,'현동훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'박막공학',11,'황상호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광계측실험',11,'서정철',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'나노반도체공학',11,'신종언',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광전자공학',11,'신종언',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제어계측공학',11,'김창규',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광반도체실험',11,'장종진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적연구방법론',11,'유인규',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'창의적연구방법론',11,'송용원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'연구과제수행법',11,'박병우',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'광학계측정평가',11,'현동훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'디스플레이공학',11,'안승언',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'조명광학계설계',11,'정미숙',10);
-- 에너지·전기공학과 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학2',12,'이형용',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'공업수학2',12,'장정환',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(전력에너지저감 기술 및 응용)',12,'이동건',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'EH전공(고효율 초전도 응용기술)',12,'홍계원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신재생에너지개론',12,'이동건',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍',12,'장두원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'C프로그래밍',12,'임관수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전기전자회로실습2',12,'송길호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'회로이론2',12,'김우석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전자기학2',12,'최경달',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'신재생에너지실습2',12,'김철진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'에너지전기재료1',12,'홍계원',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'마이크로프로세서',12,'김경덕',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전력전자',12,'이경수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'에너지변환실습',12,'박상호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전력계통',12,'김성수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'제어공학2',12,'임계영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'태양광시스템',12,'이경수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'전력설비',12,'김우석',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'통신공학',12,'송길호',10);
-- 지식융합학부 data
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'강창헌',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'김기택',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'박혜형',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'변희영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'심호진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'이영수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'이형용',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'조영경',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'최숙자',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'미적분학2',13,'한광희',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학2',13,'강남화',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학2',13,'김형식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학2',13,'송호식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학2',13,'신동훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학2',13,'유순유',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반물리학2',13,'이규용',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험2',13,'김남화',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험2',13,'김형식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험2',13,'류영선',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험2',13,'송호식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험2',13,'신동훈',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험2',13,'용남식',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험2',13,'유병수',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험2',13,'유순유',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'물리학실험2',13,'정부성',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어2',13,'강문애',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어2',13,'김문숙',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어2',13,'김소연',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어2',13,'이수길',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어2',13,'이정현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어2',13,'정에스더',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'영어2',13,'한현숙',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급영어2',13,'한현숙',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급영어2',13,'이수길',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급영어2',13,'김문숙',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'고급영어2',13,'강문애',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어2',13,'남지영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어2',13,'류경호',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어2',13,'박우영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어2',13,'정에스더',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어2',13,'지난영',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'대학영어2',13,'허숙',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학2',13,'박종현',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학2',13,'김호진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'일반화학실험2',13,'김호진',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영수학2',13,'최숙자',10);
INSERT INTO LECTURE (member_id, lecture_name, dept, prof, likes)
VALUES (1,'경영수학2',13,'장정환',10);
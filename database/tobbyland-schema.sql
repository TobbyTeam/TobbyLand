DROP SCHEMA IF EXISTS tobbyland;
CREATE SCHEMA tobbyland;
USE tobbyland;

--
-- Table structure for table `tendency`
--

CREATE TABLE tendency (
  tendency_id tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  tendency_title varchar(10) DEFAULT NULL,
  PRIMARY KEY (tendency_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `member`
--

CREATE TABLE member (
  member_id int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id varchar(20) NOT NULL,
  password varchar(100) DEFAULT NULL,
  nickname varchar(15) DEFAULT NULL,
  email varchar(22) DEFAULT NULL,
  reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  method tinyint(2) UNSIGNED DEFAULT '1',
  task tinyint(2) UNSIGNED DEFAULT '4',
  exam tinyint(2) UNSIGNED DEFAULT '7',
  enabled tinyint(1) UNSIGNED DEFAULT '1',
  nonLocked tinyint(1) UNSIGNED DEFAULT '1',
  evaluation_count smallint(4) UNSIGNED DEFAULT '0',
  eval_date datetime DEFAULT NULL,
  search tinyint(1) UNSIGNED DEFAULT '0',
  PRIMARY KEY (member_id),
  KEY FK_member_method (method),
  KEY FK_member_task (task),
  KEY FK_member_exam (exam),
  CONSTRAINT FK_member_exam FOREIGN KEY (method) REFERENCES tendency (tendency_id),
  CONSTRAINT FK_member_task FOREIGN KEY (task) REFERENCES tendency (tendency_id),
  CONSTRAINT FK_member_method FOREIGN KEY (exam) REFERENCES tendency (tendency_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `role`
--

CREATE TABLE role (
  role varchar(15) NOT NULL,
  role_name varchar(10) NOT NULL,
  PRIMARY KEY (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `member_role`
--

CREATE TABLE member_role (
  member_role_id int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  member_id int(5) UNSIGNED NOT NULL,
  role varchar(15) DEFAULT 'ROLE_USER',
  PRIMARY KEY (member_role_id),
  UNIQUE KEY uni_member_id_role (ROLE,member_id),
  KEY fk_member_id (member_id),
  KEY fk_role (role),
  CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_role FOREIGN KEY (role) REFERENCES role (role) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `member_role`
--

CREATE TABLE member_search (
  member_search_id int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  member_id int(5) UNSIGNED NOT NULL,
  ip int(10) UNSIGNED NOT NULL DEFAULT '0',
  search_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (member_search_id),
  KEY fk_member_search_member (member_id),
  CONSTRAINT fk_member_search_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `department`
--

CREATE TABLE department (
  department_id tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  department_name varchar(15) DEFAULT NULL,
  shot_name varchar(4) DEFAULT NULL,
  kind varchar(10) DEFAULT NULL,
  PRIMARY KEY (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `lecture`
--

CREATE TABLE lecture (
  lecture_id smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  member_id int(5) UNSIGNED DEFAULT NULL,
  lecture_name varchar(100) DEFAULT NULL,
  dept tinyint(2) UNSIGNED DEFAULT '1',
  prof varchar(20) DEFAULT NULL,
  likes tinyint(2) UNSIGNED DEFAULT '0',
  write_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP /*ON UPDATE CURRENT_TIMESTAMP*/,
  is_delete tinyint(1) UNSIGNED DEFAULT '0',
  PRIMARY KEY (lecture_id),
  KEY FK_lecture_member (member_id),
  KEY FK_lecture_department (dept),
  CONSTRAINT FK_lecture_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_lecture_department FOREIGN KEY (dept) REFERENCES department (department_id) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `lecture_sub`
--

CREATE TABLE lecture_sub (
  ls_id smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  lecture_id smallint(4) UNSIGNED DEFAULT NULL,
  member_id int(5) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (ls_id),
  UNIQUE KEY uni_lecture_member (lecture_id,member_id),
  KEY FK_lecturesub_lecture (lecture_id),
  KEY FK_lecturesub_member (member_id),
  CONSTRAINT FK_lecturesub_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_lecturesub_lecture FOREIGN KEY (lecture_id) REFERENCES lecture (lecture_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `lecture_board`
--

CREATE TABLE lecture_board (
  lb_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  lecture_id smallint(4) UNSIGNED DEFAULT NULL,
  member_id int(5) UNSIGNED DEFAULT NULL,
  writer varchar(15) DEFAULT NULL,
  rnum smallint(5) UNSIGNED DEFAULT NULL,
  title varchar(40) DEFAULT NULL,
  contents text DEFAULT NULL,
  hit smallint(5) UNSIGNED DEFAULT '0',
  report smallint(4) UNSIGNED DEFAULT '0',
  write_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_delete tinyint(1) UNSIGNED DEFAULT '0',
  is_reply tinyint(1) UNSIGNED DEFAULT '0',
  upper_id int(6) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (lb_id),
  KEY FK_lecture_board_lecture (lecture_id),
  KEY FK_lecture_board_member (member_id),
  KEY FK_lecture_board_reply (upper_id),
  CONSTRAINT FK_lecture_board_reply FOREIGN KEY (upper_id) REFERENCES lecture_board (lb_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_lecture_board_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_lecture_board_lecture FOREIGN KEY (lecture_id) REFERENCES lecture (lecture_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `lecture_board_sub`
--

CREATE TABLE lecture_board_sub (
  lbs_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  lb_id int(10) UNSIGNED DEFAULT NULL,
  member_id int(5) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (lbs_id),
  UNIQUE KEY uni_lecture_board_member (lb_id,member_id),
  KEY FK_lecture_board_sub_lecture_board (lb_id),
  KEY FK_lecture_board_sub_member (member_id),
  CONSTRAINT FK_lecture_board_sub_lecture_board FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_lecture_board_sub_member FOREIGN KEY (lb_id) REFERENCES lecture_board (lb_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `semester`
--

CREATE TABLE semester (
  semester_id tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  semester_title varchar(6) DEFAULT NULL,
  PRIMARY KEY (semester_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `evaluation`
--

CREATE TABLE evaluation (
  evaluation_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  lecture_id smallint(4) UNSIGNED DEFAULT NULL,
  member_id int(5) UNSIGNED DEFAULT NULL,
  method varchar(150) DEFAULT NULL,
  task varchar(150) DEFAULT NULL,
  exam varchar(150) DEFAULT NULL,
  comment text DEFAULT NULL,
  score tinyint(2) UNSIGNED DEFAULT NULL,
  write_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  semester tinyint(2) UNSIGNED DEFAULT '1',
  member_method tinyint(2) UNSIGNED DEFAULT '0',
  member_task tinyint(2) UNSIGNED DEFAULT '0',
  member_exam tinyint(2) UNSIGNED DEFAULT '0',
  is_delete tinyint(1) UNSIGNED DEFAULT '0',
  is_reply tinyint(1) UNSIGNED DEFAULT '0',
  upper_id int(10) UNSIGNED DEFAULT NULL,
  likes smallint(4) UNSIGNED DEFAULT '0',
  dislike smallint(4) UNSIGNED DEFAULT '0',
  report smallint(4) UNSIGNED DEFAULT '0',
  PRIMARY KEY (evaluation_id),
/*  UNIQUE KEY uni_lecture_id_member_id (lecture_id,member_id),*/
  KEY FK_evaluation_lecture (lecture_id),
  KEY FK_evaluation_member (member_id),
  KEY FK_evaluation_semester (semester),
  KEY FK_evaluation_reply (upper_id),
  CONSTRAINT FK_evaluation_reply FOREIGN KEY (upper_id) REFERENCES evaluation (evaluation_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_evaluation_semester FOREIGN KEY (semester) REFERENCES semester (semester_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_evaluation_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_evaluation_lecture FOREIGN KEY (lecture_id) REFERENCES lecture (lecture_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `evaluationsub`

CREATE TABLE evaluationsub (
  es_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  evaluation_id int(10) UNSIGNED DEFAULT NULL,
  member_id int(5) UNSIGNED DEFAULT NULL,
  kind tinyint(2) UNSIGNED DEFAULT '0',
  PRIMARY KEY (es_id),
  UNIQUE KEY uni_evaluation_member (evaluation_id,member_id),
  KEY FK_evaluationsub_evaluation (evaluation_id),
  KEY FK_evaluationsub_member (member_id),
  CONSTRAINT FK_evaluationsub_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_evaluationsub_evaluation FOREIGN KEY (evaluation_id) REFERENCES evaluation (evaluation_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `board`
--

CREATE TABLE board (
  board_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  department_id tinyint(2) UNSIGNED DEFAULT NULL,
  member_id int(5) UNSIGNED DEFAULT NULL,
  writer varchar(15) DEFAULT NULL,
  rnum smallint(5) UNSIGNED DEFAULT NULL,
  title varchar(40) DEFAULT NULL,
  contents text DEFAULT NULL,
  hit smallint(5) UNSIGNED DEFAULT '0',
  likes smallint(4) UNSIGNED DEFAULT '0',
  dislike smallint(4) UNSIGNED DEFAULT '0',
  report smallint(4) UNSIGNED DEFAULT '0',
  write_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_anonymity tinyint(4) UNSIGNED DEFAULT '0',
  is_delete tinyint(1) UNSIGNED DEFAULT '0',
  is_reply tinyint(1) UNSIGNED DEFAULT '0',
  upper_id int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (board_id),
  KEY FK_board_department (department_id),
  KEY FK_board_member (member_id),
  KEY FK_board_reply (upper_id),
  CONSTRAINT FK_board_reply FOREIGN KEY (upper_id) REFERENCES board (board_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_board_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_board_department FOREIGN KEY (department_id) REFERENCES department (department_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `board_sub`
--

CREATE TABLE board_sub (
  bs_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  board_id int(10) UNSIGNED DEFAULT NULL,
  member_id int(5) UNSIGNED DEFAULT NULL,
  kind tinyint(2) UNSIGNED DEFAULT '0',
  PRIMARY KEY (bs_id),
  UNIQUE KEY uni_board_member (board_id,member_id),
  KEY FK_board_sub_board (board_id),
  KEY FK_board_sub_member (member_id),
  CONSTRAINT FK_board_sub_board FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_board_sub_member FOREIGN KEY (board_id) REFERENCES board (board_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
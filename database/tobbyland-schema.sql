DROP SCHEMA IF EXISTS tobbyland;
CREATE SCHEMA tobbyland;
USE tobbyland;

--
-- Table structure for table `tendency`
--

CREATE TABLE tendency (
  tendency_id int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  tendency_title varchar(45) DEFAULT NULL,
  PRIMARY KEY (tendency_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `member`
--

CREATE TABLE member (
  member_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id varchar(45) NOT NULL,
  password varchar(100) DEFAULT NULL,
  nickname varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  question int(2) UNSIGNED DEFAULT '1',
  answer varchar(10) DEFAULT NULL,
  reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  method int(2) UNSIGNED DEFAULT '1',
  task int(2) UNSIGNED DEFAULT '4',
  exam int(2) UNSIGNED DEFAULT '7',
  enabled tinyint(4) UNSIGNED DEFAULT '0',
  nonLocked tinyint(4) UNSIGNED DEFAULT '1',
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
  role varchar(45) NOT NULL,
  role_name varchar(45) NOT NULL,
  PRIMARY KEY (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `member_role`
--

CREATE TABLE member_role (
  member_role_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  member_id int(10) UNSIGNED NOT NULL,
  role varchar(45) DEFAULT 'ROLE_USER',
  PRIMARY KEY (member_role_id),
  UNIQUE KEY uni_member_id_role (ROLE,member_id),
  KEY fk_member_id (member_id),
  KEY fk_role (role),
  CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_role FOREIGN KEY (role) REFERENCES role (role) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `department`
--

CREATE TABLE department (
  department_id int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  department_name varchar(45) DEFAULT NULL,
  PRIMARY KEY (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `lecture`
--

CREATE TABLE lecture (
  lecture_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  member_id int(10) UNSIGNED DEFAULT NULL,
  lecture_name varchar(45) DEFAULT NULL,
  dept int(2) UNSIGNED DEFAULT '1',
  prof varchar(45) DEFAULT NULL,
  likes int(10) UNSIGNED DEFAULT '0',
  write_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_delete tinyint(4) UNSIGNED DEFAULT '1',
  PRIMARY KEY (lecture_id),
  KEY FK_lecture_member (member_id),
  KEY FK_lecture_department (dept),
  CONSTRAINT FK_lecture_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_lecture_department FOREIGN KEY (dept) REFERENCES department (department_id) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `semester`
--

CREATE TABLE semester (
  semester_id int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  semester_title varchar(45) DEFAULT NULL,
  PRIMARY KEY (semester_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `evaluation`
--

CREATE TABLE evaluation (
  evaluation_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  lecture_id int(10) UNSIGNED DEFAULT NULL,
  member_id int(10) UNSIGNED DEFAULT NULL,
  method varchar(45) DEFAULT NULL,
  task varchar(45) DEFAULT NULL,
  exam varchar(45) DEFAULT NULL,
  comment varchar(45) DEFAULT NULL,
  score int(10) UNSIGNED DEFAULT NULL,
  write_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  semester int(2) UNSIGNED DEFAULT NULL,
  is_delete tinyint(4) UNSIGNED DEFAULT '1',
  is_reply tinyint(4) UNSIGNED DEFAULT NULL,
  upper_id int(10) UNSIGNED DEFAULT NULL,
  likes int(10) UNSIGNED DEFAULT '0',
  dislike int(10) UNSIGNED DEFAULT '0',
  report int(10) UNSIGNED DEFAULT '0',
  PRIMARY KEY (evaluation_id),
  UNIQUE KEY uni_lecture_id_member_id (lecture_id,member_id),
  KEY FK_evaluation_lecture (lecture_id),
  KEY FK_evaluation_member (member_id),
  KEY FK_evaluation_semester (semester),
  CONSTRAINT FK_evaluation_semester FOREIGN KEY (semester) REFERENCES semester (semester_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_evaluation_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_evaluation_lecture FOREIGN KEY (lecture_id) REFERENCES lecture (lecture_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `lecturesub`
--

CREATE TABLE lecturesub (
  ls_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  lecture_id int(10) UNSIGNED DEFAULT NULL,
  member_id int(10) UNSIGNED DEFAULT NULL,
  kind int(10) UNSIGNED DEFAULT '0',
  rnum int(10) UNSIGNED DEFAULT NULL,
  title varchar(45) DEFAULT NULL,
  contents varchar(45) DEFAULT NULL,
  reply int(10) UNSIGNED DEFAULT NULL,
  write_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_delete tinyint(4) UNSIGNED DEFAULT '1',
  PRIMARY KEY (ls_id),
  KEY FK_lecturesub_lecture (lecture_id),
  KEY FK_lecturesub_member (member_id),
  CONSTRAINT FK_lecturesub_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_lecturesub_lecture FOREIGN KEY (lecture_id) REFERENCES lecture (lecture_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `evaluationsub`

CREATE TABLE evaluationsub (
  es_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  evaluation_id int(10) UNSIGNED DEFAULT NULL,
  member_id int(10) UNSIGNED DEFAULT NULL,
  kind int(10) UNSIGNED DEFAULT '0',
  contents varchar(45) DEFAULT NULL,
  write_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_delete tinyint(4) UNSIGNED DEFAULT '1',
  PRIMARY KEY (es_id),
/*  UNIQUE KEY uni_evaluation_id_member_id (evaluation_id,member_id),*/
  KEY FK_evaluationsub_evaluation (evaluation_id),
  KEY FK_evaluationsub_member (member_id),
  CONSTRAINT FK_evaluationsub_member FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_evaluationsub_evaluation FOREIGN KEY (evaluation_id) REFERENCES evaluation (evaluation_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

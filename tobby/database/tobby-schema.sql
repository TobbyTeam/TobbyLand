DROP SCHEMA IF EXISTS tobby;
CREATE SCHEMA tobby;
USE tobby;

--
-- Table structure for table `tendency`
--

CREATE TABLE tendency (
  tendency_id varchar(10) NOT NULL,
  title varchar(45) DEFAULT NULL,
  PRIMARY KEY (tendency_id) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `member`
--

CREATE TABLE member (
  member_id varchar(45) NOT NULL DEFAULT '',
  password varchar(45) DEFAULT NULL,
  nickname varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  method varchar(10) DEFAULT NULL,
  task varchar(10) DEFAULT NULL,
  exam varchar(10) DEFAULT NULL,
  email_auth tinyint(1) unsigned DEFAULT '0',
  type varchar(45) DEFAULT NULL,
  stop tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `lecture`
--

CREATE TABLE lecture (
  lecture_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  lecture_name varchar(45) DEFAULT NULL,
  dept varchar(45) DEFAULT NULL,
  prof varchar(45) DEFAULT NULL,
  PRIMARY KEY (lecture_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `evaluation`
--

CREATE TABLE evaluation (
  evaluation_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  lecture_id int(10) unsigned DEFAULT NULL,
  member_id int(10) DEFAULT NULL,
  method varchar(45) DEFAULT NULL,
  task varchar(45) DEFAULT NULL,
  exam varchar(45) DEFAULT NULL,
  comment varchar(45) DEFAULT NULL,
  score int(10) unsigned DEFAULT NULL,
  write_date datetime DEFAULT NULL,
  is_delete tinyint(1) unsigned DEFAULT NULL,
  is_reply tinyint(1) unsigned DEFAULT NULL,
  upper_id int(10) unsigned DEFAULT NULL,
  likes int(10) unsigned DEFAULT NULL,
  dislike int(10) unsigned DEFAULT NULL,
  report int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (evaluation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




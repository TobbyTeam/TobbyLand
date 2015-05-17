CREATE TABLE tobby.lecture (
  lecture_id int(10) unsigned NOT NULL auto_increment,
  lecture_name varchar(45) default NULL,
  dept varchar(45) default NULL,
  prof varchar(45) default NULL,
  PRIMARY KEY  (lecture_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
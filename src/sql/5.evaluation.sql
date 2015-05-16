CREATE TABLE tobby.evaluation (
  evaluation_id int(10) unsigned NOT NULL auto_increment,
  lecture_id int(10) unsigned default NULL,
  member_id int(10) default NULL,
  exam varchar(45) default NULL,
  method varchar(45) default NULL,
  task varchar(45) default NULL,
  comment varchar(45) default NULL,
  score int(10) unsigned default NULL,
  write_date datetime default NULL,
  is_delete tinyint(1) unsigned default NULL,
  is_reply tinyint(1) unsigned default NULL,
  upper_id int(10) unsigned default NULL,
  likes int(10) unsigned default NULL,
  dislike int(10) unsigned default NULL,
  PRIMARY KEY  (evaluation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

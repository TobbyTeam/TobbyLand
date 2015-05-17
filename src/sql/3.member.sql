CREATE TABLE tobby.member (
  member_id int(10) unsigned NOT NULL auto_increment,
  password varchar(45) default NULL,
  nickname varchar(45) default NULL,
  email varchar(45) default NULL,
  introduce varchar(45) default NULL,
  reg_date datetime default NULL,
  exam int(10) unsigned default NULL,
  method int(10) unsigned default NULL,
  task int(10) unsigned default NULL,
  email_auth tinyint(1) unsigned default NULL,
  type varchar(45) default NULL,
  stop tinyint(1) unsigned default NULL,
  PRIMARY KEY  (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

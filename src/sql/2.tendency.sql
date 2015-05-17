CREATE TABLE tobby.tendency (
  tendency_id int(10) unsigned NOT NULL auto_increment,
  title varchar(45) default NULL,
  PRIMARY KEY  USING BTREE (`tendency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


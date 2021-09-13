create database if not exists dojos_ninjas;

use dojos_ninjas;

create table if not exists dojos(
  dojo_id int(200) NOT NULL auto_increment,
  primary key (dojo_id),
  name varchar(255) NOT NULL,
  address varchar(255) NOT NULL
) engine = InnoDB;

create table if not exists ninjas(
  ninja_id int(200) NOT NULL auto_increment,
  primary key (ninja_id),
  name varchar(255) NOT NULL,
  skill varchar(255) NOT NULL,
  dojo int(200) NOT NULL,
  constraint ninja_dojo foreign key (dojo) references dojos(dojo_id)
) engine = InnoDB;
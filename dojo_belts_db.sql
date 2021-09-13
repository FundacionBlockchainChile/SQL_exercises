create database if not exists dojo_belts_db;

use dojo_belts_db;

create table if not exists users(
  user_id int(11) NOT NULL auto_increment,
  primary key (user_id),
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL
) engine = InnoDB;

create table if not exists belts(
  belt_id int(11) NOT NULL auto_increment,
  primary key (belt_id)
) engine = InnoDB;

create table if not exists users_belts(
  users_user_id int(11) NOT NULL auto_increment,
  belts_belt_id int(11) NOT NULL auto_increment,
  primary key (users_user_id, belts_belt_id),
  constraint users_belts_user foreign key (users_user_id) references users(user_id),
  constraint belts_user_belt foreign key (belts_belt_id) references belts(belt_id)
) engine = InnoDB;
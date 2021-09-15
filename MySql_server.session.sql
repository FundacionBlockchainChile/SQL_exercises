--@block
create database if not exists blog;
--@block
use blog;

--@block
drop table if exists Users;

--@block
use blog;
create table users(
  id int primary key auto_increment,
  firstName varchar(255) not null,
  lastName varchar(255) not null,
  email varchar(255) not null unique,
  password varchar(255) not null,
  createdAt datetime,
  updatedAt datetime,
  country varchar(2)
);

--@block
drop table if exists blogs;

--@block
use blog;
drop table if exists blogs;
create table blogs(
  id int primary key auto_increment,
  title varchar(255) not null,
  createdAt datetime,
  updatedAt datetime
);
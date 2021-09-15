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

--@block
use blog;
drop table if exists admins;
create table admins(
  id int primary key auto_increment,
  blog_id int not null,
  user_id int not null,
  createdAt datetime,
  updatedAt datetime,
  foreign key (user_id) references users(id),
  foreign key (blog_id) references blogs(id)
);

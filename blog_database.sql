#create database blog
create database if not exists blog_database;

#seleccionar base de datos
use blog_database;

#Tabla User
CREATE TABLE IF NOT EXISTS user(
	id_user int not null,
    first_name varchar(50) not null,
    middleName varchar(50) not null,
    mobile varchar(15) not null,
    email varchar(50) not null,
    passwordHash varchar(50) not null,
    registeredAt date,
    lastLogin date,
    intro tinytext,
    profile text
)ENGINE=INNODB;

#Tabla Post
CREATE TABLE IF NOT EXISTS posts(
	id bigint(20) not null,
    authotId bigint(20) not null,
    parentId bigint(20) not null,
    title varchar(75) not null,
    metaTitle varchar(100) not null,
    slug varchar(100) not null,
    summary tinytext,
    published tinyint(1),
    createdAt date,
    updatedAt date,
    publishedAt date,
    content text
)ENGINE=INNODB;

#Tabla Post_Comment
CREATE TABLE IF NOT EXISTS post_comment(
	id bigint(20) not null,
    postId bigint(20) not null,
    parentId bigint(20) not null,
    title varchar(100) not null,
    published tinyint(1),
    createdAt date,
    publishedAt date,
    content text
)ENGINE=INNODB;

#Tabla tag
CREATE TABLE IF NOT EXISTS tag(
	id bigint(20) not null,
    title varchar(75) not null,
    metaTitle varchar(100),
    slug varchar(100),
    content text
)ENGINE=INNODB;

#Tabla Post_tag
CREATE TABLE IF NOT EXISTS post_tag(
	postId bigint(20) not null,
    tagId bigint(20) not null
)ENGINE=INNODB;

#Tabla Post_meta
CREATE TABLE IF NOT EXISTS post_meta(
	id bigint(20) not null,
    postId bigint(20) not null,
    content text
)ENGINE=INNODB;

#Tabla Post_Category
CREATE TABLE IF NOT EXISTS post_category(
	postId bigint(20) not null,
    categoryId bigint(20) not null
)ENGINE=INNODB;

#Tabla Category
CREATE TABLE IF NOT EXISTS category(
	id bigint(20) not null,
    parentId bigint(20) not null,
    title varchar(75) not null,
    metaTitle varchar(100) not null,
    slug varchar(100) not null,
    content text
)ENGINE=INNODB;










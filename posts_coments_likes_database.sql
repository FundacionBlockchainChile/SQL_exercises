#creamos la base de datos
CREATE DATABASE IF NOT EXISTS base_posts;

#seleccionar la base de datos
USE base_posts;

create table if not exists posts(
	id_post int not null,
    primary key(id_post),
    title varchar(150) not null,
    published tinyint(1) not null,
    created_at date,
    updated_at date
)ENGINE=INNODB;

create table if not exists comments(
	id_comment int not null,
    primary key(id_comment),
    content varchar(150) not null,
    published tinyint(1) not null,
    created_at date,
    updated_at date,
    posts_id_post int not null,
    constraint fkcomment_posts
    foreign key(posts_id_post)
    references posts(id_post)
)ENGINE=INNODB;

create table if not exists likes(
	id_like int not null,
    primary key(id_like),
    published tinyint(1) not null,
    created_at date,
    updated_at date,
    posts_id_post int not null,
    constraint fklike_posts
    foreign key(posts_id_post)
    references posts(id_post),
    comments_id_comment int not null,
    constraint fklike_comments
    foreign key(comments_id_comment)
    references comments(id_comment)
)ENGINE=INNODB;


#creamos la base de datos
CREATE DATABASE IF NOT EXISTS base_peliculas;

#seleccionar la base de datos
USE base_peliculas;

#creamos las tablas sin relacion
CREATE TABLE IF NOT EXISTS peliculas(
	id_pelicula INT NOT NULL,
    titulo VARCHAR(45) NOT NULL,
    anio DATE,
    nacionalidad VARCHAR(20),
    idioma VARCHAR(120),
    formato ENUM('Blanco y Negro', 'Color'),
    descripcion VARCHAR(120),
    resumen VARCHAR(255),
    observaciones VARCHAR(255),
    PRIMARY KEY(id_pelicula)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS actores(
	id_actor INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    nacionalidad VARCHAR(45),
    nombre_personaje VARCHAR(45),
    PRIMARY KEY(id_actor)    
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS directores(
	id_director int not null,
    nombre varchar(45) not null,
    fecha_nacimiento date,
    pais_origen varchar(120),
    primary key(id_director),
    peliculas_id_pelicula int not null,
    constraint fkdirector_peliculas
    foreign key(peliculas_id_pelicula)
    references peliculas(id_pelicula)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS actores_peliculas(
	peliculas_id_pelicula int not null,
    actores_id_actor int not null,
    primary key(peliculas_id_pelicula, actores_id_actor),
    constraint fkactor_peliculas_actor
    foreign key (actores_id_actor)
    references actores(id_actor),
    constraint fkactor_actor_peliculas
    foreign key (peliculas_id_pelicula)
    references peliculas(id_pelicula)
)ENGINE=INNODB;

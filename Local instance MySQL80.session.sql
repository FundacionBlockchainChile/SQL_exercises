--@block
create database if not exists maquinarias;

--@block
use maquinarias;

create table bitacora_produciones(
  idBitacora int primary key auto_increment,
  
);

create table piezas(
  idPieza int primary key auto_increment,
  
);

create table maquinas(
  idMaquina int primary key auto_increment,
  
);

create table turnos(
  idTurno int primary key auto_increment,
  nombreTurno varchar(255) not null,
);

create table rollos(
  idRollo int primary key auto_increment,
  nombreMaquina varchar(255) not null,
);

create table empleados(
  idEmpleado int primary key auto_increment,
  firstName varchar(255) not null,
  lastName varchar(255) not null,
  turnoId int not null,
  foreign key (turnoId) references turnos(idTurno),
);

create table roles(
  idRol int primary key auto_increment,
  
);

create table materiales(
  idMaterial int primary key auto_increment,
  tipo varchar(255) not null,
);

create table pesos(
  idPeso int primary key auto_increment,
  peso varchar(255) not null,
);
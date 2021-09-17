create database if not exists maquinarias;

use maquinarias;
create table maquinas(
  idMaquina int primary key auto_increment,
  maquinaName varchar(255) not null,
  maquinaDescription text
);

create table materiales(
  idMaterial int primary key auto_increment,
  tipo varchar(255) not null
);

create table turnos(
  idTurno int primary key auto_increment,
  nombreTurno varchar(255) not null,
  startTime TIME,
  endTime TIME
);


create table clientes(
  idCliente int primary key auto_increment,
  firstName varchar(255) not null,
  lastName varchar(255) not null
);

create table roles(
  idRol int primary key auto_increment,
  rolName varchar(255) not null,
  rolDescription text
);

create table empleados(
  idEmpleado int primary key auto_increment,
  firstName varchar(255) not null,
  lastName varchar(255) not null,
  turnoId int not null,
  foreign key (turnoId) references turnos(idTurno),
  rolId int not null,
  foreign key (rolId) references roles(idRol)
);

create table piezas(
  idPieza int primary key auto_increment,
  piezaName varchar(255) not null,
  materialId int not null,
  foreign key (materialId) references materiales(idMaterial)
);

create table rollos(
  idRollo int primary key auto_increment,
  materialId int not null,
  foreign key (materialId) references materiales(idMaterial)
);

create table pesos(
  idPeso int primary key auto_increment,
  peso float,
  clientId int not null,
  foreign key (clientId) references clientes(idCliente),
  piezaId int not null,
  foreign key (piezaId) references piezas(idPieza)
);

create table bitacora_produciones(
  idBitacora int primary key auto_increment,
  startTime datetime,
  endTime datetime,
  emleadoId int not null,
  foreign key (emleadoId) references empleados(idEmpleado),
  maquinaId int not null,
  foreign key (maquinaId) references maquinas(idMaquina),
  piezaId int not null,
  foreign key (piezaId) references piezas(idPieza),
  rolloId int not null,
  foreign key (rolloId) references rollos(idRollo)
);

-- Insert elements to Table

INSERT INTO maquinarias.maquinas (idMaquina, maquinaName, maquinaDescription)
VALUES 
  ( 1, 'Cortadora Acero', 'Maquina cortadora de Acero'),
  ( 2, 'Cortadora Aluminio', 'Maquina cortadora de Aluminio');


INSERT INTO maquinarias.materiales (idMaterial, tipo)
VALUES 
  (1, 'Acero'),
  (2, 'Aluminio')


INSERT INTO maquinarias.turnos (idTurno, nombreTurno, startTime, endTime)
VALUES 
  (1, 'Mañana', '09:00:00', '14:00:00'),
  (2, 'Tarde', '14:00:00', '21:00:00')


INSERT INTO maquinarias.clientes (idCliente, firstName, lastName)
VALUES 
  ( 1, 'Leonardo', 'Farkas'),
  ( 2, 'Don', 'Billeton'),
  ( 3, 'Mr', 'Lucarnas'),
  ( 4, 'SirMIx', 'aLot'),
  ( 5, 'Mc', 'Hammer');


INSERT INTO maquinarias.roles (idRol, rolName, rolDescription)
VALUES
  (1, 'Operador', 'Encargado de Operar Maquinaria'),
  (2, 'Supervisor', 'Encargado de Supervisar correcta ejecucion');


INSERT INTO maquinarias.empleados (idEmpleado, firstName, lastName, turnoId, rolId)
VALUES
  (1, 'Jhon','Doe',1,1),
  (2, 'Mike','Jordan',1,2),
  (3, 'Clarence','Acuña',2,1),
  (4, 'Lalo','Landa',2,2),
  (5, 'Ivan','Zamorano',1,1);


INSERT INTO maquinarias.piezas (idPieza, piezaName, materialId)
VALUES 
  ( 1, 'Audi Chassis', 1 ),
  ( 2, 'Chevorlet Chassis', 1 ),
  ( 3, 'Honda Chassis', 1 ),
  ( 4, 'Volvo Chassis', 2 ),
  ( 5, 'Mercedes Chassis', 2);


INSERT INTO maquinarias.rollos (idRollo, materialId)
VALUES
  ( 1 , 1 ),
  ( 2 , 2 ),
  ( 3 , 1 ),
  ( 4 , 2 ),
  ( 5 , 1 );


INSERT INTO maquinarias.pesos (idPeso, peso, clientId, piezaId)
VALUES 
  ( 1, 1000.50, 1, 5),
  ( 2, 1500.60, 2, 4),
  ( 3, 900.20, 3, 3),
  ( 4, 800.20, 4, 2),
  ( 5, 700.30, 5, 1),
  ( 6, 650.25, 1, 5),
  ( 7, 800.45, 2, 4),
  ( 8, 1500.80, 3, 3),
  ( 9, 2000.40, 4,2),
  ( 10, 1300.10, 5, 1);
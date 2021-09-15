--@block
create table Users(
  id int primary key auto_increment,
  email varchar(255) not null unique,
  bio text,
  country varchar(2)
);

--@block
insert into Users (email, bio, country) values
  ('srpiesligeros@google.com', 'i love dogs!', 'CL'),
  ('teo@world.com', 'i love cats!', 'CL')

--@block
select * from Users
order by id ASC


--@block
select email, id, country from Users
where country = 'CL' and email like 's%'

--@block
create index email_index on Users(email)

--@block
create table Rooms(
  id int auto_increment,
  street varchar(255),
  owner_id int not null,
  primary key(id),
  foreign key(owner_id) references Users(id)
)

--@block
insert into rooms(owner_id, street) values
  (1, 'san diego sailboat'),
  (1, 'nantucket cotage'),
  (1, 'vail cabin'),
  (1, 'sf cardboard box')

--@block
select * from Users
inner join Rooms
on Rooms.owner_id = Users.id

--@block
select * from Users
left join Rooms
on Rooms.owner_id = Users.id

--@block
select
  Users.id as 'user_id', 
  Rooms.id as 'room_id',
  email,
  street
from Users
inner join Rooms
on Rooms.owner_id = Users.id

--@block
create table Bookings(
  id int auto_increment,
  guest_id int not null,
  room_id int not null,
  check_in datetime,
  primary key (id),
  foreign key (guest_id) references Users(id),
  foreign key (room_id) references Rooms(id)
)

--@block Rooms a user has booked
select
  guest_id,
  street,
  check_in
from Bookings
inner join Rooms on Rooms.owner_id = guest_id
where guest_id = 1;

--@block Guests who stayed in a room
select
  room_id,
  guest_id,
  email,
  bio
from Bookings
inner join Users on Users.id = guest_id
where room_id = 2;

--@block
drop database world;
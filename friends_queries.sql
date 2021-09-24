--@block
use friends;

--@block
select * from users

--@block
select * from friendships

--@block
-- Usando el siguiente ERD como referencia, escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos.
select *
from users
left join friendships on users.id = friendships.user_id
left join users as user2 on friendships.friend_id = user2.id

--@block
-- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
select user2.first_name, user2.last_name
from users
left join friendships on users.id = friendships.user_id
left join users as user2 on friendships.friend_id = user2.id
where users.first_name = 'Kermit'

--@block
-- Devuelve el recuento de todas las amistades.
select users.first_name, users.last_name, count(user2.id) as cantidadAmigos
from users
left join friendships on users.id = friendships.user_id
left join users as user2 on friendships.friend_id = user2.id
group by user2.id

--@block
-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
select users.first_name, users.last_name, count(user2.id) as cantidad_amigos
from users
left join friendships on users.id = friendships.user_id
left join users as user2 on friendships.friend_id = user2.id
group by user_id
order by cantidad_amigos desc;

--@block
-- Crea un nuevo usuario....
INSERT INTO users (first_name,last_name,created_at,updated_at)
VALUES ('SirMix','Alot',now(),now())

--@block
--  y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
INSERT INTO friendships (user_id, friend_id, created_at, updated_at)
VALUES 
  (2,6,now(),now()),
  (4,6,now(),now()),
  (5,6,now(),now())

--@block
-- Devuelve a los amigos de Eli en orden alfabético.
select users.first_name, users.last_name, user2.first_name as friendFirstName, user2.last_name as friendLastName
from users
left join friendships on users.id = friendships.user_id
left join users as user2 on friendships.friend_id = user2.id
where users.first_name = 'Eli' 
order by user2.first_name desc;

--@block
-- Eliminar a Marky Mark de los amigos de Eli.
DELETE FROM friendships
WHERE id = 5

--@block
-- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos
select users.first_name, users.last_name, user2.first_name, user2.last_name
from users
left join friendships on users.id = friendships.user_id
left join users as user2 on friendships.friend_id = user2.id
-- use twitter;

select * from users

select * from users
where id = 1 OR id = 2
order by birthday desc -- asc is default

-- Qué consulta ejecutarías para obtener todos los usuarios?
SELECT * 
FROM users;

-- Qué consulta ejecutarías para obtener solo los nombres de todos los usuarios?
SELECT first_name 
FROM users;

-- Qué consulta ejecutarías para obtener solo el nombre y los apellidos de todos los usuarios?
SELECT first_name, last_name
FROM users;

-- Qué consulta ejecutarías para obtener solo el nombre de los usuarios con un ID de 2?
SELECT first_name
FROM users
WHERE id = 2;

-- Qué consulta ejecutarías para obtener los apellidos de los usuarios con un ID de 2 o 3?
SELECT last_name
FROM users
WHERE id = 2 OR id = 3;

-- Qué consulta ejecutarías para obtener todos los usuarios con una identificación mayor que 2?
SELECT *
FROM users
WHERE id > 2;

-- Qué consulta ejecutaría para obtener todos los usuarios con una identificación menor o igual a 3?
SELECT *
FROM users
WHERE id <= 3;

-- Qué consulta ejecutarías para obtener todos los usuarios con nombres que terminan en "e"?
SELECT * 
FROM users
WHERE first_name LIKE "%e";

-- Qué consulta ejecutaría para obtener todos los usuarios con nombres que comienzan en "K"?
SELECT * 
FROM users
WHERE first_name LIKE "K%";


-- SELECT con modo ordenar
-- Qué consulta ejecutaría para obtener todos los usuarios con los usuarios más jóvenes en la parte superior de la tabla?

SELECT *
FROM users
ORDER BY birthday DESC;

-- Qué consulta ejecutaría para obtener todos los usuarios con los usuarios más antiguos en la parte superior de la tabla?

SELECT *
FROM users
ORDER BY birthday ASC;

-- Qué consulta ejecutaría para obtener todos los usuarios con el primer nombre que termina con "e" con los usuarios más jóvenes en la parte superior de la tabla?
SELECT *
FROM users
WHERE first_name LIKE "%e"
ORDER BY birthday DESC;

-- Qué consulta ejecutaría para obtener solo los nombres de todos los usuarios en orden alfabético?
SELECT first_name
FROM users
ORDER BY first_name;


-- Insertando Registros
-- El patrón de comando SQL para INSERTAR registros es el siguiente:

INSERT INTO table_name (column_name1, column_name2) 
VALUES('column1_value', 'column2_value');

-- Update Syntax
UPDATE `twitter`.`users` SET `first_name` = 'Cobe' WHERE (`id` = '1');

-- Actualizando Registros
-- El patrón de comando SQL para actualizar / editar registros es el siguiente:

UPDATE table_name SET column_name1 = 'some_value', column_name2='another_value' WHERE condition(s)
-- IMPORTANTE: si la condición WHERE no se agrega a la instrucción UPDATE, los cambios se aplicarán a todos los registros de la tabla.


-- Borrando Registros
-- El patrón de comando SQL para eliminar / eliminar registros es el siguiente:

DELETE FROM table_name WHERE condition(s)
-- IMPORTANTE: si la condición WHERE no se agrega a la instrucción DELETE, eliminará todos los registros de la tabla.

-- FUNCTIONS
select concat('Mr.', ' ', first_name, ' ', last_name) as fullName from users;
select length(first_name) as first_length from users;
select lower(first_name) as first_lower from users;
select hour(birthday) as date_hour from users;
select dayname(birthday) as date_hour from users;
select month(birthday) as date_hour from users;
select now() as right_now;


--JOIN
select clients.first_name, clients.last_name, billing.amount, billing.charged_datetime
from clients
join billing on clients.id = billing.clients_id

select sites.domain_name, leads.first_name, leads.last_name
from sites
join leads on sites.id = leads.sites_id

select clients.firs_name, clients.last_name, sites.domain_name, leads.first_name
from clients
join sites on clients.id = sites.clients_id
join leads on sites.id = leads.sites_id

-- use lead_gen_business;

-- JOINS
select clients.first_name, clients.last_name, billing.amount, billing.charged_datetime
from clients
join billing on clients.id = billing.clients_id;

-- JOINS
select sites.domain_name, leads.first_name, leads.last_name
from sites
join leads on sites.id = leads.sites_id;

-- MULTIPLE TABLE JOINS
select clients.first_name as client_first_name, clients.last_name, sites.domain_name, leads.first_name as leads_first_name
from clients
join sites on clients.id = sites.clients_id
join leads on sites.id = leads.sites_id;
-- LEFT JOIN
select clients.first_name, clients.last_name, sites.domain_name
from clients
left join sites on clients.id = sites.clients_id;

-- GROUP BY
select clients.first_name, clients.last_name, sum(billing.amount), billing.charged_datetime
from clients
join billing on clients.id = billing.clients_id
GROUP BY clients.id;

-- GROUP_CONCAT
select group_concat(' ', sites.domain_name) as domains, clients.first_name, clients.last_name
from clients
join sites on clients.id = sites.clients_id
group by clients.id;

-- COUNT
select count(leads.id), sites.domain_name
from sites
join leads on sites.id = leads.sites_id
group by sites.id;



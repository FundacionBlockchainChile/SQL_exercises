use world;

# SELECT * FROM world.city;

select city.name, country.name, country.LifeExpectancy, city.Population, country.population,
round(100*(city.population/country.Population),2) as "Porcentaje Pais" from country, city
where country.code=city.CountryCode;

SELECT * FROM scratch.customer;

# Like Operator
# Selecciona todo de Customers donde comienza con b
select * from scratch.customer where name like "b%";
# Selecciona todo de Customers donde termina con b
select * from scratch.customer where city like "%y";customer

USE world;
SELECT * FROM country;


# SELECT Code,Name,Continent,Region, MAX(SurfaceArea) FROM world.country;
# select MIN(Population) FROM country where Continent="Europe";
# select Name, MIN(Population) FROM country where Continent="Europe";#

# Ordered By ASC|DES
# SELECT * FROM country ORDER BY Population ASC;
# SELECT * FROM country ORDER BY Population desc;

SELECT * FROM world.city;

SELECT ID,NAME,CountryCode,  MIN(Population)  FROM world.city;



INSERT INTO `world`.`city` (`ID`, `Name`, `CountryCode`, `District`, `Population`) VALUES (<{ID: }>, <{Name: }>, <{CountryCode: }>, <{District: }>, <{Population: }>);
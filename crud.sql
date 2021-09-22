use world;


-- Create
INSERT INTO city (Name, CountryCode, District, Population)
VALUES (
    'MyCountry',
    'MOC',
    'MyOwnRegion',
    20000000
  );

-- Read
select * from city where CountryCode = 'MOC';

-- Update
UPDATE city SET Name = 'MyCountryUpdated', District='MyOwnRegionUpdated', Population=19000000 WHERE CountryCode = 'MOC';

-- Delete
DELETE FROM city WHERE CountryCode = 'MOC';




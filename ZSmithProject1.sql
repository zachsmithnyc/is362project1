DROP SCHEMA IF EXISTS flightdelays;
CREATE SCHEMA flightdelays;
USE flightdelays;

DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS counts;

CREATE TABLE cities (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
city varchar(50) NOT NULL
);

CREATE TABLE airlines (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
airline varchar(50) NOT NULL
);

CREATE TABLE counts (
city_id INT NOT NULL,
FOREIGN KEY (city_id) REFERENCES cities(id),
airline_id INT NOT NULL,
FOREIGN KEY (airline_id) REFERENCES airlines(id),
ontime_count INT NOT NULL, 
delayed_count INT NOT NULL
);

INSERT INTO cities (city)
VALUES 
('Los Angeles'),
('Phoenix'),
('San Diego'),
('San Francisco'),
('Seattle')
;

INSERT INTO airlines (airline)
VALUES
('Alaska'),
('AM West')
;

INSERT INTO counts (city_id, airline_id, ontime_count, delayed_count)
VALUES 
(1, 1, 497, 62),
(2, 1, 221, 12),
(3, 1, 212, 20),
(4, 1, 503, 102),
(5, 1, 1841, 305),
(1, 2, 694, 117),
(2, 2, 4840, 415),
(3, 2, 383, 65),
(4, 2, 320, 129),
(5, 2, 201, 61)
;

SELECT c.city, a.airline, n.ontime_count, delayed_count
FROM counts as n
INNER JOIN cities as c
ON n.city_id = c.id
INNER JOIN airlines as a
ON n.airline_id = a.id
ORDER BY c.city ASC;





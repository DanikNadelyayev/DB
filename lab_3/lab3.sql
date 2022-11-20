CREATE DATABASE IF NOT EXISTS Nadelyayev;
USE Nadelyayev;


DROP TABLE IF EXISTS plane_has_destination;
DROP TABLE IF EXISTS plane_has_register_plate;
DROP TABLE IF EXISTS plane_info;
DROP TABLE IF EXISTS destination;
DROP TABLE IF EXISTS plane;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS pilot;
DROP TABLE IF EXISTS register_plate;
DROP TABLE IF EXISTS airport;


CREATE TABLE IF NOT EXISTS plane
( 	
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	speed VARCHAR(45) NULL,
	company_id INT NOT NULL,
	current_flight_number VARCHAR(50) NULL
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS company
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NULL
)ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS plane_info
(
	id INT NOT NULL AUTO_INCREMENT,
	pilot_id INT NOT NULL,
	plane_id INT  NOT NULL,
	register_plate_id INT NOT NULL,
    PRIMARY KEY (`id`, `plane_id`)
)ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS pilot
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NULL,
	surname VARCHAR(45) NULL
)ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS register_plate
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(45) NOT NULL

)ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS airport
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	city VARCHAR(45) NOT NULL,
	street VARCHAR(45) NOT NULL
)ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS destination
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	country VARCHAR(60) NOT NULL,
	airport_id INT NOT NULL
)ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS plane_has_destination
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	destination_id INT NOT NULL,
	plane_id INT NOT NULL
)ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS plane_has_register_plate
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	register_plate_id INT NOT NULL,
	plane_id INT NOT NULL
)ENGINE = INNODB;

ALTER TABLE plane_info
ADD CONSTRAINT FK_plane_info_plane
FOREIGN KEY (plane_id)
	REFERENCES plane (id)
ON UPDATE CASCADE    ON DELETE RESTRICT;

ALTER TABLE plane_has_destination
ADD CONSTRAINT FK_plane_has_destination_plane
FOREIGN KEY (plane_id)
	REFERENCES plane (id);
    
ALTER TABLE plane_has_register_plate
ADD CONSTRAINT FK_plane_has_register_plate_plane
FOREIGN KEY (plane_id)
	REFERENCES plane (id);
    
ALTER TABLE plane
ADD CONSTRAINT FK_plane_company
FOREIGN KEY (company_id)
	REFERENCES company (id);

ALTER TABLE plane_info
ADD CONSTRAINT FK_plane_info_pilot
FOREIGN KEY (pilot_id)
	REFERENCES pilot (id);
    
ALTER TABLE plane_info
ADD CONSTRAINT FK_plane_info_register_plate 
FOREIGN KEY (register_plate_id)
	REFERENCES register_plate (id);
    
ALTER TABLE destination
ADD CONSTRAINT FK_destination_airport
FOREIGN KEY (airport_id)
	REFERENCES airport (id);
    
INSERT INTO company (id, name) VALUES
(1, 'ryanair'),
(2, 'turkish airlines'),
(3, 'qatar'),
(4, 'wizzair');

INSERT INTO pilot (id, name, surname) VALUES
(1, 'Danylo', 'Nadelyayev'),
(2, 'Maks', 'Koval'),
(3, 'Oleksiy', 'Ivantsiv'),
(4, 'Sasha', 'Yarmus');

INSERT INTO register_plate (id, number) VALUES
(1, 'kr123'),
(2, 'uk587'),
(3, 'ka459'),
(4, 'uo986');

INSERT INTO airport (id, name, city, street) VALUES
(1, 'Galitskiy', 'Lviv', 'Lubinska'),
(2, 'Plaszow', 'Krakow', 'Krakowska'),
(3, 'Modlin', 'Warszawa', 'Mokrego');

INSERT INTO plane (id, speed, company_id, current_flight_number) VALUES
(1, 300, 1, 1757),
(2, 500, 1, 5465),
(3, 900, 3, 0533),
(4, 20, 2, 8765);

INSERT INTO destination (id, country, airport_id) VALUES
(1, 'Ukraine', 1),
(2, 'Poland', 3),
(3, 'Poland', 2);

INSERT INTO plane_has_destination (id, plane_id, destination_id) VALUES
(1, 2, 2),
(2,1,3),
(3, 2, 1),
(4, 3, 1),
(5, 1, 1);

INSERT INTO plane_has_register_plate (id, plane_id, register_plate_id) VALUES
(1, 2, 1),
(2, 1, 3),
(3, 3, 2);

INSERT INTO plane_info (id, pilot_id, plane_id, register_plate_id) VALUES
(1, 1, 1, 3),
(2, 3, 2, 1),
(3, 2, 3, 2);

CREATE INDEX plane_index ON plane_info(register_plate_id);
CREATE INDEX name_index ON pilot(name);



/*
Janny Velazquez
DEALERSHIP DATABASE PROJECT
*/ 


USE dealership;

/* creating new tables */
CREATE TABLE model (
    ID INT NOT NULL AUTO_INCREMENT,
    model VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

CREATE TABLE make (
    ID INT NOT NULL AUTO_INCREMENT,
    make VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

CREATE TABLE type (
    ID INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

CREATE TABLE color (
    ID INT NOT NULL AUTO_INCREMENT,
    color VARCHAR(25) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

CREATE TABLE engine (
    ID INT NOT NULL AUTO_INCREMENT,
    engine VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

CREATE TABLE transmission (
    ID INT NOT NULL AUTO_INCREMENT,
    transmission VARCHAR(40) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

CREATE TABLE cylinders (
    ID INT NOT NULL AUTO_INCREMENT,
    cylinders VARCHAR(2) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);


/* populating new tables */
INSERT INTO model(model)
SELECT DISTINCT model
FROM vehicle;

INSERT INTO make(make)
SELECT DISTINCT make
FROM vehicle;

INSERT INTO type(type)
SELECT DISTINCT type
FROM vehicle;

INSERT INTO color(color)
SELECT DISTINCT color
FROM vehicle;

INSERT INTO engine(engine)
SELECT DISTINCT engine
FROM vehicle;

INSERT INTO transmission(transmission)
SELECT DISTINCT transmission
FROM vehicle;

INSERT INTO cylinders(cylinders)
SELECT DISTINCT cylinders
FROM vehicle;


/* updating table vehicle with foreign key data */
UPDATE vehicle
SET make = (
SELECT ID FROM make
    WHERE vehicle.make = make.make
);

UPDATE vehicle
SET model = (
SELECT ID FROM model
    WHERE vehicle.model = model.model
);

UPDATE vehicle
SET type = (
SELECT ID FROM type
    WHERE vehicle.type = type.type
);

UPDATE vehicle
SET color = (
SELECT ID FROM color
    WHERE vehicle.color = color.color
);

UPDATE vehicle
SET engine = (
SELECT ID FROM engine
    WHERE vehicle.engine = engine.engine
);

UPDATE vehicle
SET transmission = (
SELECT ID FROM transmission
    WHERE vehicle.transmission = transmission.transmission
);

UPDATE vehicle
SET cylinders = (
SELECT ID FROM cylinders
    WHERE vehicle.cylinders = cylinders.cylinders
);

/* Alter table vehicle to change data type of columns */
ALTER TABLE vehicle MODIFY COLUMN make INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN model INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN type INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN color INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN engine INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN transmission INT NOT NULL;
ALTER TABLE vehicle MODIFY COLUMN cylinders INT NOT NULL;

/* Alter table vehicle to add foreign key constraints */
ALTER TABLE vehicle ADD FOREIGN KEY (make) REFERENCES make(ID);
ALTER TABLE vehicle ADD FOREIGN KEY (model) REFERENCES model(ID);
ALTER TABLE vehicle ADD FOREIGN KEY (type) REFERENCES type(ID);
ALTER TABLE vehicle ADD FOREIGN KEY (color) REFERENCES color(ID);
ALTER TABLE vehicle ADD FOREIGN KEY (engine) REFERENCES engine(ID);
ALTER TABLE vehicle ADD FOREIGN KEY (transmission) REFERENCES transmission(ID);
ALTER TABLE vehicle ADD FOREIGN KEY (cylinders) REFERENCES cylinders(ID);
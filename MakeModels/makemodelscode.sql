/*
Janny Velazquez
DEALERSHIP DATABASE PROJECT
*/

USE dealership;

/* inserting data from given files */
INSERT INTO cylinders(cylinders) VALUES ('L4');
INSERT INTO make(make) VALUES ('Buick'), ('Chevrolet'), ('Chrysler'), ('Dodge'), ('Hummer'), ('Jeep'),
('Ram'), ('Saturn'), ('Tesla'), ('Acura'), ('Honda'), ('Hyundai'), ('Lexus'), ('Mazda'), ('Nissan'), ('Subaru');
INSERT INTO model(model) VALUES  ('Rogue'), ('Titan'), ('Altima'), ('Frontier'), ('Atenza'),
('CX-3'), ('Axela'), ('Demio'), ('Renegade'), ('Compass'), ('Wrangler');
INSERT INTO transmission(transmission) VALUES ('9 Speed Automatic');

INSERT INTO vehicle(type, make, model, color, engine, cylinders, transmission, vin, odometer,
retail, year) VALUES
((SELECT ID FROM type WHERE type.type = 'SUV'), (SELECT ID FROM make WHERE make.make = 'Nissan'), (SELECT ID FROM model WHERE model.model = 'Rogue'),
(SELECT ID FROM color WHERE color.color = 'Potamaic Blue'), (SELECT ID FROM engine WHERE engine.engine = '3.5'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'V6'),
(SELECT ID FROM transmission WHERE transmission.transmission = 'continuously variable-speed automatic'), 'JF1SG63685H737629', 5, '27360.00', '2023'),

((SELECT ID FROM type WHERE type.type = 'Truck (SuperCab)'), (SELECT ID FROM make WHERE make.make = 'Nissan'), (SELECT ID FROM model WHERE model.model = 'Titan'),
(SELECT ID FROM color WHERE color.color = 'Mineral Grey'), (SELECT ID FROM engine WHERE engine.engine = '5.0'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'V8'),
(SELECT ID FROM transmission WHERE transmission.transmission = '9 Speed Automatic'), '2HGEJ6617YH561116', 8, '39700.00', '2023'),

((SELECT ID FROM type WHERE type.type = 'Sedan'), (SELECT ID FROM make WHERE make.make = 'Nissan'), (SELECT ID FROM model WHERE model.model = 'Altima'),
(SELECT ID FROM color WHERE color.color = 'Mediterranean Blue'), (SELECT ID FROM engine WHERE engine.engine = '3.5'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'V6'),
(SELECT ID FROM transmission WHERE transmission.transmission = 'continuously variable-speed automatic'), '1N6AD0EV9BC405351', 2, '26385.00', '2023'),

((SELECT ID FROM type WHERE type.type = 'Truck (Regular Cab)'), (SELECT ID FROM make WHERE make.make = 'Nissan'), (SELECT ID FROM model WHERE model.model = 'Frontier'),
(SELECT ID FROM color WHERE color.color = 'Black Sapphire'), (SELECT ID FROM engine WHERE engine.engine = '3.3'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'V6'),
(SELECT ID FROM transmission WHERE transmission.transmission = '9 Speed Automatic'), '2T1BU4EE4AC381738', 10, '39914.00', '2023'),

((SELECT ID FROM type WHERE type.type = 'Wagon'), (SELECT ID FROM make WHERE make.make = 'Mazda'), (SELECT ID FROM model WHERE model.model = 'Atenza'),
(SELECT ID FROM color WHERE color.color = 'Tanzanite Blue'), (SELECT ID FROM engine WHERE engine.engine = '2.0'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'L4'),
(SELECT ID FROM transmission WHERE transmission.transmission = '6-speed shiftable automatic'), '1G8JW54RX3Y520537', 18000, '41700.00', '2021'),

((SELECT ID FROM type WHERE type.type = 'Sedan'), (SELECT ID FROM make WHERE make.make = 'Mazda'), (SELECT ID FROM model WHERE model.model = 'Axela'),
(SELECT ID FROM color WHERE color.color = 'Mediterranean Blue'), (SELECT ID FROM engine WHERE engine.engine = '1.8'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'L4'),
(SELECT ID FROM transmission WHERE transmission.transmission = '6-speed shiftable automatic'), '1FMJU1J5XAEA76057', 26000, '19635.00', '2019'),

((SELECT ID FROM type WHERE type.type = 'Hatchback'), (SELECT ID FROM make WHERE make.make = 'Mazda'), (SELECT ID FROM model WHERE model.model = 'Demio'),
(SELECT ID FROM color WHERE color.color = 'Velocity Blue'), (SELECT ID FROM engine WHERE engine.engine = '1.5'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'L4'),
(SELECT ID FROM transmission WHERE transmission.transmission = '6-speed manual'), '4S4BRCDC2E3267937', 53000, '12151.00', '2014'),

((SELECT ID FROM type WHERE type.type = 'SUV'), (SELECT ID FROM make WHERE make.make = 'Mazda'), (SELECT ID FROM model WHERE model.model = 'CX-3'),
(SELECT ID FROM color WHERE color.color = 'Space White'), (SELECT ID FROM engine WHERE engine.engine = '2.0'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'L4'),
(SELECT ID FROM transmission WHERE transmission.transmission = '6-speed manual'), 'JM1BJ245221484094', 21000, '12151.00', '2019'),

((SELECT ID FROM type WHERE type.type = 'SUV'), (SELECT ID FROM make WHERE make.make = 'Jeep'), (SELECT ID FROM model WHERE model.model = 'Renegade'),
(SELECT ID FROM color WHERE color.color = 'Oxford White'), (SELECT ID FROM engine WHERE engine.engine = '1.5'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'L4'),
(SELECT ID FROM transmission WHERE transmission.transmission = '6-speed shiftable automatic'), '4T4BF1FK1ER374026', 10, '29745.00', '2023'),

((SELECT ID FROM type WHERE type.type = 'SUV'), (SELECT ID FROM make WHERE make.make = 'Jeep'), (SELECT ID FROM model WHERE model.model = 'Compass'),
(SELECT ID FROM color WHERE color.color = 'Rapid Red'), (SELECT ID FROM engine WHERE engine.engine = '1.5'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'L4'),
(SELECT ID FROM transmission WHERE transmission.transmission = '6-speed manual'), '1FMZU63W72ZB66847', 9000, '24495.00', '2021'),

((SELECT ID FROM type WHERE type.type = 'SUV'), (SELECT ID FROM make WHERE make.make = 'Jeep'), (SELECT ID FROM model WHERE model.model = 'Wrangler'),
(SELECT ID FROM color WHERE color.color = 'Red'), (SELECT ID FROM engine WHERE engine.engine = '2.0'), (SELECT ID FROM cylinders WHERE cylinders.cylinders = 'L4'),
(SELECT ID FROM transmission WHERE transmission.transmission = '8-speed shiftable automatic'), '1GKKRRED3BJ228168', 12000, '46900.00', '2020');

/* creating a makeModel table*/
CREATE TABLE makeModel (
  makeID INT NOT NULL,
  modelID INT NOT NULL,
  PRIMARY KEY (makeID, modelID),
  FOREIGN KEY (makeID) REFERENCES make(ID),
  FOREIGN KEY (modelID) REFERENCES model(ID)
);

INSERT INTO makeModel(makeID, modelID)
SELECT DISTINCT make, model FROM vehicle;
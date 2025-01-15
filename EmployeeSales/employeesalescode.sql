/*
Janny Velazquez
DEALERSHIP DATABASE PROJECT
*/

USE dealership;

/* change the ISP portion from renovations  to dealership */
UPDATE employee
SET email = REPLACE(email, 'renovations', 'isp')
WHERE ID >= 1 AND ID <= 10;

ALTER TABLE sale
MODIFY COLUMN salePrice DECIMAL(8, 2) NOT NULL DEFAULT 0.0;

/*  insert into sale from sale.sql  */
INSERT INTO sale(employeeId, customerId, vehicleId) VALUES

((SELECT ID FROM employee WHERE employee.firstName = 'Igor' AND employee.lastName = 'Prince'),
(SELECT ID FROM customer WHERE customer.firstName = 'JohnPaul' AND customer.lastName = 'Clarke'),
(SELECT ID FROM vehicle WHERE vehicle.year = '2020' AND vehicle.make = (SELECT ID FROM make WHERE make.make = 'BMW')
AND vehicle.model = (SELECT ID FROM model WHERE model.model = '2 Series') AND vehicle.color = (SELECT ID FROM color WHERE color.color = 'Tanzanite Blue'))),

((SELECT ID FROM employee WHERE employee.firstName = 'Dante' AND employee.lastName = 'Rennie'),
(SELECT ID FROM customer WHERE customer.firstName = 'Imaani' AND customer.lastName = 'Wallace'),
(SELECT ID FROM vehicle WHERE vehicle.year = '2023' AND vehicle.make = (SELECT ID FROM make WHERE make.make = 'Nissan')
AND vehicle.model = (SELECT ID FROM model WHERE model.model = 'Altima') AND vehicle.color = (SELECT ID FROM color WHERE color.color = 'Mediterranean Blue'))),

((SELECT ID FROM employee WHERE employee.firstName = 'Thomas' AND employee.lastName = 'Waters'),
(SELECT ID FROM customer WHERE customer.firstName = 'Beverley' AND customer.lastName = 'Mckee'),
(SELECT ID FROM vehicle WHERE vehicle.year = '2022' AND vehicle.make = (SELECT ID FROM make WHERE make.make = 'Ford')
AND vehicle.model = (SELECT ID FROM model WHERE model.model = 'F-150') AND vehicle.color = (SELECT ID FROM color WHERE color.color = 'Velocity Blue'))),

((SELECT ID FROM employee WHERE employee.firstName = 'Haniya' AND employee.lastName = 'Kaiser'),
(SELECT ID FROM customer WHERE customer.firstName = 'Tulisa' AND customer.lastName = 'Roberts'),
(SELECT ID FROM vehicle WHERE vehicle.year = '2015' AND vehicle.make = (SELECT ID FROM make WHERE make.make = 'Ford')
AND vehicle.model = (SELECT ID FROM model WHERE model.model = 'F-350') AND vehicle.color = (SELECT ID FROM color WHERE color.color = 'Iconic Silver'))),

((SELECT ID FROM employee WHERE employee.firstName = 'Brian' AND employee.lastName = 'Roberts'),
(SELECT ID FROM customer WHERE customer.firstName = 'Javan' AND customer.lastName = 'Rennie'),
(SELECT ID FROM vehicle WHERE vehicle.year = '2014' AND vehicle.make = (SELECT ID FROM make WHERE make.make = 'BMW')
AND vehicle.model = (SELECT ID FROM model WHERE model.model = '6 Series') AND vehicle.color = (SELECT ID FROM color WHERE color.color = 'Sunset Orange'))),

((SELECT ID FROM employee WHERE employee.firstName = 'Umaiza' AND employee.lastName = 'Heath'),
(SELECT ID FROM customer WHERE customer.firstName = 'Efe' AND customer.lastName = 'House'),
(SELECT ID FROM vehicle WHERE vehicle.year = '2019' AND vehicle.make = (SELECT ID FROM make WHERE make.make = 'Mazda')
AND vehicle.model = (SELECT ID FROM model WHERE model.model = 'Axela') AND vehicle.color = (SELECT ID FROM color WHERE color.color = 'Mediterranean Blue')));

/*  set column salePrice equal to table vehicle,
column retail for each row in table sale  */
UPDATE sale
SET salePrice = (SELECT retail FROM vehicle
WHERE vehicleId = vehicle.ID);

CREATE VIEW saleView AS
  SELECT CONCAT( c.firstName, " ", c.lastName) AS 'Customer Name', CONCAT(c.address," ", cs.city, " ",cs.state, " ",c.zipCode) AS 'Customer Address',
  c.phone AS 'Customer Phone', c.email AS 'Customer Email', CONCAT(e.firstName, " ",e.lastName) AS 'Sales Associate', e.phone AS 'Sales Associate Phone',
  e.email AS 'Sales Associate Email', v.year AS 'Year', m.make AS 'Make', mo.model AS 'Model', co.color AS 'Color', t.type AS 'Type', v.vin AS 'VIN', s.salePrice as
  'Sale Price'
    FROM customer c, employee e, sale s,
    cityState cs, vehicle v, make m, model mo, color co, type t
    WHERE s.customerId = c.ID
    AND s.employeeId = e.ID
    AND s.vehicleId = v.ID
    AND c.zipCode = cs.zipCode
    AND v.make = m.ID
    AND v.model = mo.ID
    AND v.color = co.ID
    AND v.type = t.ID
    ORDER BY v.ID;
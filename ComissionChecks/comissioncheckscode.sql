/*
Janny Velazquez
DEALERSHIP DATABASE PROJECT
*/

USE dealership;

/* create stored procedure */

DELIMITER $$

DROP PROCEDURE IF EXISTS commissionCheck$$
CREATE PROCEDURE commissionCheck (IN employeeNum int, INOUT commission varchar(4000))
BEGIN

 -- declare variables FIRST!

DECLARE v_finished INTEGER DEFAULT 0;
DECLARE v_lines varchar(100) DEFAULT "--------------------------------------------------------------------------------";
DECLARE v_eFirst varchar(100) DEFAULT "";
DECLARE v_eLast varchar(100) DEFAULT "";
DECLARE v_eAddress varchar(100) DEFAULT "";
DECLARE v_eCity varchar(100) DEFAULT "";
DECLARE v_eState varchar(100) DEFAULT "";
DECLARE v_eZip varchar(100) DEFAULT "";
DECLARE v_retail decimal(8,2) DEFAULT 0.0;
DECLARE v_pay decimal(8,2) DEFAULT 0.0;
DECLARE v_count integer DEFAULT 0;
DECLARE v_eight decimal(3,2) DEFAULT .08;
DECLARE v_ten decimal(3,2) DEFAULT .10;
DECLARE v_fifteen decimal(3,2) DEFAULT .15;
DECLARE v_twenty decimal(3,2) DEFAULT .20;

-- declare cursor for employee
DEClARE employee_cursor CURSOR FOR
SELECT e.firstName,
       e.lastName,
       e.address,
       cs.city,
       cs.state,
       cs.zipCode,
       s.salePrice
FROM employee e, cityState cs, sale s
WHERE s.employeeId = e.ID
  AND e.zipCode = cs.zipCode
  AND s.employeeId = employeeNum;

-- declare NOT FOUND handler
DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET v_finished = 1;

-- open the cursor
OPEN employee_cursor;

 -- use a label for the LOOP
get_employee: LOOP
/*
fetch the data into the local variables
local variable names should be in the same order as the SELECT statement for the CURSO
*/
FETCH employee_cursor INTO v_eFirst, v_eLast,
  v_eAddress, v_eCity, v_eState, v_eZip ,v_retail;

 -- check if reached the end of the result set
  IF v_finished = 1 THEN
     LEAVE get_employee;
  END IF;

 -- increment the counter v_count by 1 (one)
SET v_count = v_count + 1;

-- build the commission check --
-- debug statements --
/*
SELECT v_eFirst;
SELECT v_eLast;
SELECT v_eAddress;
SELECT v_eCity;
SELECT v_eZip;
SELECT v_retail;
*/

IF v_count = 1 THEN
    -- calculate the commission
    IF v_retail >= 40000 THEN
        SET v_pay = v_retail * v_twenty;
    ELSEIF v_retail >= 30000 THEN
        SET v_pay = v_retail * v_fifteen;
    ELSEIF v_retail >= 20000 THEN
        SET v_pay = v_retail * v_ten;
    ELSE
        SET v_pay = v_retail * v_eight;
    END IF;

    -- debug statements --
    -- SELECT v_pay;

    SET commission = CONCAT(commission, '\n', v_lines, '\n');
    SET commission = CONCAT(commission, '\From:\n');
    SET commission = CONCAT(commission, '\nCGS 2545 Car Dealership\n');
    SET commission = CONCAT(commission, '\UCF\n');
    SET commission = CONCAT(commission, '\MSB 260\n\n');

    SET commission = CONCAT(commission, 'Pay to the order of:\n\n');
    SET commission = CONCAT(commission, v_eFirst, ' ', v_eLast, '\n');
    SET commission = CONCAT(commission, v_eAddress, '\n');
    SET commission = CONCAT(commission, v_eCity, ', ', v_eState, ' ', v_eZip, '\n');

    SET commission = CONCAT(commission, '\nIn the amount of:\n\n');
    SET commission = CONCAT(commission, '$', v_pay, '\n');
    SET commission = CONCAT(commission, '\n', v_lines, '\n');

END IF;
-- debug statements --
-- SELECT commission;

-- end the loop
END LOOP get_employee;

-- close the cursor
CLOSE employee_cursor;
 -- end the stored procedure
END$$
 -- reset the delimiter
DELIMITER ;


--  Igor Prince
SET @commission = "";
CALL commissionCheck(1, @commission);
SELECT @commission;

--  Dante Rennie
SET @commission = "";
CALL commissionCheck(2, @commission);
SELECT @commission;

--  Thomas Waters
SET @commission = "";
CALL commissionCheck(3, @commission);
SELECT @commission;

--  Haniya Kaiser
SET @commission = "";
CALL commissionCheck(5, @commission);
SELECT @commission;

--  Brian Roberts
SET @commission = "";
CALL commissionCheck(8, @commission);
SELECT @commission;

--  Umaiza Heath
SET @commission = "";
CALL commissionCheck(10, @commission);
SELECT @commission;

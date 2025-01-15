/*
Janny Velazquez
DEALERSHIP DATABASE PROJECT
*/ 
CREATE DATABASE dealership;

USE dealership;

CREATE TABLE employee (
    ID INT NOT NULL AUTO_INCREMENT,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    address VARCHAR(90) NOT NULL,
    zipCode CHAR(5) NOT NULL,
    phone CHAR(10) NOT NULL,
    email VARCHAR(90) NOT NULL UNIQUE,
    PRIMARY KEY (ID)
);

CREATE TABLE customer (
    ID INT NOT NULL AUTO_INCREMENT,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    address VARCHAR(90) NOT NULL,
    zipCode CHAR(5) NOT NULL,
    phone CHAR(10) NOT NULL,
    email VARCHAR(90) NOT NULL UNIQUE,
    PRIMARY KEY (ID)
);

CREATE TABLE vehicle (
    ID INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(50) NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    color VARCHAR(25) NOT NULL,
    engine VARCHAR(10) NOT NULL,
    cylinders VARCHAR(2) NOT NULL,
    transmission VARCHAR(10) NOT NULL,
    vin CHAR(17) NOT NULL,
    odometer INT NOT NULL check (odometer BETWEEN 0 AND 6) DEFAULT 0,
    retail DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (ID)
);

/* inserting customer data from customer.sql */ 
INSERT INTO customer (lastName, firstName, address, zipCode, phone, email)
VALUES
    ("Goodman", "Yvonne", "12 Creekside St", 37205, 2025550109, "ygoodman@isp.com"),
    ("Mackenzie", "Dante", "137 Wall St", 37205, 2025550112, "dmackenzie@isp.com"),
    ("Rollins", "Alysha", "411 Shirley St", 37205, 2025550115, "arollins@isp.com"),
    ("Gonzalez", "Avaya", "7771 Border Court", 37205, 2025550119, "agonzalez@isp.com"),
    ("Kelly", "Haniya", "6 South Sulphur Springs Street", 37205, 2025550121, "hkelly@isp.com"),
    ("Chambers", "Nathalie", "942 New Saddle Drive", 29710, 2025550122, "nchambers@isp.com"),
    ("Rollins", "Daniel", "9 Wrangler Ave", 29710, 2025550124, "drollins@isp.com"),
    ("Mckee", "Beverley", "7319 S. Greenview Drive", 29710, 2025550125, "bmckee@isp.com"),
    ("Lindsey", "Paris", "763 West Mulberry St", 29710, 2025550132, "plindsey@isp.com"),
    ("Melia", "Umaiza", "545 Ohio Ave", 29710, 2025550135, "umelia@isp.com"),
    ("Prince", "Nico", "20 Middle River Street", 44094, 2025550137, "nprince@isp.com"),
    ("Rennie", "Javan", "8112 North Country St", 44094, 2025550139, "jrennie@isp.com"),
    ("Waters", "Ali", "83 Rockland Lane", 44094, 2025550144, "awaters@isp.com"),
    ("Clarke", "JohnPaul", "1 Riverside Lane", 44094, 2025550153, "jpcClarke@isp.com"),
    ("Kaiser", "Dane", "694 Wall Road", 44094, 2025550155, "kdaiser@isp.com"),
    ("Newman", "Hammad", "9970 State Court", 30096, 2025550157, "hnewman@isp.com"),
    ("Guthrie", "Maha", "54 Woodsman Drive", 30096, 2025550161, "mguthrie@isp.com"),
    ("Roberts", "Tulisa", "7174 Studebaker Street", 30096, 2025550163, "troberts@isp.com"),
    ("Solis", "Robin", "8474 Wentworth Street", 30096, 2025550164, "rsolis@isp.com"),
    ("Heath", "Kavita", "796 Hartford St", 30096, 2025550165, "kheath@isp.com"),
    ("White", "Meera", "484 Bridge St", '08854', 2025550166, "mwhite@isp.com"),
    ("Esparza", "Bradlee", "7031 Gainsway St", '08854', 2025550173, "besparza@isp.com"),
    ("Leonard", "Leilani", "37 Monroe Street", '08854', 2025550175, "lleonard@isp.com"),
    ("Brook", "Stefanie", "7990 West Surrey St", '08854', 2025550179, "sbrook@isp.com"),
    ("Squires", "Grover", "7618 Madison Court", '08854', 2025550180, "gsquires@isp.com"),
    ("Kumar", "Jonathan", "25 Annadale Court", 33458, 2025550182, "jkumar@isp.com"),
    ("Neville", "Angus", "9841 Smith Drive", 33458, 2025550187, "aneville@isp.com"),
    ("Sparrow", "Uzair", "7999 Hall Street", 33458, 2025550188, "usparrow@isp.com"),
    ("Currie", "Amari", "8411 Pleasant St", 33458, 2025550194, "acurrie@isp.com"),
    ("Wallace", "Imaani", "33 Pierce Rd", 33458, 2025550195, "iwallace@isp.com"),
    ("House", "Efe", "97 High Point Street", 20706, 2025550196, "ehouse@isp.com"),
    ("Atkinson", "Atticus", "66 Harrison Dr", 20706, 2025550197, "aatkinson@isp.com"),
    ("Ramirez", "Michelle", "370 Hill Field Ave", 20706, 2025550198, "mramirez@isp.com"),
    ("Hassan", "Remy", "249 Devon Lane", 20706, 2025550199, "rhassan@isp.com"),
    ("Beck", "Jordana", "7911 Carson Lane", 20706, 2025550200, "jbeck@isp.com")
;

/* inserting employee data from employee.sql */ 
INSERT INTO employee (lastName, firstName, address, zipCode, phone, email)
VALUES 
    ("Prince", "Igor", "12 Creekside St", 92647, 2025550109, "iprince@renovations.com"),
    ("Rennie", "Dante", "137 Wall St", 38117, 2025550112, "drennie@renovations.com"),
    ("Waters", "Thomas", "411 Shirley St", 24210, 2025550115, "twaters@renovations.com"),
    ("Clarke", "Avaya", "7771 Border Court", 92078, 2025550119, "aclarke@renovations.com"),
    ("Kaiser", "Haniya", "6 South Sulphur Springs Street", 70121, 2025550121, "hkaiser@renovations.com"),
    ("Newman", "Victor", "942 New Saddle Drive", 70433, 2025550122, "vnewman@renovations.com"),
    ("Guthrie", "Douglas", "9 Wrangler Ave", 91764, 2025550124, "dguthrie@renovations.com"),
    ("Roberts", "Brian", "7319 S. Greenview Drive", 44223, 2025550125, "broberts@renovations.com"),
    ("Solis", "Paris", "763 West Mulberry St", 49016, 2025550132, "psolis@renovations.com"),
    ("Heath", "Umaiza", "545 Ohio Ave", 85260, 2025550135, "uheath@renovations.com")
;


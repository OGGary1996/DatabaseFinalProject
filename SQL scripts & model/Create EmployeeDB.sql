CREATE DATABASE Employee;
USE Employee;

CREATE TABLE Employees_Info(
	Emp_ID INT,
    SIN VARCHAR(12) NOT NULL,
    Lastname VARCHAR(50) NOT NULL,
    Firstname VARCHAR(50) NOT NULL,
    Birth_Date DATE NOT NULL,
    PRIMARY KEY (Emp_ID)
);
INSERT INTO Employees_Info()
VALUES 
	(97319,'516303417','Novak','Gerry','1986-08-24'),
    (33982,'867481381','Boychuk','Robin','1971-03-04'),
    (51537,'112893584','Smith','Kim','1982-11-29'),
    (41822,'717505366','Miller','Chris','1968-11-15'),
    (3571,'374853129','Hashimoto','Jo','1956-06-23'),
    (85833,'466128562','Singh','Lindsey','1975-03-15'),
    (81216,'615917448','Hansen','Jaimie','1983-03-04'),
    (32177,'306114858','DaSilva','Robbie','1951-02-18'),
    (52421,'936654021','O Day','Shelley','1963-07-31'),
    (72690,'655971502','Wong','Jodie','1987-01-01'),
    (72201,'635111876','Ramirez','Kelly','1986-09-29');
    
CREATE TABLE Address(
Emp_ID INT,
Street VARCHAR(100) NOT NULL,
City VARCHAR(20) NOT NULL,
Prov VARCHAR(10) NOT NULL,
Postal VARCHAR(10) NOT NULL,
PRIMARY KEY (Emp_ID),
FOREIGN KEY (Emp_ID) REFERENCES Employees_Info(Emp_ID) -- Build a 1:1 relationship between Address-Employees_Info
);

INSERT INTO Address()
VALUES
	(97319,'6803 Park Ave.','Moose Jaw','SK','S6H 1X7'),
    (33982,'117 East Broadway','Moose Jaw','SK','S6H 3P5'),
    (51537,'9745 University Drive','Regina','SK','S4P 7A3'),
    (41822,'72 Railway Ave.','Pense','SK','S0T 1K4'),
    (3571,'386 High Street','Tuxford','SK','S0L 8V6'),
    (85833,'1216 Willow Cres.','Pasqua','SK','S0H 5T8'),
    (81216,'95 Lakeshore Blvd.','Caronport','SK','S0T 3S7'),
    (32177,'4319 Main St.','Moose Jaw','SK','S6H 2M2'),
    (52421,'27 High St.','Tuxford','SK','S0L 8V6'),
    (72690,'59 Oslo Square','Moose Jaw','SK','S6H 2H9'),
    (72201,'1015 Brunswick Lane','Moose Jaw','SK','S6H 4T5');
    
CREATE TABLE Supervisor(
Supervisor_ID INT,
Supervisor VARCHAR(50) NOT NULL UNIQUE,
Supervisor_Cell VARCHAR(12) NOT NULL UNIQUE,
PRIMARY KEY (Supervisor_ID)
);
INSERT INTO Supervisor()
VALUES 
	(10,'Melissa Jones','306.304.8878'),
    (20,'Jason Goldberg','306.304.4545'),
    (30,'Chand Long','306.304.1212'),
    (40,'Joseph Snowdale','306.304.9091');
    
CREATE TABLE Department(
Department_ID INT,
Department VARCHAR(50) NOT NULL UNIQUE,
Supervisor_ID INT NOT NULL, -- 'NOT NULL' will set the modality from Department to Supervisor equals 1 
PRIMARY KEY (Department_ID),
FOREIGN KEY (Supervisor_ID) REFERENCES Supervisor(Supervisor_ID) -- Build N:1 relationship between Department-Supervisor
);
INSERT INTO Department()
VALUES 
	(100,'Front-End',10),
    (200,'Facility Operations',20),
    (300,'Kitchen',30),
    (400,'Pharmacy',40);
    
CREATE TABLE Job_Position(
Job_Code INT,
Position VARCHAR(40) NOT NULL UNIQUE,
Payrate DOUBLE NOT NULL,
Inc_Tax ENUM('YES','NO') NOT NULL,
Department_ID INT NOT NULL, -- 'NOT NULL' will set the modality from Job_Position to Department equals 1
PRIMARY KEY (Job_Code),
FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) -- Build N:1 relationship between Job_Position-Department
);
INSERT INTO Job_Position()
VALUES 
	(1000,'Greeter',10.25,'YES',100),
    (2000,'Cashier',11.99,'YES',100),
    (3000,'Stockperson',12.99,'NO',200),
    (4000,'Baker',17.5,'YES',300),
    (5000,'Butcher',18.0, 'YES',300),
    (6000,'Cleaner',13.5,'NO',200),
    (7000,'Pharmacist',30,'YES',400),
    (8000,'Assistant Baker',15.5,'YES',300);
    
CREATE TABLE Employment_Info(
Emp_ID INT,
Hire_Date DATE NOT NULL,
Job_Code INT NOT NULL, -- 'NOT NULL' will set the modality from Employment_Info to Job_Position equals 1
PRIMARY KEY (Emp_ID),
FOREIGN KEY (Emp_ID) REFERENCES Employees_Info(Emp_ID), -- Build a 1:1 relationship between Employment_Info-Employees_Info
FOREIGN KEY (Job_Code) REFERENCES Job_Position(Job_Code) --  -- Build N:1 relationship between Employment_Info-Job_Position
);
INSERT INTO Employment_Info()
VALUES 
	(97319,'2003-07-07',3000),
    (33982,'1998-10-11',5000),
    (51537,'2001-12-02',2000),
    (41822,'1985-02-19',2000),
    (3571,'1980-03-20',1000),
    (85833,'2002-07-27',7000),
    (81216,'2002-05-21',8000),
    (32177,'1983-07-07',4000),
    (52421,'1997-11-08',6000),
    (72690,'2003-08-26',6000),
    (72201,'2003-08-26',3000);
    
CREATE TABLE PayPeriod(
Period_ID INT,
Pay_Week_End_Date DATE NOT NULL UNIQUE,
Days_Available INT NOT NULL,
PRIMARY KEY (Period_ID)
);
INSERT INTO PayPeriod()
VALUES
	(130523,'2013-05-23',7),
    (130530,'2013-05-30',6);
    
CREATE TABLE Payroll(
Record_ID INT,
Emp_ID INT NOT NULL, -- 'NOT NULL' will set the modality from Payroll to Employees_Info equals 1
Period_ID INT NOT NULL, -- 'NOT NULL' will set the modality from Payroll to PayPeriod equals 1
Hours DOUBLE NOT NULL,
Over_Time DOUBLE NOT NULL,
Person_Hours_Worked DOUBLE NOT NULL,
PRIMARY KEY (Record_ID),
FOREIGN KEY (Emp_ID) REFERENCES Employees_Info(Emp_ID),
FOREIGN KEY (Period_ID) REFERENCES PayPeriod(Period_ID)
);
INSERT INTO Payroll()
VALUES
	(1,33982,130523,40.00,0.00,322.50),
    (2,33982,130530,38.25,0.00,236.00),
    (3,51537,130523,27.00,0.00,322.50),
    (4,41822,130523,40.00,0.00,322.50),
    (5,41822,130530,38.00,1.25,236.00),
    (6,3571,130523,40.00,0.00,322.50),
    (7,3571,130530,40.00,0.00,236.00),
    (8,85833,130523,37.50,0.50,322.50),
    (9,85833,130530,22.00,0.00,236.00),
    (10,81216,130523,40.00,0.00,322.50),
    (11,32177,130523,40.00,3.70,322.50),
    (12,32177,130530,40.00,2.25,236.00),
    (13,52421,130523,22.00,0.00,322.50),
    (14,52421,130530,40.00,4.50,236.00),
    (15,72690,130523,36.00,0.00,322.50),
    (16,72201,130530,18.00,0.00,236.00);
	
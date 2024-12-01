-- Query1
SELECT DISTINCT 
	EI.Firstname,
    EI.Lastname
FROM Payroll PR
JOIN Employees_Info EI USING (Emp_ID)
WHERE Hours >= 35.00; 

-- Query2
SELECT DISTINCT
	EI.Firstname,
    EI.Lastname
FROM Payroll PR
JOIN Employees_Info EI USING (Emp_ID)
WHERE Over_Time <> 0 AND Period_ID = 130530;

-- Query3
DELIMITER $$ -- change default delimiter from ; to $$, because there is a ; inside of the procedure
CREATE PROCEDURE getInfoByID(IN ID INT)
	SELECT 
		JP.Job_Code,
		S.Supervisor,
		S.Supervisor_Cell
	FROM Employment_Info EI
	JOIN Job_Position JP USING (Job_Code)
	JOIN Department D USING (Department_ID)
	JOIN Supervisor S USING (Supervisor_ID)
	WHERE EI.Emp_ID = ID;
END $$
DELIMITER ; -- change delimiter $$ to ; 
CALL getInfoByID(3571);

-- Query4
DELIMITER $$
CREATE PROCEDURE getInfoByCity(IN City_Name VARCHAR(20))
	SELECT 
		E.Firstname,
		E.Lastname,
		JP.Position,
		JP.Payrate AS 'Salary /H',
		D.Department,
		S.Supervisor
	FROM Address AD
	JOIN Employees_Info E USING (Emp_ID)
	JOIN Employment_Info EI USING (Emp_ID)
	JOIN Job_Position JP USING (Job_Code)
	JOIN Department D USING (Department_ID)
	JOIN Supervisor S USING (Supervisor_ID)
	WHERE AD.City = City_Name;
END $$
DELIMITER ;
CALL getInfoByCity('Moose Jaw');

-- Query5
DELIMITER $$
CREATE PROCEDURE getInfoBySupervisorLastName(IN Superviser_LastName VARCHAR(20))
	SELECT 
		E.Firstname,
		E.Lastname,
		JP.Job_Code
	FROM Supervisor S
	JOIN Department D USING (Supervisor_ID)
	JOIN Job_Position JP USING (Department_ID)
	JOIN Employment_Info EI USING (Job_Code)
	JOIN Employees_Info E USING (Emp_ID)
	WHERE Supervisor LIKE CONCAT('%',Superviser_LastName);
END $$
DELIMITER ;
CALL getInfoBySupervisorLastName('Long');
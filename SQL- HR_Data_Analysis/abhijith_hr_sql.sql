USE psyliq;

-- 1 
SELECT DISTINCT COUNT(EmployeeID)
FROM general_data;

-- 2
SELECT DISTINCT JobRole
FROM general_data;

-- 3 
SELECT AVG(Age)
FROM general_data;

-- 4
SELECT e.EmpName, e.Age 
FROM general_data e
WHERE YearsAtCompany > 5;

-- 5
SELECT COUNT(EmployeeID)
FROM general_data
GROUP BY Department;

-- 6
SELECT e.EmployeeID, g.EmpName
FROM  employee_survey_data e, general_data g
WHERE JobSatisfaction = 4 AND e.EmployeeID = g.EmployeeID;

-- 7
SELECT MAX(MonthlyIncome) 
FROM general_data;

-- 8
SELECT EmpName, EmployeeID
FROM general_data
WHERE BusinessTravel = "Travel_Rarely";

-- 9
SELECT DISTINCT MaritalStatus
FROM general_data;

-- 10
SELECT EmpName
FROM general_data
WHERE TotalWorkingYears > 2 AND YearsAtCompany < 4;

-- 11
SELECT EmpName
FROM general_data
WHERE JobLevel != JobRole;

-- 12
SELECT Department, AVG(DistanceFromHome)
FROM general_data
GROUP BY Department;

-- 13
SELECT EmpName, MonthlyIncome
FROM general_data
ORDER BY MonthlyIncome DESC
LIMIT 5;

-- 14
SELECT COUNT(EmpName) / (SELECT COUNT(*) FROM general_data ) * 100 AS "percentage"
FROM general_data
WHERE YearsSinceLastPromotion = 1;

-- 15
SELECT EmployeeID
FROM employee_survey_data
WHERE EnvironmentSatisfaction = (SELECT MAX(EnvironmentSatisfaction) FROM employee_survey_data)
UNION
SELECT EmployeeID
FROM employee_survey_data
WHERE EnvironmentSatisfaction = (SELECT MIN(EnvironmentSatisfaction) FROM employee_survey_data);

-- 16
SELECT e1.EmpName, e2.EmpName
FROM general_data e1, general_data e2
WHERE e1.JobRole = e2.JobRole
AND e1.MaritalStatus = e2.MaritalStatus;

-- 17
SELECT m.EmployeeID, e.EmpName
FROM manager_survey_data m, general_data e
WHERE PerformanceRating = 4 AND
m.EmployeeID = e.EmployeeID AND
e.TotalWorkingYears = (SELECT MAX(TotalWorkingYears) FROM general_data);

-- 18
SELECT AVG(g.Age), AVG(JobSatisfaction), g.BusinessTravel
FROM general_data g, employee_survey_data e
WHERE g.EmployeeID = e.EmployeeID
GROUP BY g.BusinessTravel;

-- 19
SELECT COUNT(EducationField), EducationField
FROM general_data
GROUP BY EducationField
ORDER BY COUNT(EducationField) DESC
LIMIT 1;

-- 20
SELECT EmpName, YearsAtCompany, YearsSinceLastPromotion
FROM general_data
WHERE YearsAtCompany = (SELECT MAX(YearsAtCompany) FROM general_data)
AND YearsSinceLastPromotion = 0;
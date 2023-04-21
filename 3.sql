SELECT NAME
FROM DEPARTMENT
WHERE ID =(
	SELECT DEPARTMENT_ID
	FROM EMPLOYEE
	GROUP BY DEPARTMENT_ID
	HAVING SUM(SALARY) = 
		(
		SELECT TOP (1) SUM(SALARY) AS S
		FROM EMPLOYEE
		GROUP BY DEPARTMENT_ID
		ORDER BY S DESC
		)
	)
;
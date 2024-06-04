-- =ANY/IN , ALL : dùng cho table

-- VD: Lấy ra tất cả chức vụ có ít người nhất
SELECT position.*,COUNT(account_id) AS account_count
FROM position
LEFT JOIN account USING (position_id)
GROUP BY position_id
HAVING COUNT(account_id) = (
		SELECT MIN(account_count)
		FROM (
			SELECT COUNT(account_id) AS account_count
			FROM position
			LEFT JOIN account USING (position_id)
			GROUP BY position_id) AS t);
            
-- CTE : Common Table Expression : Dùng khi truy vấn trung lập 
	WITH c1 AS(
		SELECT department.* , COUNT(account_id) AS "account_count"
        FROM department	
        LEFT JOIN account USING(department_id)
        GROUP BY department_id
    )
    SELECT *
    FROM c1
    WHERE account_count = (
		SELECT MAX(account_count)
		FROM c1
    );
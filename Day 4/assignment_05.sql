-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
	CREATE OR REPLACE VIEW view_01 AS
    SELECT *
	FROM account
	WHERE department_id = 	(
							SELECT department_id
							FROM department
							WHERE department_name = "SALE"
							);
    
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
	CREATE OR REPLACE VIEW view_02 AS
	SELECT account.*
	FROM account
	LEFT JOIN group_account USING (account_id)
	GROUP BY account_id
	HAVING COUNT(group_id) =
		(SELECT MAX(group_count)
		FROM 
			(SELECT COUNT(group_id) AS group_count
			FROM account
			LEFT JOIN group_account USING (account_id)
			GROUP BY account_id) AS t);
    
    SELECT * FROM view_02;
    -- use CTE: Dùng khi truy vấn trung lập 
    CREATE OR REPLACE VIEW view_02 AS
    WITH Question2 AS (
		SELECT account.*,COUNT(group_id) AS group_count
			FROM account
			LEFT JOIN group_account USING (account_id)
			GROUP BY account_id
    )
    SELECT *
    FROM Question2
    WHERE group_count = (
		SELECT MAX(group_count)
		FROM Question2
    );
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài 
-- (content quá 300 từ được coi là quá dài) và xóa nó đi
	CREATE OR REPLACE VIEW view_03 AS
	SELECT * 
    FROM question
    WHERE char_length(content) > 300;
    
    DELETE FROM view_03;
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
	-- Cách 1: subquery
    SELECT department.*
	FROM department
	LEFT JOIN account USING (department_id)
	GROUP BY department_id
	HAVING COUNT(account_id) =
		(SELECT MAX(account_count)
		FROM
			(SELECT COUNT(account_id) AS account_count
			FROM department
			LEFT JOIN account USING (department_id)
			GROUP BY department_id) AS t);
	-- Cách 2: CTE Dùng khi truy vấn trung lập 
    CREATE OR REPLACE VIEW view_04 AS
	WITH c4 AS (
		SELECT department.*, COUNT(account_id) AS account_count
		FROM department
		LEFT JOIN account USING (department_id)
		GROUP BY department_id
	)
	SELECT *
	FROM c4
	WHERE account_count =
		(SELECT MAX(account_count)
		FROM c4);
        
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo.
	CREATE OR REPLACE VIEW view_05 AS
	SELECT *
	FROM question
	WHERE creator_id IN
		(SELECT account_id
		FROM account
		WHERE full_name LIKE "Nguyễn %");
-- STORED PROCEDURE: Thủ lục lưu trữ

-- Tao PRO lấy phòng theo ID
DROP PROCEDURE IF EXISTS sp_01;
DELIMITER $$ -- DELIMITER: Đổi kí tự phân cách từ ; -> $$
	CREATE PROCEDURE sp_01(IN id_department_id INT)
    BEGIN
		SELECT *
        FROM department
        WHERE department_id = id_department_id;
    END $$
DELIMITER ; -- DELIMITER: Đổi kí tự phân cách từ $$ -> ;

CALL sp_01(100);

SET GLOBAL log_bin_trust_function_creators = 1;
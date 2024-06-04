-- LOCAL VARiABALE
-- KHỐI BEGIN - END
-- KEY WORK INIT : DECLARE
-- DECLARE id INT

-- SESSON VARIAB:E
-- SCOOPE : Toàn Sesson
-- KEY WORK : SET
-- 
SET @age = 18;
SELECT @age;

-- GLOBAL VARIABLE : Biến toàn cục
-- SCOPE : Toàn cục
-- KEYWORK : SET
-- SHOW VARIABLES LIST
SHOW VARIABLES;
-- Set time out login in 5 seccons
SET GLOBAL connect_timeout = 5;

-- TRIGGER
-- Thời điểm : AFTER, BEFORE
-- Sự kiện : INSERT, UPDATE, DELETE
-- Tham chiếu : old, new 

DROP TRIGGER IF EXISTS trigger_01;
DELIMITER $$
CREATE TRIGGER trigger_01
BEFORE INSERT ON group_account
FOR EACH ROW
BEGIN
	IF NEW.joined_date > CURRENT_DATE THEN
		SET NEW.joined_date = CURRENT_DATE;
    END IF;
END $$
DELIMITER ;

INSERT INTO group_account (group_id, account_id, joined_date)
VALUES (5, 10, "4000-04-04");

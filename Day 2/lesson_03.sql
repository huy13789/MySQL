select * from department;
-- IN
select * from department where department_id in (2, 4, 5, 3, 1);

-- LIKE 
-- _ : đại diện 1 kí tự
-- & 

    select substring_index("Ngô Nguyễn Huy", " ", -1);
    -- số âm từ phải duyệt qua trái >< số dương
-- Mệnh đề group by
	select duration, created_date, count(exam_id) as exam_cout
	from exam
	group by duration, created_date
	order by duration, created_date;

-- having 
	select duration, created_date, count(exam_id) as exam_cout
	from exam
	group by duration, created_date having count(exam_id) > 1
	order by duration, created_date;
    
-- Cập nhật dữ liệu
UPDATE department
SET department_name = "Phòng chờ"
WHERE department_id = 1;

-- Xóa dữ liệu
DELETE FROM exam
WHERE duration IS NULL;
    
DROP DATABASE IF EXISTS assignment_03;
CREATE DATABASE assignment_03;
USE assignment_03;

-- Tạo bảng department
DROP TABLE IF EXISTS department;
CREATE TABLE department (
  department_id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(50) 
);

-- Tạo bảng position
DROP TABLE IF EXISTS position;
CREATE TABLE position (
  position_id INT PRIMARY KEY AUTO_INCREMENT,
  position_name ENUM("Dev", "Test", "Scrum Master", "PM") 
);

-- Tạo bảng account
DROP TABLE IF EXISTS account;
CREATE TABLE account (
  account_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(50) ,
  username VARCHAR(50) ,
  full_name VARCHAR(50) ,
  department_id INT,
  position_id INT,
  created_date DATE ,
  FOREIGN KEY (department_id) REFERENCES department (department_id),
  FOREIGN KEY (position_id) REFERENCES position (position_id)
);

-- Tạo bảng group
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  group_id INT PRIMARY KEY AUTO_INCREMENT,
  group_name VARCHAR(50) ,
  creator_id INT,
  created_date DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (creator_id) REFERENCES account (account_id)
);

-- Tạo bảng group_account
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account (
  group_id INT,
  account_id INT,
  joined_date DATE DEFAULT (CURRENT_DATE),
  PRIMARY KEY (group_id, account_id),
  FOREIGN KEY (group_id) REFERENCES `group` (group_id),
  FOREIGN KEY (account_id) REFERENCES account (account_id)
);

-- Tạo bảng type_question
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question (
  type_id INT PRIMARY KEY AUTO_INCREMENT,
  type_name ENUM("Essay", "Multiple-Choice") 
);

-- Tạo bảng category_question
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(50) 
);

-- Tạo bảng question
DROP TABLE IF EXISTS question;
CREATE TABLE question (
  question_id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(50) ,
  category_id INT,
  type_id INT,
  creator_id INT,
  created_date DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (category_id) REFERENCES category_question (category_id),
  FOREIGN KEY (type_id) REFERENCES type_question (type_id),
  FOREIGN KEY (creator_id) REFERENCES account (account_id)
);

-- Tạo bảng answer
DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
  answer_id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(50),
  question_id INT,
  is_correct BOOLEAN ,
  FOREIGN KEY (question_id) REFERENCES question (question_id)
);

-- Tạo bảng exam
DROP TABLE IF EXISTS exam;
CREATE TABLE exam (
  exam_id INT PRIMARY KEY AUTO_INCREMENT,
  code CHAR(10),
  title VARCHAR(50) ,
  category_id INT,
  duration INT,
  creator_id INT,
  created_date DATE DEFAULT (CURRENT_DATE),
  FOREIGN KEY (category_id) REFERENCES category_question (category_id),
  FOREIGN KEY (creator_id) REFERENCES account (account_id)
);

-- Tạo bảng exam_question
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question (
  exam_id INT,
  question_id INT,
  PRIMARY KEY (exam_id, question_id),
  FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
  FOREIGN KEY (question_id) REFERENCES question (question_id)
);

-- Thêm dữ liệu cho bảng department
INSERT INTO department (department_name)
VALUES         ("Marketing"  ),
            ("Sale"     ),
            ("Bảo vệ"    ),
            ("Nhân sự"   ),
            ("Kỹ thuật"   ),
            ("Tài chính"  ),
            ("Phó giám đốc" ),
            ("Giám đốc"   ),
            ("Thư kí"    ),
            ("Bán hàng"   ); 

-- Thêm dữ liệu cho bảng position
INSERT INTO position  (position_name )
VALUES         ("Dev"     ),
            ("Test"    ),
            ("Scrum Master"),
            ("PM"     );

-- Thêm dữ liệu cho bảng account
INSERT INTO account (email              , username   , full_name      , department_id, position_id, created_date)
VALUES       ("haidang29productions@gmail.com", "dangblack"  , "Nguyen Hai Dang"  , 5      , 1     , "2020-03-05"),
          ("account1@gmail.com"      , "quanganh"  , "Tong Quang Anh"  , 1      , 2     , "2020-03-05"),
          ("account2@gmail.com"      , "vanchien"  , "Nguyen Van Chien" , 2      , 3     , "2020-03-07"),
          ("account3@gmail.com"      , "cocoduongqua", "Duong Do"     , 3      , 4     , "2020-03-08"),
          ("account4@gmail.com"      , "doccocaubai" , "Nguyen Chien Thang", 4      , 4     , "2020-03-10"),
          ("dapphatchetngay@gmail.com"   , "khabanh"   , "Ngo Ba Kha"    , 6      , 3     , "2020-04-05"),
          ("songcodaoly@gmail.com"     , "huanhoahong" , "Bui Xuan Huan"   , 2      , 2     , "2020-04-05"),
          ("sontungmtp@gmail.com"     , "tungnui"   , "Nguyen Thanh Tung" , 8      , 1     , "2020-04-07"),
          ("duongghuu@gmail.com"      , "duongghuu"  , "Duong Van Huu"   , 9      , 2     , "2020-04-07"),
          ("vtiaccademy@gmail.com"     , "vtiaccademy" , "Vi Ti Ai"     , 10      , 1     , "2020-04-09");

-- Thêm dữ liệu cho bảng group
INSERT INTO `group` (group_name     , creator_id, created_date)
VALUES       ("Testing System"  , 5     , "2019-03-05"),
          ("Developement"   , 1     , "2020-03-07"),
          ("VTI Sale 01"   , 2     , "2020-03-09"),
          ("VTI Sale 02"   , 3     , "2020-03-10"),
          ("VTI Sale 03"   , 4     , "2020-03-28"),
          ("VTI Creator"   , 6     , "2020-04-06"),
          ("VTI Marketing 01" , 7     , "2020-04-07"),
          ("Management"    , 8     , "2020-04-08"),
          ("Chat with love"  , 9     , "2020-04-09"),
          ("Vi Ti Ai"     , 10    , "2020-04-10");

-- Thêm dữ liệu cho bảng group_account
INSERT INTO group_account  (group_id, account_id, joined_date )
VALUES           (1    , 1     , "2019-03-05"),
              (2    , 2     , "2020-03-07"),
              (3    , 3     , "2020-03-09"),
              (2    , 4     , "2020-03-10"),
              (5    , 5     , "2020-03-28"),
              (2    , 6     , "2020-04-06"),
              (7    , 7     , "2020-04-07"),
              (3    , 8     , "2020-04-08"),
              (2    , 9     , "2020-04-09"),
              (10   , 10    , "2020-04-10");

-- Thêm dữ liệu cho bảng type_question
INSERT INTO type_question (type_name) VALUES ("Essay"), ("Multiple-Choice"); 

-- Thêm dữ liệu cho bảng category_question
INSERT INTO category_question  (category_name)
VALUES             ("Java"    ),
                ("ASP.NET"  ),
                ("ADO.NET"  ),
                ("SQL"    ),
                ("Postman"  ),
                ("Ruby"    ),
                ("Python"   ),
                ("C++"    ),
                ("C Sharp"  ),
                ("PHP"    ); 

-- Thêm dữ liệu cho bảng question
INSERT INTO question  (content     , category_id, type_id, creator_id, created_date)
VALUES         ("Câu hỏi về Java", 1     , 1   , 1     , "2020-04-05"),
            ("Câu Hỏi về PHP" , 10     , 2   , 2     , "2020-04-05"),
            ("Hỏi về C#"   , 9     , 2   , 3     , "2020-04-06"),
            ("Hỏi về Ruby"  , 6     , 1   , 2     , "2020-04-06"),
            ("Hỏi về Postman" , 5     , 1   , 3     , "2020-04-06"),
            ("Hỏi về ADO.NET" , 3     , 2   , 6     , "2020-04-06"),
            ("Hỏi về ASP.NET" , 2     , 1   , 2     , "2020-04-06"),
            ("Hỏi về C++"   , 8     , 1   , 8     , "2020-04-07"),
            ("Hỏi về SQL"   , 4     , 2   , 3     , "2020-04-07"),
            ("Hỏi về Python" , 7     , 1   , 10    , "2020-04-07");

-- Thêm dữ liệu cho bảng answer
INSERT INTO answer (content   , question_id, is_correct)
VALUES       ("Trả lời 01", 1     , 0     ),
          ("Trả lời 02", 1     , 1     ),
          ("Trả lời 03", 1     , 0     ),
          ("Trả lời 04", 1     , 1     ),
          ("Trả lời 05", 2     , 1     ),
          ("Trả lời 06", 3     , 1     ),
          ("Trả lời 07", 4     , 0     ),
          ("Trả lời 08", 8     , 0     ),
          ("Trả lời 09", 9     , 1     ),
          ("Trả lời 10", 10     , 1     );

-- Thêm dữ liệu cho bảng exam
INSERT INTO exam  (code  , title      , category_id, duration, creator_id, created_date)
VALUES       ("VTIQ001", "Đề thi C#"   , 1     , 60   , 3     , "2019-04-05"),
          ("VTIQ002", "Đề thi PHP"  , 10     , 60   , 1     , "2019-04-05"),
          ("VTIQ003", "Đề thi C++"  , 9     , 120   , 2     , "2019-04-07"),
          ("VTIQ004", "Đề thi Java"  , 7     , 60   , 3     , "2020-04-08"),
          ("VTIQ005", "Đề thi Ruby"  , 5     , 120   , 4     , "2020-04-10"),
          ("VTIQ006", "Đề thi Postman", 8     , 60   , 6     , "2020-04-05"),
          ("VTIQ007", "Đề thi SQL"  , 7     , 60   , 1     , "2020-04-05"),
          ("VTIQ008", "Đề thi Python" , 8     , 60   , 8     , "2020-04-07"),
          ("VTIQ009", "Đề thi ADO.NET", 4     , 90   , 3     , "2020-04-07"),
          ("VTIQ010", "Đề thi ASP.NET", 7     , 90   , 10    , "2020-04-08");

-- Thêm dữ liệu cho bảng exam_question
INSERT INTO exam_question  (question_id, exam_id)
VALUES           (1     , 1   ),
              (2     , 2   ),
              (3     , 1   ),
              (4     , 4   ),
              (5     , 1   ),
              (6     , 2   ),
              (7     , 1   ),
              (8     , 8   ),
              (9     , 2   ),
              (10     , 10    );

-- Question 2: lấy ra tất cả các phòng ban
	select * from department;
    
-- Question 3: lấy ra id của phòng ban "Sale"
	select department_id from department where department_name like "SALE";
    
-- Question 4: lấy ra thông tin account có full name dài nhất
	select char_length(full_name) from account
    order by char_length(full_name) DESC
    limit 1;
    
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
	select * 
    from account
    where department_id = 3
    order by char_length(full_name) desc;
    
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
	SELECT `group_name`
	FROM `group`
	WHERE created_date < "2019/12/20";
    
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
	select question_id
    from answer
    group by question_id having count(question_id) >= 4;
    
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo
-- trước ngày 20/12/2019
	SELECT code
	FROM exam
	WHERE duration >= 60 AND created_date < "2019-12-20";
    
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
	select * 
    from `group`
    order by created_date desc
    limit 5;
    
-- Question 10: Đếm số nhân viên thuộc department có id = 2
	select count(*) as account_count
    from account
    where department_id = 2

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
	select * 
    from account 
    where full_name like "D%o";
    
    select substring_index("Ngô Nguyễn Huy", " ", -1);
    -- số âm từ phải duyệt qua trái >< số dương
    
	select * 
    from account 
    where substring_index(full_name, " ", -1) like "D%o";
    
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
	delete from exam
	where created_date < '2019/12/20';
    
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
	delete from question
	where content like "câu hỏi%"
    
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
	UPDATE account
	SET username = "Phòng chờ", email = "loc.nguyenba@vti.com.vn"
	WHERE account_id = 5;
    
-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
	UPDATE group_account
	SET group_id = 4
	WHERE account_id = 5;
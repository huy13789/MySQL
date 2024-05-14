-- Xóa cơ sở dữ liệu (nếu tồn tại)
drop database if exists lesson_01;

-- Tạo cơ sở dữ liệu
create database lesson_01;

-- Show toàn bộ cơ sở dữ liệu
show databases;

-- Chọn cơ sở dữ liệu muốn thao tác
use lesson_01;
-- Ctrl + Enter : chạy code tại con trỏ 

-- Tạo table
create table department (
	id int,
    name varchar(50),
    create_date DATE
);

-- Insert dada into table
insert into department(id, name, create_date) 
values (1, "Bảo vệ", "2020-04-19"),
	   (2, "Nhân viên", "2020-04-120");

-- Hiển thị dữ liệu
table department;
-- or
select * from department;

-- Tạo bảng auto_increment
create table product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

insert into product(id, name) 
values (1, "Bảo vệ");
insert into product(id, name) 
values (2, "Nhân viên");
insert into product(name)
values ("Cộng tác viên");

-- UNIQUE KEY
drop table if exists customer;
create table customer (
	id int primary key auto_increment,
    email VARCHAR(50) unique
);
INSERT INTO `lesson_01`.`customer`(`email`)
VALUES ('hi');

DROP TABLE IF EXISTS department;
CREATE TABLE department (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
--
DROP TABLE IF EXISTS account;
CREATE TABLE account (
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);
--
INSERT INTO department (id, name)
VALUES (100, "Bảo vệ");
INSERT INTO account (full_name, department_id)
VALUES ("Nguyễn Văn Khoa", 100);





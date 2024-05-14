-- Ngô Nguyễn Huy

drop database if exists assignment_01;
create database assignment_01;
use assignment_01;

-- table 1 : department
drop table if exists department;
create table department (
	department_id int,
    department_name varchar(50)
);

-- table 2 : position
drop table if exists position;
create table position (
	position_id int,
    position_name varchar(50)
);

-- table 3 : account
drop table if exists account;
create table account (
	account_id int,
    email varchar(50),
    user_name varchar(50),
    full_name varchar(50),
    department_id int,
    position_id int,
    create_date date
);

-- table 4 : group
drop table if exists `group`;
create table `group` (
	group_id int,
    group_name varchar(50),
    create_id int,
    create_date date
);

-- table 5 : groupaccount
drop table if exists groupaccount;
create table groupaccount (
	groupaccount_id int,
    account_id int,
    join_date date
);

-- table 6 : typequestion
drop table if exists typequestion;
create table typequestion (
	typequestion_id int,
    typequestion_name varchar(50)
);

-- table 7 : qategoryquestion
drop table if exists qategoryquestion;
create table qategoryquestion (
	category_id INT,
    category_name VARCHAR(50)
);

-- table 8 : question
drop table if exists question;
create table question (
	question_id INT,
    content VARCHAR(50),
    category_id INT,
    type_id INT,
    creator_id INT,
    created_date DATE
);

-- table 9: answer
drop table if exists answer;
create table answer (
	answer_id INT,
    content VARCHAR(50),
    question_id INT,
    is_correct INT
);

-- table 10: exam
drop table if exists exam;
create table exam (
	exam_id INT,
    code VARCHAR(50),
    title VARCHAR(50),
    category_id INT,
    duration INT,
    creator_id INT,
    created_date DATE
);

-- table 11 : exam_question
drop table if exists exam_question;
create table exam_question (
	exam_id INT,
    question_id INT
);
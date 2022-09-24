create database `student-management`;
use `student-management`;
create table student(
id int not null,
name varchar(45),
age int null,
country varchar(45),
primary key(id)
);
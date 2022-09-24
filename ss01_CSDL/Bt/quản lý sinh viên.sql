use `student-management`;
create table `Class`(
id int not null,
`name` varchar(45),
primary key(id));


create table Teacher(
id int not null,
primary key(id),
name varchar(50),
age int null,
country varchar(50)
);
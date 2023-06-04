create database exem;
use exem;

create table product(
pr_id int primary key,
pr_name varchar(50),
pr_price double,
quantity int,
color varchar(50),
description_pr varchar(100),
c_id int,
 foreign key (c_id)references Category(c_id));

create table Category(
c_id int primary key,
c_name varchar(50)
);

insert into Category
values(1,'Dien thoai'),
(2,'Laptop');

insert into product 
values
(1,'Iphone10',1000,5,'Black','good',1),
(2,'Iphone11',5000,7,'Black','good',1),
(3,'Iphone12',12000,25,'Black','good',1),
(4,'Iphone13',20000,15,'Black','good',1),
(5,'Laptop',10000,5,'Black','good',2);
select pr_id,pr_name,pr_price,quantity,color , description_pr,c.c_name from product pr join category c on pr.c_id = c.c_id;
select pr_id ,pr_name ,pr_price ,quantity ,color ,description_pr ,c_name
 from product pr join caregory c on pr.c_id=c.c_id;
 
 select pr_id,pr_name,pr_price,quantity,color , description_pr,c.c_name from product pr join category c on pr.c_id = c.c_id where pr_id = 1;
 select * from category;
 
 update product set pr_name = 'LaptopAcer', pr_price = 20000, quantity = 10, color= 'red', description_pr= 'good', c_id = 2 where pr_id = 5;
 